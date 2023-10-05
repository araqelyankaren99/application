import 'dart:async';

import 'package:application/src/config/navigation/main_navigation/main_navigation.dart';
import 'package:application/src/domain/providers/bloc/routing/event.dart';
import 'package:application/src/domain/providers/bloc/routing/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RoutingBloc extends Bloc<RoutingEvent, RoutingState> {
  RoutingBloc() : super(const RoutingInitial()) {
    on<ChangeRouteEvent>(_onChangeRouteEventToState);
  }

  String get pageName => _pageName;
  String _pageName = GetIt.I<MainNavigation>().initialRoute;

  Future<void> _onChangeRouteEventToState(
    ChangeRouteEvent event,
    Emitter<RoutingState> emit,
  ) async {
    final routeName = event.routeName;
    if(routeName.isEmpty){
      emit(PageNameIsEmptyState());
    }
    if(_pageName == routeName){
      return;
    }
    _pageName = routeName;
    emit(RouteChangedState(routeName: routeName));
  }
}
