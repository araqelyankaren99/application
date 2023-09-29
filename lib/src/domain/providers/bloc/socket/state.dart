import 'package:equatable/equatable.dart';

abstract class SocketState extends Equatable {
  const SocketState();

  @override
  List<Object?> get props => [];
}

class SocketInitial extends SocketState {
  const SocketInitial();
}