import 'package:application/src/config/navigation/main_navigation/navigation_controller.dart';
import 'package:application/src/config/navigation/main_navigation/route_names.dart';
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
      body: Center(
        child: GestureDetector(
          onTap: _onTap,
          child: const Text('Login screen'),
        ),
      ),
    );
  }

  void _onTap() {
    context.read<NavigationController>().pushAndRemoveUntil(
          pageName: MainNavigationRouteNames.welcome,
        );
  }
}
