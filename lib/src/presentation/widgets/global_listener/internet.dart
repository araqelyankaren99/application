import 'package:application/src/config/navigation/navigation_controller.dart';
import 'package:application/src/domain/providers/bloc/internet/bloc.dart';
import 'package:application/src/domain/providers/bloc/internet/state.dart';
import 'package:application/src/utils/dialogs/internet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetListenerWidget extends StatelessWidget {
  const InternetListenerWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetBloc, InternetState>(
      listener: _internetListener,
      child: child,
    );
  }

  void _internetListener(BuildContext context, InternetState state) {
    final navigationController = context.read<NavigationController>();
    final currentContext = navigationController.navigationKey.currentContext;
    if (currentContext == null) {
      return;
    }

    if(state is LoseInternetState){
      showInternetDialog(currentContext);
    }

    if(state is ActiveInternetState){
      hideInternetDialog(currentContext);
    }
  }
}
