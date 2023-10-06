import 'dart:async';

import 'package:application/src/utils/activation/bloc/event.dart';
import 'package:application/src/utils/activation/bloc/state.dart';
import 'package:application/src/utils/activation/isolate/timer_isolate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckIsActiveBloc extends Bloc<CheckIsActiveEvent, CheckIsActiveState> {
  CheckIsActiveBloc({
    required this.activationIntervalDuration,
    required this.showTimerDuration,
    required this.lazy,
  }) : super(const CheckIsActiveInitial()) {
    on<CheckActivationEvent>(_onCheckActivationEventToState);
    on<ChangeCanReconnectTimerValueEvent>(
        _onChangeCanReconnectTimerValueEventToState,);
    on<ReconnectTimerEvent>(_onReconnectTimerEventToState);
    on<RepeatTimerValueChangedEvent>(_onRepeatTimerValueChangedEventToState);
    on<GlobalTimerDurationChangedEvent>(
        _onGlobalTimerDurationChangedEventToState,);
    on<GlobalTimerVisibleChangedEvent>(
        _onGlobalTimerVisibleChangedEventToState,);
    add(const CheckActivationEvent());
  }

  final Duration activationIntervalDuration;
  final Duration showTimerDuration;
  final bool lazy;

  final StreamController<bool> _canReconnectController = StreamController();
  final StreamController<String> _timerReconnectController = StreamController();
  final StreamController<bool> _timerReconnectRepeatController =
      StreamController();

  bool get showTimer => _showTimer;
  bool _showTimer = false;

  StreamSubscription<int>? _timerValueChangeSubscription;
  StreamSubscription<bool>? _timerVisibleSubscription;
  TimerIsolate? _timerIsolate;

  Future<void> _onCheckActivationEventToState(
    CheckActivationEvent event,
    Emitter<CheckIsActiveState> emit,
  ) async {
    _timerIsolate = TimerIsolate(
      canReconnectStream: _canReconnectController.stream,
      timerReconnectStream: _timerReconnectController.stream,
      reconnectRepeatStream: _timerReconnectRepeatController.stream,
    );

    _timerValueChangeSubscription =
        _timerIsolate?.onTimerValueChange.listen(_globalTimerValueChange);
    _timerVisibleSubscription =
        _timerIsolate?.onTimerVisibleChange.listen(_onTimerVisibleChange);

    if (!lazy) {
      add(const ChangeCanReconnectTimerValueEvent(canReconnect: true));
    }
  }

  Future<void> _onChangeCanReconnectTimerValueEventToState(
    ChangeCanReconnectTimerValueEvent event,
    Emitter<CheckIsActiveState> emit,
  ) async {
    final canReconnect = event.canReconnect;
    _canReconnectController.add(canReconnect);
    emit(ChangeCanReconnectTimerValueState(canReconnect: canReconnect));
  }

  Future<void> _onReconnectTimerEventToState(
    ReconnectTimerEvent event,
    Emitter<CheckIsActiveState> emit,
  ) async {
    _timerReconnectController.add('reconnect');
    emit(ReconnectTimerState());
  }

  Future<void> _onRepeatTimerValueChangedEventToState(
    RepeatTimerValueChangedEvent event,
    Emitter<CheckIsActiveState> emit,
  ) async {
    final isRepeat = event.isRepeat;
    _timerReconnectRepeatController.add(isRepeat);
    emit(RepeatTimerValueChangedState(isRepeat: isRepeat));
  }

  Future<void> _onGlobalTimerDurationChangedEventToState(
    GlobalTimerDurationChangedEvent event,
    Emitter<CheckIsActiveState> emit,
  ) async {
    final currentDurationInSeconds = event.currentDurationInSeconds;
    emit(GlobalTimerDurationChangedState(
      currentDurationInSeconds: event.currentDurationInSeconds,
    ),);

    if (currentDurationInSeconds == 0) {
      emit(const TimerFinishedState());
    }
  }

  Future<void> _onGlobalTimerVisibleChangedEventToState(
      GlobalTimerVisibleChangedEvent event,
      Emitter<CheckIsActiveState> emit,) async {
    final showGlobalTimer = event.showGlobalTimer;
    _showTimer = showGlobalTimer;
    emit(GlobalTimerVisibleChangedState(
      showGlobalTimer: showGlobalTimer,
    ),);
  }

  void _globalTimerValueChange(int currentDurationInSeconds) {
    add(GlobalTimerDurationChangedEvent(
      currentDurationInSeconds: currentDurationInSeconds,
    ),);
  }

  void _onTimerVisibleChange(bool showGlobalTimer) {
    add(GlobalTimerVisibleChangedEvent(showGlobalTimer: showGlobalTimer));
  }

  @override
  Future<void> close() async {
    await _canReconnectController.close();
    await _timerReconnectController.close();
    await _timerReconnectRepeatController.close();
    await _timerValueChangeSubscription?.cancel();
    await _timerVisibleSubscription?.cancel();
    await super.close();
  }
}
