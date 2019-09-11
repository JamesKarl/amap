//
//  MapViewFactory.swift
//  amap
//
//  Created by James Karl on 2019/9/11.
//

import Foundation

class MapViewFactory : NSObject, FlutterPlatformViewFactory{
    
    let registrar: FlutterPluginRegistrar
    
    init(registrar: FlutterPluginRegistrar) {
        self.registrar = registrar;
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return PlatformMapView(withFrame: frame, viewIdentifier: viewId, arguments: args)
    }
}
