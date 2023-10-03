import 'package:application/src/config/navigation/main_navigation.dart';
import 'package:application/src/config/navigation/page_notifier.dart';
import 'package:application/src/config/navigation/route_names.dart';
import 'package:application/src/config/navigation/routing_observer.dart';
import 'package:application/src/data/data_provider/permission/enabled.dart';
import 'package:application/src/data/data_provider/permission/message.dart';
import 'package:application/src/domain/providers/bloc/internet/bloc.dart';
import 'package:application/src/domain/screen_factory/factory.dart';
import 'package:application/src/domain/services/app_config.dart';
import 'package:application/src/domain/services/permission.dart';
import 'package:application/src/utils/enum/app_mode.dart';
import 'package:get_it/get_it.dart';

final _serviceLocator = GetIt.instance;

Future<void> setupDependencies() async{
  await _registerPermission();
  _registerInternetBloc();
  _registerNavigation();
  await _registerAppConfig();
}

Future<void> _registerPermission() async{
  const permissionService = PermissionService();
  const enabledDataProvider = PermissionEnabledDataProvider();
  const messageDataProvider = PermissionMessageDataProvider();

  final permissionMessage = await permissionService.permissionMessage();
  messageDataProvider.permissionMessage = permissionMessage;
  enabledDataProvider.hasEnabledPermission = permissionMessage.isEmpty;

}

void _registerInternetBloc() {
  final internetBloc = InternetBloc();
  _serviceLocator.registerLazySingleton<InternetBloc>(() => internetBloc);

}

void _registerNavigation() {
  _registerScreenFactory();
  _registerNavigationService();
  _registerPageNotifier();
  _registerRoutingObserver();
}

Future<void> _registerAppConfig() async {
  await const AppConfigService().initAppConfig(ApplicationMode.dev);
}


void _registerPageNotifier() {
  final pageNotifier = PageNotifier();

  _serviceLocator.registerLazySingleton<PageNotifier>(() => pageNotifier);
}

void _registerRoutingObserver() {
  final pageNotifier = GetIt.I<PageNotifier>();

  final routingObserver = RoutingObserver(
    pageNotifier: pageNotifier,
  );

  _serviceLocator.registerLazySingleton<RoutingObserver>(() => routingObserver);
}

void _registerScreenFactory() {
  const screenFactory = ScreenFactory();

  _serviceLocator.registerFactory<ScreenFactory>(() => screenFactory);
}

void _registerNavigationService() {
  final screenFactory = GetIt.I<ScreenFactory>();

  final navigationService = MainNavigation(
    initialRoute: MainNavigationRouteNames.login,
    screenFactory: screenFactory,
  );

  _serviceLocator
      .registerLazySingleton<MainNavigation>(() => navigationService);
}