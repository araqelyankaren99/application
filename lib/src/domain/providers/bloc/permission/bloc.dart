import 'dart:async';

import 'package:application/src/domain/providers/bloc/permission/event.dart';
import 'package:application/src/domain/providers/bloc/permission/state.dart';
import 'package:application/src/domain/services/permission.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc() : super(const PermissionInitial()) {
    on<CheckPermissionEvent>(_onCheckPermissionEventToState);
    add(const CheckPermissionEvent());
  }

  static const _permissionService = PermissionService();

  Future<void> _onCheckPermissionEventToState(
    CheckPermissionEvent event,
    Emitter<PermissionState> emit,
  ) async {
    final hasEnabledPermission = await _permissionService.hasEnabledPermission();
    if(hasEnabledPermission){
      return;
    }
    final permissionMessage = await _permissionService.permissionMessage();
    emit(PermissionsNotExistingState(permissionMessage: permissionMessage));
  }
}
