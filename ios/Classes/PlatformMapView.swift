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
    let creationParams: MapCreationParams?
    
    let mapView: MAMapView
    let messageHandler: MapMessageHandler
    
    init(withFrame frame: CGRect, viewIdentifier viewId: Int, creationParams: MapCreationParams?, registrar: FlutterPluginRegistrar) {
        self.frame = frame
        self.viewId = viewId
        self.creationParams = creationParams
        self.registrar = registrar
        
        mapView = MAMapView(frame: frame)
        
        messageHandler = MapMessageHandler(registrar: registrar, mapView: mapView, viewId: viewId)
        messageHandler.setup()
        
    }
    
    func view() -> UIView {
        return mapView
    }
    
    func initWithCreationParams() {
        if let cameraArgs = creationParams?.cameraPosition {
            if let centerPoint = cameraArgs.target {
                mapView.setCenter(centerPoint.toMapPoint(), animated: false)
            }
            if let zoom = cameraArgs.zoom {
                mapView.setZoomLevel(CGFloat(zoom), animated: false)
            }
        }
        
        if let settings = creationParams?.settings {
            if let s = settings.myLocationButtonEnabled {
                mapView.showsUserLocation = s
                mapView.userTrackingMode = .follow
            }
        }
    }
}
