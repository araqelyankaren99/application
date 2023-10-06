import 'package:application/src/config/navigation/main_navigation/route.dart';
import 'package:application/src/domain/screen_factory/factory.dart';
import 'package:flutter/material.dart';

class MissingPatientInfoRoute extends MainRoute {
  const MissingPatientInfoRoute({
    required this.screenFactory,
    required this.settings,
  });

  final ScreenFactory screenFactory;
  final RouteSettings settings;

  @override
  Route<Object> makeRoute() {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => screenFactory.makeMissingPatientInfoScreen(),
    );
  }
}