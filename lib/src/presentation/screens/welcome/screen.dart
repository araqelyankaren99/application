import 'package:application/src/config/navigation/navigation_controller.dart';
import 'package:application/src/config/navigation/route_names.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
