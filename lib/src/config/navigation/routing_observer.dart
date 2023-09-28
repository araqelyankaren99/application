import 'package:application/src/config/navigation/page_notifier.dart';
import 'package:flutter/material.dart';

class RoutingObserver extends NavigatorObserver {
  RoutingObserver({required this.pageNotifier});

  final PageNotifier pageNotifier;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    final pageName = _currentName(route);
    _updatePage(pageName);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    final pageName = _currentName(previousRoute);
    _updatePage(pageName);
  }

  String? _currentName(Route<dynamic>? route) {
    return route?.settings.name;
  }

  void _updatePage(String? pageName){
    if(pageName!=null){
      pageNotifier.pageName = pageName;
    }
  }
}