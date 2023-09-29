import 'package:application/src/utils/enum/battery_status.dart';

extension BatteryStatusExtension on String {
  BatteryStatus batteryStatus() {
    if (this == 'full') {
      return BatteryStatus.full;
    }

    if (this == 'charging') {
      return BatteryStatus.charging;
    }

    if (this == 'discharging') {
      return BatteryStatus.discharging;
    }

    return BatteryStatus.unknown;
  }
}
