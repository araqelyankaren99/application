import 'package:application/src/config/navigation/animation/reverse.dart';
import 'package:application/src/config/navigation/main_navigation/route.dart';
import 'package:application/src/domain/screen_factory/factory.dart';
import 'package:application/src/utils/enum/welcome_type.dart';
import 'package:flutter/material.dart';

class WelcomeRoute extends MainRoute{
  const WelcomeRoute({required this.settings,required this.screenFactory});
  final RouteSettings settings;
  final ScreenFactory screenFactory;

  @override
  Route<Object> makeRoute() {
    final arguments = settings.arguments;
    var welcomeType = WelcomeType.fromLogin;
    if(arguments is WelcomeType){
      welcomeType = arguments;
    }

    switch(welcomeType){
      case WelcomeType.fromLogin:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => screenFactory.makeWelcomeScreen(welcomeType),
        );
      case WelcomeType.home:
        return ReverseAnimationMaterialPageRoute(
          builder: (_) => screenFactory.makeWelcomeScreen(welcomeType),
          settings: settings,
        );
    }
  }
}