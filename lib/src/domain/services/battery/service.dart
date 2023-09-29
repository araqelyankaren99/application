import 'package:application/src/domain/services/battery/plugin.dart';
import 'package:application/src/utils/enum/battery_status.dart';

class BatteryService {
  BatteryService._getInstance();

  factory BatteryService() => _instance;
  static final _instance = BatteryService._getInstance();

  static final _batteryPlugin = BatteryPlugin();

  Future<int> getBatteryLevel() async {
    final batteryLevel = await _batteryPlugin.getBatteryLevel();
    return batteryLevel;
  }

  Future<BatteryStatus> getBatteryStatus() async {
    final batteryStatus = await _batteryPlugin.getBatteryStatus();
    return batteryStatus;
  }

  Stream<int> get onBatteryLevelChange => _batteryPlugin.onBatteryLevelChange;

  Stream<BatteryStatus> get onBatteryStatusChange => _batteryPlugin.onBatteryStateChange;
}
