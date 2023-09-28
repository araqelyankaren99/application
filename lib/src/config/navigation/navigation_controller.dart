import 'package:flutter/material.dart';

class NavigationController {
  GlobalKey<NavigatorState> get navigationKey => _navigatorKey;
  final _navigatorKey = GlobalKey<NavigatorState>();

  void push({required String pageName, Object? arguments}) {
    navigationKey.currentState?.pushNamed(pageName, arguments: arguments);
  }

  void pop() {
    navigationKey.currentState?.pop();
  }

  void popToFirst() {
    navigationKey.currentState?.popUntil((route) => route.isFirst);
  }

  void pushAndRemoveUntil({required String pageName, Object? arguments}) {
    navigationKey.currentState?.pushNamedAndRemoveUntil(
      pageName,
          (_) => false,
      arguments: arguments,
    );
  }

  bool canPop() {
    return navigationKey.currentState?.canPop() ?? false;
  }
}
