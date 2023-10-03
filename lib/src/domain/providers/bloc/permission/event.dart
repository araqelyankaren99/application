import 'package:equatable/equatable.dart';

abstract class PermissionEvent extends Equatable {
  const PermissionEvent();

  @override
  List<Object?> get props => [];
}

class CheckPermissionEvent extends PermissionEvent {
  const CheckPermissionEvent({required this.permissionMessage});
  final String permissionMessage;

  @override
  List<Object?> get props => [permissionMessage];
}
