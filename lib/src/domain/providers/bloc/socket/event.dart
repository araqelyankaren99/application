import 'package:equatable/equatable.dart';

class SocketEvent extends Equatable {
  const SocketEvent();

  @override
  List<Object?> get props => [];
}

class ConnectSocketEvent extends SocketEvent {
  const ConnectSocketEvent();
}