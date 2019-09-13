//
//  MapMethods.swift
//  amap
//
//  Created by James Karl on 2019/9/11.
//

import Foundation
import MAMapKit

class MapMethods {
    static let onMapLoaded = "onMapLoaded"
    static let onMapClicked = "onMapClicked"
    
    static let onMarkerClicked = "onMarkerClicked"
    static let onMarkerDragged = "onMarkerDragged"
    static let onMarkerDragStart = "onMarkerDragStart"
    static let onMarkerDragEnd = "onMarkerDragEnd"
    static let onInfoWindowClicked = "onInfoWindowClicked"
    
    static let onCameraChange = "onCameraChange"
    static let onCameraChangeFinish = "onCameraChangeFinish"
    
    static let jsonEncoder = JSONEncoder()
    static let jsonDecoder = JSONDecoder()
    
    static let flutterApis:[FlutterApi] = [MarkerApi(), MapInfoApi(), CameraApi()]
    
    static func handleMessage(mapView: MAMapView, methodId: String, data: Any?, reply: FlutterReply) {
        print("MAP handleMessage \(String(describing: methodId)) -> \(String(describing: data))")
        for api in flutterApis {
            if let result = api.handle(mapView: mapView, methodId: methodId, data: data) {
                result.id = methodId
                notifyFlutter(reply: reply, message: result)
                return
            }
        }
        handleException(methodId: "???", message: "\(methodId) NOT IMPLEMENTED ", reply: reply)
    }
    
    static func handleException(methodId: String, message: String?, reply: FlutterReply) {
        notifyFlutter(reply: reply, message: ReplyToFlutter.failed(id: methodId, message: methodId))
    }
    
    static func notifyFlutter(reply: FlutterReply, message: ReplyToFlutter) {
        if let json = message.toJson() {
            reply(json)
        } else {
            let errorMessage = ReplyToFlutter.failed(id: message.id, message: "encode message \(message) to json string failed.")
            reply(errorMessage.toJson())
        }
    }
}
