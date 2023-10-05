import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

abstract class RoutingState extends Equatable {
  const RoutingState();

  @override
  List<Object> get props => [];
}

class RoutingInitial extends RoutingState {
  const RoutingInitial();
}

class PageNameIsEmptyState extends RoutingState {
  final _id = const Uuid().v4();

  @override
  List<Object> get props => [_id];
}

class RouteChangedState extends RoutingState {
  const RouteChangedState({required this.routeName});

  final String routeName;

  @override
  List<Object> get props => [routeName];
}