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
    
    static func handleMessage(mapView: MAMapView, methodId: String, data: Any?, reply: FlutterReply) {
        
    }
    
    static func handleException(methodId: String, message: String?, reply: FlutterReply) {
        notifyFlutter(reply: reply, message: ReplyToFlutter<String>.failed(id: methodId, message: methodId))
    }
    
    private static func notifyFlutter<T: Codable>(reply: FlutterReply, message: ReplyToFlutter<T>) {
        if let jsonData = try? jsonEncoder.encode(message) {
            reply(String(data:jsonData, encoding: .utf8))
        } else {
            let errorMessage = ReplyToFlutter<String>.failed(id: message.id, message: "encode message to json string failed.")
            if let jsonData = try? jsonEncoder.encode(errorMessage) {
                reply(String(data: jsonData, encoding: .utf8))
            }
            
        }
    }
}
