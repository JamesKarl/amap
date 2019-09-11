import Flutter
import UIKit

public class SwiftAmapPlugin: NSObject, FlutterPlugin {
    static let mapViewType = "com.jameskarl/mapView"
    private static let channelName = "com.jameskarl/map"
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: channelName, binaryMessenger: registrar.messenger())
        let instance = SwiftAmapPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result("iOS " + UIDevice.current.systemVersion)
    }
}
