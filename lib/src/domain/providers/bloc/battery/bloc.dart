import 'dart:async';

import 'package:application/src/domain/providers/bloc/battery/event.dart';
import 'package:application/src/domain/providers/bloc/battery/state.dart';
import 'package:application/src/domain/services/battery/service.dart';
import 'package:application/src/utils/enum/battery_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BatteryBloc extends Bloc<BatteryEvent, BatteryState> {
  BatteryBloc() : super(const BatteryInitial()) {
    on<ListenBatteryStatusChangeEvent>(
      _onListenBatteryStatusChangeEventToState,
    );
    on<ListenBatteryLevelChangeEvent>(_onListenBatteryLevelChangeEventToState);
    on<ChangeBatteryLevelEvent>(_onChangeBatteryLevelEventToState);
    on<ChangeBatteryStatusEvent>(_onChangeBatteryStatusEventToState);
  }

  final _batteryService = BatteryService();

  StreamSubscription<int>? _batteryLevelSubscription;
  StreamSubscription<BatteryStatus>? _batteryStatusSubscription;

  Future<void> _onListenBatteryStatusChangeEventToState(
    ListenBatteryStatusChangeEvent event,
    Emitter<BatteryState> emit,
  ) async {
    _batteryStatusSubscription =
        _batteryService.onBatteryStatusChange.listen(_onBatteryStatusChange);
  }

  Future<void> _onListenBatteryLevelChangeEventToState(
    ListenBatteryLevelChangeEvent event,
    Emitter<BatteryState> emit,
  ) async {
    _batteryLevelSubscription =
        _batteryService.onBatteryLevelChange.listen(_onBatteryLevelChange);
  }

  Future<void> _onChangeBatteryLevelEventToState(
    ChangeBatteryLevelEvent event,
    Emitter<BatteryState> emit,
  ) async {
    final batteryLevel = event.level;
    emit(BatteryLevelChangedState(level: batteryLevel));
  }

  Future<void> _onChangeBatteryStatusEventToState(
      ChangeBatteryStatusEvent event, Emitter<BatteryState> emit,) async{
    final batteryStatus = event.status;
    emit(BatteryStatusChangedState(status: batteryStatus));
  }

  void _onBatteryStatusChange(BatteryStatus status) {
    add(ChangeBatteryStatusEvent(status: status));
  }

  void _onBatteryLevelChange(int level) {
    add(ChangeBatteryLevelEvent(level: level));
  }

  @override
  Future<void> close() async {
    _batteryLevelSubscription?.cancel();
    _batteryStatusSubscription?.cancel();
    super.close();
  }
}
