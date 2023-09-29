import 'package:application/src/utils/enum/battery_status.dart';
import 'package:equatable/equatable.dart';

class BatteryState extends Equatable {
  const BatteryState();

  @override
  List<Object?> get props => [];
}

class BatteryInitial extends BatteryState {
  const BatteryInitial();
}

class BatteryLevelChangedState extends BatteryState {
  const BatteryLevelChangedState({required this.level});

  final int level;

  @override
  List<Object?> get props => [level];
}

class BatteryStatusChangedState extends BatteryState {
  const BatteryStatusChangedState({required this.status});

  final BatteryStatus status;

  @override
  List<Object?> get props => [status];
}