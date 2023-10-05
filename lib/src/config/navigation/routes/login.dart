import 'package:application/src/config/navigation/animation/reverse.dart';
import 'package:application/src/config/navigation/main_navigation/route.dart';
import 'package:application/src/domain/screen_factory/factory.dart';
import 'package:application/src/utils/enum/login_type.dart';
import 'package:flutter/material.dart';

class LoginRoute extends MainRoute{
  const LoginRoute({required this.settings,required this.screenFactory});
  final RouteSettings settings;
  final ScreenFactory screenFactory;

  @override
  Route<Object> makeRoute() {
    final arguments = settings.arguments;
    var loginType = LoginType.initial;
    if(arguments is LoginType){
      loginType = arguments;
    }
    switch(loginType){
      case LoginType.initial:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => screenFactory.makeLoginScreen(loginType),
        );
      case LoginType.fromLogout:
        return ReverseAnimationMaterialPageRoute(
          settings: settings,
          builder: (_) => screenFactory.makeLoginScreen(loginType),
        );
    }
  }
}