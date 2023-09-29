import 'package:application/service_locator.dart';
import 'package:application/src/config/navigation/main_navigation.dart';
import 'package:application/src/config/navigation/navigation_controller.dart';
import 'package:application/src/config/navigation/routing_observer.dart';
import 'package:application/src/domain/providers/bloc/permission/bloc.dart';
import 'package:application/src/domain/providers/bloc/socket/bloc.dart';
import 'package:application/src/presentation/widgets/global_listener/global_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  final navigationController = NavigationController();
  final permissionBloc = PermissionBloc();
  final socketBloc = SocketBloc();

  runApp(
    MultiProvider(
      providers: [
        Provider<NavigationController>(create: (_) => navigationController),
        BlocProvider<PermissionBloc>(create: (_) => permissionBloc),
        BlocProvider<SocketBloc>(create: (_) => socketBloc),
      ],
      child: const GlobalListenerWidget(
        child: MyApp(),
      ),
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
      navigatorObservers: [_routingObserver],
    );
  }
}
