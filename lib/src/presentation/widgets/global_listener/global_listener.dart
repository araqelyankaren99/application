import 'package:application/src/presentation/widgets/global_listener/permission.dart';
import 'package:application/src/presentation/widgets/global_listener/socket.dart';
import 'package:flutter/cupertino.dart';

class GlobalListenerWidget extends StatelessWidget {
  const GlobalListenerWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PermissionListenerWidget(
      child: SocketListenerWidget(
        child: child,
      ),
    );
  }
}
