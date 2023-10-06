import 'package:application/src/config/navigation/main_navigation/navigation_controller.dart';
import 'package:application/src/config/navigation/main_navigation/route_names.dart';
import 'package:application/src/presentation/widgets/custom_input.dart';
import 'package:application/src/utils/activation/extension/activation_extension.dart';
import 'package:application/src/utils/enum/login_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
    this.loginType = LoginType.initial,
  }) : super(key: key);

  final LoginType loginType;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 20),child:
          CustomInputWidget(
            onSubmitted: (val){},
            onChanged: (val) {},
          ),),
          GestureDetector(
            onTap: _onTap,
            child: const Text('Login screen'),
          ),
        ],

      ),
    );
  }

  void _onTap() {
    context.acceptReconnect();
    context.read<NavigationController>().pushAndRemoveUntil(
          pageName: MainNavigationRouteNames.welcome,
        );
  }
}
