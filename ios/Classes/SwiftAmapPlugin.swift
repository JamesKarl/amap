import Flutter
import UIKit
import AMapFoundationKit

public class SwiftAmapPlugin: NSObject, FlutterPlugin {
    static let mapViewType = "com.jameskarl/mapView"
    private static let channelName = "com.jameskarl/map"
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        AMapServices.shared().apiKey = "95dd02f71afb8c8fdeb4273ce402edce"
    
        registrar.addMethodCallDelegate(
            SwiftAmapPlugin(),
            channel: FlutterMethodChannel(
                name: channelName,
                binaryMessenger: registrar.messenger()
            )
        )
        
        registrar.register(MapViewFactory(registrar: registrar), withId: mapViewType)
    }
}
