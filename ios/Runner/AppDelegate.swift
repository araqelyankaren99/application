import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let batteryController : FlutterViewController = window?.rootViewController as! FlutterViewController
      BatteryHandler.registerBatteryInfo(controller: batteryController)
      BatteryHandler.registerBatteryLevelSubscribe(controller: batteryController)
      BatteryHandler.registerBatteryStatusSubscribe(controller: batteryController)
      
   GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

class BatteryHandler {
    public static func registerBatteryInfo(controller : FlutterViewController){
        let batteryChannelName = "battery.com/info"
        let batteryChannel = FlutterMethodChannel(
            name: batteryChannelName,binaryMessenger: controller.binaryMessenger)
        
        batteryChannel.setMethodCallHandler({
             (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            switch(call.method) {
            case "status" :
               result(self.receiveBatteryStatusHandler())
                
            case "level":
                result(self.receiveBatteryLevelHandler())
  
            default:
                result(FlutterMethodNotImplemented)
            }
           })
    }
    
    private static func receiveBatteryStatusHandler() -> String{
        let status = BatteryStatusHandler().receiveBatteryStatus()
        return status?.description ?? "unkown"
    }
    
    private static func receiveBatteryLevelHandler() -> Int{
        let level = BatteryLevelHandler().receiveBatteryLevel()
        return level ?? -1
    }
    
    public static func registerBatteryLevelSubscribe(controller : FlutterViewController) {
     let batteryChannelName = "battery.com/level/subscribe"
     let batteryChannel = FlutterEventChannel(name: batteryChannelName, binaryMessenger: controller.binaryMessenger)
        batteryChannel.setStreamHandler(BatteryLevelHandler())
    }
    
    public static func registerBatteryStatusSubscribe(controller : FlutterViewController) {
     let batteryChannelName = "battery.com/status/subscribe"
     let batteryChannel = FlutterEventChannel(name: batteryChannelName, binaryMessenger: controller.binaryMessenger)
        batteryChannel.setStreamHandler(BatteryStatusHandler())
    }
}

class BatteryLevelHandler: NSObject, FlutterStreamHandler {
      var eventSink: FlutterEventSink?
    
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events
          UIDevice.current.isBatteryMonitoringEnabled = true
          let batteryLevel = receiveBatteryLevel()
          eventSink?(batteryLevel)
          
                NotificationCenter.default.addObserver(
                    self,
                    selector: #selector(self.onBatteryLevelDidChange),
                    name: UIDevice.batteryLevelDidChangeNotification,
                    object: nil)

        return nil
      }
    
      public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.eventSink = nil
        NotificationCenter.default.removeObserver(self)
        return nil
      }
    
    @objc private func onBatteryLevelDidChange(notification: NSNotification) {
          let batteryLevel = receiveBatteryLevel()
          eventSink?(batteryLevel)
        }
    
    
     public func receiveBatteryLevel() -> Int?{
       let device = UIDevice.current
       device.isBatteryMonitoringEnabled = true
       guard device.batteryState != .unknown  else {
         return nil
       }
     
       let result = Int(device.batteryLevel * 100)
       return result
     }
}

class BatteryStatusHandler: NSObject, FlutterStreamHandler {
    var eventSink: FlutterEventSink?
    
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events
        UIDevice.current.isBatteryMonitoringEnabled = true

        let batteryStatus = receiveBatteryStatus()
        eventSink?(batteryStatus?.description)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.onBatteryStateDidChange),
            name: UIDevice.batteryStateDidChangeNotification,
            object: nil)
        
        return nil
    }
    
    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.eventSink = nil
        NotificationCenter.default.removeObserver(self)
        
        return nil
    }
    
    @objc private func onBatteryStateDidChange(notification: NSNotification) {
        let batteryStatus = receiveBatteryStatus()
        eventSink?(batteryStatus?.description)
    }
    
    
    public func receiveBatteryStatus() -> BatteryState?{
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        guard device.batteryState != .unknown  else {
          return nil
        }
        
        let batteryState: UIDevice.BatteryState = device.batteryState
        switch batteryState{
        case .unknown:
            return BatteryState.unknown
        case .unplugged:
            return BatteryState.discharging
        case .charging:
            return BatteryState.charging
        case .full:
            return BatteryState.full
        @unknown default:
            return BatteryState.unknown
        }
    }
}

enum BatteryState {
  case full
  case charging
  case discharging
  case unknown
    
    var description : String {
       switch self {
       case .full: return "full"
       case .charging: return "charging"
       case .discharging: return "discharging"
       case .unknown: return "unknown"
       }
     }
}
