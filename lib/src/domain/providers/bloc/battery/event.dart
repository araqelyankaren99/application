import 'package:application/src/utils/enum/battery_status.dart';
import 'package:equatable/equatable.dart';

abstract class BatteryEvent extends Equatable {
  const BatteryEvent();
  @override
  List<Object?> get props => [];
}

class ListenBatteryStatusChangeEvent extends BatteryEvent {
  const ListenBatteryStatusChangeEvent();
}

class ListenBatteryLevelChangeEvent extends BatteryEvent {
  const ListenBatteryLevelChangeEvent();
}

class ChangeBatteryLevelEvent extends BatteryEvent {
  const ChangeBatteryLevelEvent({required this.level});

  final int level;

  @override
  List<Object?> get props => [level];
}

class ChangeBatteryStatusEvent extends BatteryEvent {
  const ChangeBatteryStatusEvent({required this.status});

  final BatteryStatus status;

  @override
  List<Object?> get props => [status];
}