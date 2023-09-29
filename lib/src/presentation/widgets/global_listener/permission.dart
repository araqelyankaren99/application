import 'package:application/src/config/navigation/navigation_controller.dart';
import 'package:application/src/domain/providers/bloc/permission/bloc.dart';
import 'package:application/src/domain/providers/bloc/permission/state.dart';
import 'package:application/src/utils/dialogs/permission.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PermissionListenerWidget extends StatelessWidget {
  const PermissionListenerWidget({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PermissionBloc, PermissionState>(
      listener: _permissionListener,
      child: child,
    );
  }

  void _permissionListener(BuildContext context, PermissionState state) {
    if (state is PermissionsNotExistingState) {
      final navigationController = context.read<NavigationController>();
      final currentContext = navigationController.navigationKey.currentContext;
      if (currentContext == null) {
        return;
      }
      final permissionMessage = state.permissionMessage;
      showPermissionDialog(currentContext,
          permissionMessage: permissionMessage,);
    }
  }
}
