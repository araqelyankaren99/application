import 'package:application/src/config/navigation/main_navigation/navigation_controller.dart';
import 'package:application/src/config/navigation/main_navigation/route_names.dart';
import 'package:application/src/utils/enum/welcome_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    Key? key,
    this.welcomeType = WelcomeType.fromLogin,
  }) : super(key: key);

  final WelcomeType welcomeType;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _onTap,
          child: const Text('Welcome screen'),
        ),
      ),
    );
  }

  void _onTap() {
    context.read<NavigationController>().push(
          pageName: MainNavigationRouteNames.doYouHaveAnAppointment,
        );
  }
}
