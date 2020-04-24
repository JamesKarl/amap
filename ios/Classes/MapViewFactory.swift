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
        print("MapViewFactory.create", frame, viewId, args ?? "args is nil")
        let platformMapView = PlatformMapView(withFrame: frame, viewIdentifier: Int(viewId), creationParams: parseCreationParams(params: args), registrar: registrar)
        platformMapView.initWithCreationParams()
        return platformMapView
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStringCodec()
    }
    
    private func parseCreationParams(params: Any?) -> MapCreationParams? {
        var createParams: MapCreationParams? = nil

        if let paramsData = (params as? String)?.data(using: .utf8) {
            if let json = (try? JSONSerialization.jsonObject(with: paramsData, options: [])) as? [String: Any?] {
                createParams = MapCreationParams(json: json)
            }
        }

        if (params != nil && createParams == nil) {
            print("MAP", "MapViewFactory params: \(params.debugDescription)")
        } else {
            print("MAP", "\(String(describing: createParams))")
        }

        return createParams
    }
}
