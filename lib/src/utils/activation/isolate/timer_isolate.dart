import 'dart:async';
import 'dart:isolate';

import 'package:application/src/utils/constants/constants.dart' as constants;

class TimerIsolate {
  TimerIsolate({
    required this.canReconnectStream,
    required this.timerReconnectStream,
    required this.reconnectRepeatStream,
  }) {
    _initialize();
  }

  final Stream<bool> canReconnectStream;
  final Stream<String> timerReconnectStream;
  final Stream<bool> reconnectRepeatStream;

  Stream<int> get onTimerValueChange => _globalTimerValueController.stream;
  final _globalTimerValueController = StreamController<int>.broadcast();

  Stream<bool> get onTimerVisibleChange => _globalTimerVisibleController.stream;
  final _globalTimerVisibleController = StreamController<bool>.broadcast();

  Isolate? _isolate;
  static Timer? _timer;
  static StreamSubscription<Object?>? _receivePortSubscription;
  StreamSubscription<Object?>? _mainReceivePortSubscription;
  StreamSubscription<bool>? _canReconnectTimerSubscription;
  StreamSubscription<bool>? _repeatReconnectTimerSubscription;
  StreamSubscription<String>? _reconnectTimerMessageSubscription;

  static bool _canReconnect = false;
  static bool _repeat = false;
  static int _currentSecond = 0;
  static bool _canShowDialog = false;

  static late SendPort _sendPort;
  late SendPort _isolateSendPort;
  late Completer _completer;

  Future<void> _initialize() async {
    final mainReceiverPort = ReceivePort();
    _isolate = await Isolate.spawn<SendPort>(
      _timerIsolateSpawn,
      mainReceiverPort.sendPort,
    );
    _completer = Completer<SendPort>();
    _mainReceivePortSubscription =
        mainReceiverPort.listen(_listenMainReceivePort);
    _isolateSendPort = await _completer.future as SendPort;
    _listenCanReconnectTimer();
    _listenReconnectTimerMessage();
    _listenRepeatReconnectTimer();
  }

  ///Create timer isolate spawn
  static void _timerIsolateSpawn(SendPort sendPort) {
    _sendPort = sendPort;
    _createTimerIsolate();
  }

  ///Create timer isolate
  static void _createTimerIsolate() {
    final timerReceivePort = ReceivePort();
    _sendPort.send(timerReceivePort.sendPort);
    _receivePortSubscription = timerReceivePort.listen(_listenReceivePort);
    _createTimer();
  }

  ///Create global timer
  static void _createTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
    _currentSecond = constants.activationIntervalDuration.inSeconds;
  }

  ///Update global timer value
  static void _updateTimer(_) {
    if (_canReconnect) {
      _currentSecond -= 1;

      ///Update can show dialog value
      if (_canShowDialog) {
        _sendPort.send(_currentSecond);
      }

      ///Show dialog
      if (_currentSecond == constants.showTimerDuration.inSeconds) {
        _canShowDialog = true;
        _sendPort
          ..send(_currentSecond)
          ..send(_canShowDialog);
      }

      ///Finish timer
      if (_currentSecond == 0) {
        _sendPort.send(false);
        if (_repeat) {
          _currentSecond = constants.activationIntervalDuration.inSeconds;
          _updateTimer(_);
        } else {
          _timer?.cancel();
        }
      }
    }
  }

  ///Listen main receive port
  void _listenMainReceivePort(Object? message) {
    ///Connect isolates
    if (message is SendPort) {
      _completer.complete(message);
    }

    /// Update timer value
    if (message is int) {
      _globalTimerValueController.add(message);
    }

    ///Update show timer value
    if (message is bool) {
      _globalTimerVisibleController.add(message);
    }
  }

  ///This function listen isolate messages
  static void _listenReceivePort(Object? message) {
    ///Listen reconnect notifier changes
    if (message is bool) {
      _canReconnect = message;
    }

    ///Listen can repeat reconnect timer
    if (message is _RepeatReconnectType) {
      _repeat = message == _RepeatReconnectType.acceptRepeat;
    }

    ///Listen reconnect event
    if (message is String) {
      if (message == 'reconnect') {
        _canShowDialog = false;
        _reconnect();
      }
    }
  }

  ///Remove global timer and create new global timer
  static void _reconnect() {
    if (_canReconnect) {
      _sendPort.send(_canShowDialog);
      _timer?.cancel();
      _createTimer();
    }
  }

  void _listenCanReconnectTimer() {
    _canReconnectTimerSubscription =
        canReconnectStream.listen(_canReconnectTimerListener);
  }

  void _listenRepeatReconnectTimer() {
    _repeatReconnectTimerSubscription =
        reconnectRepeatStream.listen(_repeatTimerReconnectListener);
  }

  void _listenReconnectTimerMessage() {
    _reconnectTimerMessageSubscription =
        timerReconnectStream.listen(_reconnectTimerMessageListener);
  }

  void _canReconnectTimerListener(bool canReconnect) {
    _isolateSendPort.send(canReconnect);
  }

  void _repeatTimerReconnectListener(bool repeat) {
    final repeatReconnectType = repeat
        ? _RepeatReconnectType.acceptRepeat
        : _RepeatReconnectType.ignoreRepeat;

    _isolateSendPort.send(repeatReconnectType);
  }

  void _reconnectTimerMessageListener(String message) {
    if (message == 'reconnect') {
      _isolateSendPort.send(message);
    }
  }

  Future<void> dispose() async {
    _timer?.cancel();
    _isolate?.kill();
    await _receivePortSubscription?.cancel();
    await _mainReceivePortSubscription?.cancel();
    await _canReconnectTimerSubscription?.cancel();
    await _repeatReconnectTimerSubscription?.cancel();
    await _reconnectTimerMessageSubscription?.cancel();
    await _globalTimerValueController.close();
    await _globalTimerValueController.close();
  }
}

enum _RepeatReconnectType { acceptRepeat, ignoreRepeat }
