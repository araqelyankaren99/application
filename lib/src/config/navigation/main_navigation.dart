import 'package:application/src/config/navigation/route_names.dart';
import 'package:application/src/domain/entity/network/athena_service.dart';
import 'package:application/src/domain/entity/network/qr_upload_model.dart';
import 'package:application/src/domain/screen_factory/factory.dart';
import 'package:application/src/presentation/screens/document_scan/screen.dart';
import 'package:flutter/material.dart';

class MainNavigation {
  const MainNavigation({
    required this.initialRoute,
    required this.screenFactory,
  });

  final String initialRoute;
  final ScreenFactory screenFactory;

  Map<String, Widget Function(BuildContext)> get routes => {
        MainNavigationRouteNames.login: (_) => screenFactory.makeLoginScreen(),
        MainNavigationRouteNames.welcome: (_) =>
            screenFactory.makeWelcomeScreen(),
        MainNavigationRouteNames.doYouHaveAnAppointment: (_) =>
            screenFactory.makeDoYouHaveAnAppointmentScreen(),
        MainNavigationRouteNames.checkInPatient: (_) =>
            screenFactory.makeCheckInPatientScreen(),
        MainNavigationRouteNames.bookReturnVisit: (_) =>
            screenFactory.makeBookReturnVisitScreen(),
        MainNavigationRouteNames.bookAppointment: (_) =>
            screenFactory.makeBookAppointmentScreen(),
        MainNavigationRouteNames.missingPatientInfo: (_) =>
            screenFactory.makeMissingPatientInfoScreen(),
        MainNavigationRouteNames.uploadInsurance: (_) =>
            screenFactory.makeUploadInsuranceScreen(),
        MainNavigationRouteNames.newPatient: (_) =>
            screenFactory.makeNewPatientScreen(),
        MainNavigationRouteNames.uploadSecondaryInsurance: (_) =>
            screenFactory.makeUploadSecondaryInsuranceScreen(),
        MainNavigationRouteNames.services: (_) =>
            screenFactory.makeServicesScreen(),
      };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.uploadId:
        final arguments = settings.arguments;
        var hideBackButton = false;
        if (arguments is bool) {
          hideBackButton = arguments;
        }
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => screenFactory.makeUploadIdScreen(hideBackButton),
        );

      case MainNavigationRouteNames.congratulation:
        final arguments = settings.arguments;
        if (arguments is! QrUploadModel) {
          return _makeErrorScreen(settings);
        }
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => screenFactory.makeCongratulationScreen(arguments),
        );

      case MainNavigationRouteNames.documentScan:
        final arguments = settings.arguments;
        if (arguments is! OnGetImage) {
          return _makeErrorScreen(settings);
        }
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => screenFactory.makeDocumentScanScreen(arguments),
        );

      case MainNavigationRouteNames.payment:
        final arguments = settings.arguments;
        if (arguments is! AthenaService) {
          return _makeErrorScreen(settings);
        }
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => screenFactory.makePaymentScreen(arguments),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => screenFactory.makeErrorScreen(),
        );
    }
  }

  Route<Object> _makeErrorScreen(RouteSettings? settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => screenFactory.makeErrorScreen(),
    );
  }
}
