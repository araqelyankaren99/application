import 'dart:async';

import 'package:application/src/domain/providers/bloc/socket/event.dart';
import 'package:application/src/domain/providers/bloc/socket/state.dart';
import 'package:application/src/domain/services/socket.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocketBloc extends Bloc<SocketEvent, SocketState> {
  SocketBloc() : super(const SocketInitial()) {
    on<ConnectSocketEvent>(_onConnectSocketEventToState);
  }

  StreamSubscription<dynamic>? _socketSubscription;

  Future<void> _onConnectSocketEventToState(
    ConnectSocketEvent event,
    Emitter<SocketState> emit,
  ) async {
    final socketService = SocketService()..startConnectSocket(socketUrl: '');
    _socketSubscription = socketService.onSocketData.listen(_onSocketEvent);
  }

  void _onSocketEvent(dynamic event){
  }

  @override
  Future<void> close() async{
    _socketSubscription?.cancel();
     super.close();
  }
}
