//
//  PlatformMapView.swift
//  amap
//
//  Created by James Karl on 2019/9/11.
//

import Foundation
import MAMapKit

class PlatformMapView : NSObject, FlutterPlatformView {
    
    let registrar: FlutterPluginRegistrar
    let frame: CGRect
    let viewId: Int
    let args: Any?
    
    let mapView: MAMapView
    let messageHandler: MapMessageHandler
    
    init(withFrame frame: CGRect, viewIdentifier viewId: Int, arguments args: Any?, registrar: FlutterPluginRegistrar) {
        self.frame = frame
        self.viewId = viewId
        self.args = args
        self.registrar = registrar
        
        mapView = MAMapView(frame: frame)
        
        messageHandler = MapMessageHandler(registrar: registrar, mapView: mapView, viewId: viewId)
        messageHandler.setup()
        
    }
    
    func view() -> UIView {
        return mapView
    }
}
