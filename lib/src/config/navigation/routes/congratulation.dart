import 'package:application/src/config/navigation/main_navigation/route.dart';
import 'package:application/src/config/navigation/routes/error.dart';
import 'package:application/src/domain/entity/network/qr_upload_model.dart';
import 'package:application/src/domain/screen_factory/factory.dart';
import 'package:flutter/material.dart';

class CongratulationRoute extends MainRoute {
  const CongratulationRoute({
    required this.screenFactory,
    required this.settings,
  });

  final ScreenFactory screenFactory;
  final RouteSettings settings;

  @override
  Route<Object> makeRoute() {
    final arguments = settings.arguments;
    if (arguments is! QrUploadModel) {
      final errorRoute = ErrorRoute(
        screenFactory: screenFactory,
        settings: settings,
      );
      return errorRoute.makeRoute();
    }
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => screenFactory.makeCongratulationScreen(arguments),
    );
  }
}
