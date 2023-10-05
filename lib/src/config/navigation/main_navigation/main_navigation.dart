import 'package:application/src/config/navigation/main_navigation/route_names.dart';
import 'package:application/src/config/navigation/routes/book_appointment.dart';
import 'package:application/src/config/navigation/routes/book_return_visit.dart';
import 'package:application/src/config/navigation/routes/check_in_patient.dart';
import 'package:application/src/config/navigation/routes/congratulation.dart';
import 'package:application/src/config/navigation/routes/do_you_have_an_appointment.dart';
import 'package:application/src/config/navigation/routes/document_scan.dart';
import 'package:application/src/config/navigation/routes/error.dart';
import 'package:application/src/config/navigation/routes/login.dart';
import 'package:application/src/config/navigation/routes/missing_patient_info.dart';
import 'package:application/src/config/navigation/routes/new_patient.dart';
import 'package:application/src/config/navigation/routes/payment.dart';
import 'package:application/src/config/navigation/routes/services.dart';
import 'package:application/src/config/navigation/routes/upload_id.dart';
import 'package:application/src/config/navigation/routes/upload_insurance.dart';
import 'package:application/src/config/navigation/routes/upload_secondary_insurance.dart';
import 'package:application/src/config/navigation/routes/welcome.dart';
import 'package:application/src/domain/screen_factory/factory.dart';
import 'package:flutter/material.dart';

class MainNavigation {
  const MainNavigation({
    required this.initialRoute,
    required this.screenFactory,
  });

  final String initialRoute;
  final ScreenFactory screenFactory;

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.login:
        final loginRoute = LoginRoute(
          settings: settings,
          screenFactory: screenFactory,
        );
        return loginRoute.makeRoute();

      case MainNavigationRouteNames.welcome:
        final welcomeRoute = WelcomeRoute(
          screenFactory: screenFactory,
          settings: settings,
        );
        return welcomeRoute.makeRoute();

      case MainNavigationRouteNames.doYouHaveAnAppointment:
        final doYouHaveAnAppointmentRoute = DoYouHaveAnAppointmentRoute(
          screenFactory: screenFactory,
          settings: settings,
        );
        return doYouHaveAnAppointmentRoute.makeRoute();

      case MainNavigationRouteNames.bookAppointment:
        final bookAppointmentRoute = BookAppointmentRoute(
          screenFactory: screenFactory,
          settings: settings,
        );
        return bookAppointmentRoute.makeRoute();

      case MainNavigationRouteNames.bookReturnVisit:
        final bookReturnVisitRoute = BookReturnVisitRoute(
          screenFactory: screenFactory,
          settings: settings,
        );
        return bookReturnVisitRoute.makeRoute();

      case MainNavigationRouteNames.checkInPatient:
        final checkInPatientRoute = CheckInPatientRoute(
          screenFactory: screenFactory,
          settings: settings,
        );
        return checkInPatientRoute.makeRoute();

      case MainNavigationRouteNames.missingPatientInfo:
        final missingPatientInfoRoute = MissingPatientInfoRoute(
          screenFactory: screenFactory,
          settings: settings,
        );
        return missingPatientInfoRoute.makeRoute();

      case MainNavigationRouteNames.congratulation:
        final congratulationRoute = CongratulationRoute(
          screenFactory: screenFactory,
          settings: settings,
        );
        return congratulationRoute.makeRoute();

      case MainNavigationRouteNames.uploadId:
        final uploadIdRoute = UploadIdRoute(
          screenFactory: screenFactory,
          settings: settings,
        );
        return uploadIdRoute.makeRoute();

      case MainNavigationRouteNames.documentScan:
        final documentScanRoute = DocumentScanRoute(
          screenFactory: screenFactory,
          settings: settings,
        );
        return documentScanRoute.makeRoute();

      case MainNavigationRouteNames.uploadInsurance:
        final uploadInsuranceRoute = UploadInsuranceRoute(
          screenFactory: screenFactory,
          settings: settings,
        );
        return uploadInsuranceRoute.makeRoute();

      case MainNavigationRouteNames.newPatient:
        final newPatientRoute = NewPatientRoute(
          screenFactory: screenFactory,
          settings: settings,
        );
        return newPatientRoute.makeRoute();

      case MainNavigationRouteNames.uploadSecondaryInsurance:
        final uploadSecondaryInsuranceRoute = UploadSecondaryInsuranceRoute(
          screenFactory: screenFactory,
          settings: settings,
        );
        return uploadSecondaryInsuranceRoute.makeRoute();

      case MainNavigationRouteNames.services:
        final servicesRoute = ServicesRoute(
          screenFactory: screenFactory,
          settings: settings,
        );
        return servicesRoute.makeRoute();

      case MainNavigationRouteNames.payment:
        final paymentRoute = PaymentRoute(
          screenFactory: screenFactory,
          settings: settings,
        );
        return paymentRoute.makeRoute();

      default:
        final errorRoute = ErrorRoute(
          screenFactory: screenFactory,
          settings: settings,
        );
        return errorRoute.makeRoute();
    }
  }
}
