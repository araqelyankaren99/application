import 'package:application/service_locator.dart';
import 'package:application/src/domain/screen_factory/factory.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  final screenFactory = GetIt.I<ScreenFactory>();
  runApp(screenFactory.makeMyApp());
}