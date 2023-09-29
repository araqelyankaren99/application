import 'package:application/src/utils/enum/battery_status.dart';
import 'package:application/src/utils/extensions/battery_status.dart';
import 'package:flutter/services.dart';

class BatteryPlugin {
  BatteryPlugin._getInstance();

  factory BatteryPlugin() => _instance;
  static final _instance = BatteryPlugin._getInstance();

  static const _batteryLevelEventChannel =
      EventChannel('battery.com/level/subscribe');
  static const _batteryStatusEventChannel =
      EventChannel('battery.com/status/subscribe');

  static const _batteryMethodChannel = MethodChannel('battery.com/info');

  Future<int> getBatteryLevel() async {
    final batteryLevel = await _batteryMethodChannel.invokeMethod(
      'level',
    );
    if (batteryLevel is! int) {
      throw Exception('Something went wrong!!!');
    }

    return batteryLevel;
  }

  Future<BatteryStatus> getBatteryStatus() async {
    final batteryStatus = await _batteryMethodChannel.invokeMethod('status');
    if (batteryStatus is! String) {
      throw Exception('Something went wrong!!!');
    }
    final status = batteryStatus;
    final result = status.batteryStatus();
    return result;
  }

  Stream<int> get onBatteryLevelChange =>
      _batteryLevelEventChannel.receiveBroadcastStream().cast<int>();

  Stream<BatteryStatus> get onBatteryStateChange => _batteryStatusEventChannel
      .receiveBroadcastStream()
      .cast<String>()
      .map((batteryStatus) => batteryStatus.batteryStatus());
}
