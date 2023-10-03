import 'dart:async';

import 'package:application/src/domain/providers/bloc/permission/event.dart';
import 'package:application/src/domain/providers/bloc/permission/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc() : super(const PermissionInitial()) {
    on<CheckPermissionEvent>(_onCheckPermissionEventToState);
  }

  Future<void> _onCheckPermissionEventToState(
    CheckPermissionEvent event,
    Emitter<PermissionState> emit,
  ) async {
    final permissionMessage = event.permissionMessage;
    if(permissionMessage.isEmpty){
      emit(const PermissionExistingState());
      return;
    }
    emit(PermissionsNotExistingState(permissionMessage: permissionMessage));
  }
}
