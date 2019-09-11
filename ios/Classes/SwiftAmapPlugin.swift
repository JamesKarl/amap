import Flutter
import UIKit
import AMapFoundationKit

public class SwiftAmapPlugin: NSObject, FlutterPlugin {
    static let mapViewType = "com.jameskarl/mapView"
    private static let channelName = "com.jameskarl/map"
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        AMapServices.shared().apiKey = "95dd02f71afb8c8fdeb4273ce402edce"
    
        let channel = FlutterMethodChannel(name: channelName, binaryMessenger: registrar.messenger())
        let instance = SwiftAmapPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        
        let mapViewFactory = MapViewFactory(registrar: registrar)
        registrar.register(mapViewFactory, withId: mapViewType)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        default:
            result(FlutterMethodNotImplemented)
        }
        
    }
}
