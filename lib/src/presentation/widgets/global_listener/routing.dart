import 'package:application/src/domain/providers/bloc/routing/bloc.dart';
import 'package:application/src/domain/providers/bloc/routing/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouterListenerWidget extends StatelessWidget {
  const RouterListenerWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RoutingBloc, RoutingState>(
      listener: _routingListener,
      child: child,
    );
  }

  void _routingListener(BuildContext context, RoutingState state) {
  }
}
