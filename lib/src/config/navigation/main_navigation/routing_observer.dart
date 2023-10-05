import 'package:application/src/domain/providers/bloc/routing/bloc.dart';
import 'package:application/src/domain/providers/bloc/routing/event.dart';
import 'package:flutter/material.dart';

class RoutingObserver extends NavigatorObserver {
  RoutingObserver({required this.routingBloc});

  final RoutingBloc routingBloc;

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
      routingBloc.add(ChangeRouteEvent(routeName: pageName));
    }
  }
}