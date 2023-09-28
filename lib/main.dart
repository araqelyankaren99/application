import 'package:application/service_locator.dart';
import 'package:application/src/config/navigation/main_navigation.dart';
import 'package:application/src/config/navigation/navigation_controller.dart';
import 'package:application/src/config/navigation/routing_observer.dart';
import 'package:application/src/domain/entity/local/permission_message_model.dart';
import 'package:application/src/domain/services/permission.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  const permissionService = PermissionService();
  final navigationController = NavigationController();
  final permissionMessage = await permissionService.permissionMessage();
  final permissionModel =
      PermissionMessageModel(permissionMessage: permissionMessage);
  runApp(
    MultiProvider(
      providers: [
        Provider<PermissionMessageModel>(create: (_) => permissionModel),
        Provider<NavigationController>(create: (_) => navigationController),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _mainNavigation = GetIt.I<MainNavigation>();
  static final _routingObserver = GetIt.I<RoutingObserver>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: _mainNavigation.routes,
      initialRoute: _mainNavigation.initialRoute,
      onGenerateRoute: _mainNavigation.onGenerateRoute,
      navigatorKey: context.read<NavigationController>().navigationKey,
      navigatorObservers: [
        _routingObserver,
      ],
    );
  }
}
