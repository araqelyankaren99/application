import 'package:application/src/config/navigation/navigation_controller.dart';
import 'package:application/src/domain/providers/bloc/socket/bloc.dart';
import 'package:application/src/domain/providers/bloc/socket/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocketListenerWidget extends StatelessWidget {
  const SocketListenerWidget({Key? key,required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SocketBloc,SocketState>(listener: _socketListener,child: child,);
  }

  void _socketListener(BuildContext context , SocketState state){
    final navigationController = context.read<NavigationController>();
    final currentContext = navigationController.navigationKey.currentContext;
    if(currentContext == null){
      return;
    }
  }
}
