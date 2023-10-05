import 'package:application/src/config/navigation/main_navigation/route.dart';
import 'package:application/src/domain/screen_factory/factory.dart';
import 'package:flutter/material.dart';

class UploadIdRoute extends MainRoute {
  const UploadIdRoute({
    required this.screenFactory,
    required this.settings,
  });

  final ScreenFactory screenFactory;
  final RouteSettings settings;

  @override
  Route<Object> makeRoute() {
    final arguments = settings.arguments;
    var hideBackButton = false;
    if (arguments is bool) {
      hideBackButton = arguments;
    }
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => screenFactory.makeUploadIdScreen(hideBackButton),
    );
  }
}
