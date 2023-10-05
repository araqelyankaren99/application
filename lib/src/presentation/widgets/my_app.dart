import 'package:application/src/config/navigation/main_navigation/main_navigation.dart';
import 'package:application/src/config/navigation/main_navigation/navigation_controller.dart';
import 'package:application/src/config/navigation/main_navigation/routing_observer.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.mainNavigation,
    required this.navigationController,
    required this.routingObserver,
  }) : super(key: key);

  final MainNavigation mainNavigation;
  final NavigationController navigationController;
  final RoutingObserver routingObserver;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: mainNavigation.initialRoute,
      onGenerateRoute: mainNavigation.onGenerateRoute,
      navigatorKey: navigationController.navigationKey,
      navigatorObservers: [routingObserver],
    );
  }
}
