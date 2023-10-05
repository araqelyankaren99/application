import 'package:application/src/config/navigation/main_navigation/route.dart';
import 'package:application/src/config/navigation/routes/error.dart';
import 'package:application/src/domain/screen_factory/factory.dart';
import 'package:application/src/presentation/screens/document_scan/screen.dart';
import 'package:flutter/material.dart';

class DocumentScanRoute extends MainRoute {
  const DocumentScanRoute({
    required this.screenFactory,
    required this.settings,
  });

  final ScreenFactory screenFactory;
  final RouteSettings settings;

  @override
  Route<Object> makeRoute() {
    final arguments = settings.arguments;
    if (arguments is! OnGetImage) {
      final errorRoute = ErrorRoute(
        screenFactory: screenFactory,
        settings: settings,
      );
      return errorRoute.makeRoute();
    }
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => screenFactory.makeDocumentScanScreen(arguments),
    );
  }
}
