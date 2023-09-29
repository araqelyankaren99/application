import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  SocketService._getInstance();

  factory SocketService() => _instance;
  static final _instance = SocketService._getInstance();

  io.Socket? _socket;

  final _streamController = StreamController<dynamic>.broadcast();

  Stream<dynamic> get onSocketData => _streamController.stream;

  void startConnectSocket({
    required String socketUrl,
    List<String> transports = const [],
    Map query = const {},
    String path = '',
    String event = 'data',
  }) {
    try {
      final optionBuilder = io.OptionBuilder()
          .setTransports(transports)
          .setQuery(query)
          .setPath(path)
          .enableForceNew()
          .build();
      final url = socketUrl;
      _socket = io.io(url, optionBuilder);
      connectSocket();

      _socket?.onConnect(_onSocketConnect);
      _socket?.onError(_onError);
      _socket?.onConnectError(_onConnectionError);
      _socket?.onDisconnect(_onDisconnect);

      _socket?.on(event, _onSocketData);
    } on Exception catch (_) {}
  }

  void connectSocket() {
    _socket?.connect();
  }

  void disconnectSocket() {
    _socket?.disconnect();
  }

  void _killSocket() {
    disconnectSocket();
    _socket?.close();
    _socket?.destroy();
    _socket = null;
  }

  void _onSocketConnect(_) {
    debugPrint('Success connect socket !!!');
  }

  void _onError(dynamic error) {
    debugPrint('Socket error $error');
  }

  void _onConnectionError(dynamic error) {
    debugPrint('Socket connection error $error');
  }

  void _onDisconnect(_) {
    debugPrint('Socket disconnect !!!');
  }

  void _onSocketData(dynamic socketData) {
    _streamController.add(socketData);
  }

  void dispose() {
    _killSocket();
    _streamController.sink.close();
  }
}
