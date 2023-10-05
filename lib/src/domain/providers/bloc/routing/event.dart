import 'package:equatable/equatable.dart';

abstract class RoutingEvent extends Equatable {
  const RoutingEvent();

  @override
  List<Object> get props => [];
}

class ChangeRouteEvent extends RoutingEvent {
  const ChangeRouteEvent({required this.routeName});

  final String routeName;

  @override
  List<Object> get props => [routeName];
}