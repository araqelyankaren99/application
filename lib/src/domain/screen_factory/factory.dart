import 'package:application/src/config/navigation/main_navigation/main_navigation.dart';
import 'package:application/src/config/navigation/main_navigation/navigation_controller.dart';
import 'package:application/src/config/navigation/main_navigation/routing_observer.dart';
import 'package:application/src/data/data_provider/permission/message.dart';
import 'package:application/src/domain/entity/network/athena_service.dart';
import 'package:application/src/domain/entity/network/qr_upload_model.dart';
import 'package:application/src/domain/providers/bloc/battery/bloc.dart';
import 'package:application/src/domain/providers/bloc/internet/bloc.dart';
import 'package:application/src/domain/providers/bloc/permission/bloc.dart';
import 'package:application/src/domain/providers/bloc/permission/event.dart';
import 'package:application/src/domain/providers/bloc/routing/bloc.dart';
import 'package:application/src/domain/providers/bloc/socket/bloc.dart';
import 'package:application/src/presentation/screens/book_appointment/screen.dart';
import 'package:application/src/presentation/screens/book_return_visit/bloc/bloc.dart';
import 'package:application/src/presentation/screens/book_return_visit/screen.dart';
import 'package:application/src/presentation/screens/check_in_patient/bloc/bloc.dart';
import 'package:application/src/presentation/screens/check_in_patient/screen.dart';
import 'package:application/src/presentation/screens/congratulation/bloc/bloc.dart';
import 'package:application/src/presentation/screens/congratulation/screen.dart';
import 'package:application/src/presentation/screens/do_you_have_an_appointment/screen.dart';
import 'package:application/src/presentation/screens/document_scan/bloc/bloc.dart';
import 'package:application/src/presentation/screens/document_scan/screen.dart';
import 'package:application/src/presentation/screens/login/bloc/bloc.dart';
import 'package:application/src/presentation/screens/login/screen.dart';
import 'package:application/src/presentation/screens/missing_patient_info/bloc/bloc.dart';
import 'package:application/src/presentation/screens/missing_patient_info/screen.dart';
import 'package:application/src/presentation/screens/new_patient/bloc/bloc.dart';
import 'package:application/src/presentation/screens/new_patient/screen.dart';
import 'package:application/src/presentation/screens/payment/bloc/bloc.dart';
import 'package:application/src/presentation/screens/payment/screen.dart';
import 'package:application/src/presentation/screens/services/bloc/bloc.dart';
import 'package:application/src/presentation/screens/services/screen.dart';
import 'package:application/src/presentation/screens/upload_id/bloc/bloc.dart';
import 'package:application/src/presentation/screens/upload_id/screen.dart';
import 'package:application/src/presentation/screens/upload_insurance/bloc/bloc.dart';
import 'package:application/src/presentation/screens/upload_insurance/screen.dart';
import 'package:application/src/presentation/screens/upload_secondary_insurance/bloc/bloc.dart';
import 'package:application/src/presentation/screens/upload_secondary_insurance/screen.dart';
import 'package:application/src/presentation/screens/welcome/screen.dart';
import 'package:application/src/presentation/widgets/global_listener/global_listener.dart';
import 'package:application/src/presentation/widgets/my_app.dart';
import 'package:application/src/utils/enum/login_type.dart';
import 'package:application/src/utils/enum/welcome_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  const ScreenFactory();

  Widget makeMyApp() {
    final navigationController = GetIt.I<NavigationController>();
    final mainNavigation = GetIt.I<MainNavigation>();
    final routingObserver = GetIt.I<RoutingObserver>();
    final socketBloc = SocketBloc();
    final batteryBloc = BatteryBloc();
    const messageDataProvider = PermissionMessageDataProvider();
    final permissionBloc = PermissionBloc();
    final internetBloc = GetIt.I<InternetBloc>();
    final routingBloc = GetIt.I<RoutingBloc>();

    return MultiProvider(
      providers: [
        Provider<NavigationController>(create: (_) => navigationController),
        BlocProvider<PermissionBloc>(
          create: (_) => permissionBloc
            ..add(
              CheckPermissionEvent(
                permissionMessage: messageDataProvider.permissionMessage,
              ),
            ),
        ),
        BlocProvider<SocketBloc>(create: (_) => socketBloc),
        BlocProvider<BatteryBloc>(create: (_) => batteryBloc),
        BlocProvider<InternetBloc>(create: (_) => internetBloc),
        BlocProvider<RoutingBloc>(create: (_) => routingBloc),
      ],
      child: GlobalListenerWidget(
        child: MyApp(
          mainNavigation: mainNavigation,
          navigationController: navigationController,
          routingObserver: routingObserver,
        ),
      ),
    );
  }

  Widget makeErrorScreen() {
    return const Scaffold(
      body: Center(
        child: Text('Navigation error!!!'),
      ),
    );
  }

  Widget makeLoginScreen(LoginType loginType) {
    final loginBloc = LoginBloc();
    return BlocProvider<LoginBloc>(
      create: (_) => loginBloc,
      child: LoginScreen(loginType: loginType),
    );
  }

  Widget makeWelcomeScreen(WelcomeType welcomeType) {
    return const WelcomeScreen();
  }

  Widget makeDoYouHaveAnAppointmentScreen() {
    return const DoYouHaveAnAppointmentScreen();
  }

  Widget makeCheckInPatientScreen() {
    final checkInPatientBloc = CheckInPatientBloc();
    return BlocProvider<CheckInPatientBloc>(
      create: (_) => checkInPatientBloc,
      child: const CheckInPatientScreen(),
    );
  }

  Widget makeBookReturnVisitScreen() {
    final bookReturnVisitBloc = BookReturnVisitBloc();
    return BlocProvider<BookReturnVisitBloc>(
      create: (_) => bookReturnVisitBloc,
      child: const BookReturnVisitScreen(),
    );
  }

  Widget makeBookAppointmentScreen() {
    return const BookAppointmentScreen();
  }

  Widget makeMissingPatientInfoScreen() {
    final missingPatientInfoBloc = MissingPatientInfoBloc();
    return BlocProvider<MissingPatientInfoBloc>(
      create: (_) => missingPatientInfoBloc,
      child: const MissingPatientInfoScreen(),
    );
  }

  Widget makeUploadIdScreen(bool hideBackButton) {
    final uploadIdBloc = UploadIdBloc();
    return BlocProvider<UploadIdBloc>(
      create: (_) => uploadIdBloc,
      child: const UploadIdScreen(),
    );
  }

  Widget makeCongratulationScreen(QrUploadModel qrUploadModel) {
    final congratulationBloc = CongratulationBloc();
    return BlocProvider<CongratulationBloc>(
      create: (_) => congratulationBloc,
      child: CongratulationScreen(qrUploadModel: qrUploadModel),
    );
  }

  Widget makeDocumentScanScreen(OnGetImage onGetImage) {
    final documentScanBloc = DocumentScanBloc();
    return BlocProvider<DocumentScanBloc>(
      create: (_) => documentScanBloc,
      child: DocumentScanScreen(onGetImage: onGetImage),
    );
  }

  Widget makeUploadInsuranceScreen() {
    final uploadInsuranceBloc = UploadInsuranceBloc();
    return BlocProvider<UploadInsuranceBloc>(
      create: (_) => uploadInsuranceBloc,
      child: const UploadInsuranceScreen(),
    );
  }

  Widget makeNewPatientScreen() {
    final newPatientBloc = NewPatientBloc();
    return BlocProvider<NewPatientBloc>(
      create: (_) => newPatientBloc,
      child: const NewPatientScreen(),
    );
  }

  Widget makeUploadSecondaryInsuranceScreen() {
    final uploadSecondaryInsuranceBloc = UploadSecondaryInsuranceBloc();
    return BlocProvider<UploadSecondaryInsuranceBloc>(
      create: (_) => uploadSecondaryInsuranceBloc,
      child: const UploadSecondaryInsuranceScreen(),
    );
  }

  Widget makeServicesScreen() {
    final servicesBloc = ServicesBloc();
    return BlocProvider<ServicesBloc>(
      create: (_) => servicesBloc,
      child: const ServicesScreen(),
    );
  }

  Widget makePaymentScreen(AthenaService athenaService) {
    final paymentBloc = PaymentBloc();
    return BlocProvider<PaymentBloc>(
      create: (_) => paymentBloc,
      child: PaymentScreen(athenaService: athenaService),
    );
  }
}
