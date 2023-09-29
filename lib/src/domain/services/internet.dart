import 'dart:async';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetService {
  InternetService._getInstance() {
    _listenInternetConnection();
  }

  factory InternetService() => _instance;
  static final _instance = InternetService._getInstance();

  static final _connectionChecker = InternetConnectionChecker();
  StreamSubscription<InternetConnectionStatus>? _connectionSubscription;
  final _statusController = StreamController<bool>.broadcast();
  Stream<bool> get onStatusChange => _statusController.stream;

  bool? _lastInternetStatus;

  Future<bool> get hasInternet async =>
      (await _connectionChecker.connectionStatus) ==
          InternetConnectionStatus.connected;

  Future<void> _listenInternetConnection() async {
    final internetStatus = await hasInternet;
    await Future.delayed(const Duration(microseconds: 1));
    _updateStatus(internetStatus);
    _connectionSubscription =
        _connectionChecker.onStatusChange.listen(_internetStatusListen);
  }

  void _internetStatusListen(InternetConnectionStatus connectionStatus) {
    final hasInternet = connectionStatus == InternetConnectionStatus.connected;
    _updateStatus(hasInternet);
  }

  void _updateStatus(bool hasInternet) {
    if(_lastInternetStatus == hasInternet){
      return;
    }
    _lastInternetStatus = hasInternet;
    _statusController.add(hasInternet);
  }

  Future<void> dispose() async {
    await _connectionSubscription?.cancel();
  }
}
