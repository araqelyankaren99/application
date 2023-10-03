import 'package:equatable/equatable.dart';

abstract class PermissionState extends Equatable {
  const PermissionState();

  @override
  List<Object?> get props => [];
}

class PermissionInitial extends PermissionState {
  const PermissionInitial();
}

class PermissionExistingState extends PermissionState {
  const PermissionExistingState();
}

class PermissionsNotExistingState extends PermissionState {
  const PermissionsNotExistingState({required this.permissionMessage});

  final String permissionMessage;

  @override
  List<Object?> get props => [permissionMessage];
}