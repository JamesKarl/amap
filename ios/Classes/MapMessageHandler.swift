//
//  MapMessageHandler.swift
//  amap
//
//  Created by James Karl on 2019/9/11.
//

import Foundation
import MAMapKit

class MapMessageHandler : NSObject, MAMapViewDelegate {
    let registrar: FlutterPluginRegistrar
    let mapView: MAMapView
    let viewId: Int
    
    let mapMethodChannelName: String
    let messageChannel: FlutterBasicMessageChannel
    
    init(registrar: FlutterPluginRegistrar, mapView: MAMapView, viewId: Int) {
        self.registrar = registrar
        self.mapView = mapView
        self.viewId = viewId
        
        self.mapMethodChannelName = "\(SwiftAmapPlugin.mapViewType)/map\(viewId)"
        self.messageChannel = FlutterBasicMessageChannel.init(name: mapMethodChannelName, binaryMessenger:  registrar.messenger(),codec: FlutterStringCodec.init())
    }
    
    func setup() {
        messageChannel.setMessageHandler({ message, reply in
            print("message from flutter \(String(describing: message))")
            if let messageData  = (message as? String)?.data(using: .utf8) {
                if let json = (try? JSONSerialization.jsonObject(with: messageData, options: [])) as? [String: Any?] {
                    if let methodId = json["id"] as? String {
                        MapMethods.handleMessage(mapView: self.mapView, methodId: methodId, data: json["data"] as Any?, reply: reply)
                    }
                }
                
            }
        })
        mapView.delegate = self
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MAMapView!) {
        print("xxxxx map loaded")
        sendJsonMessageToFlutter(message: ReplyToFlutter<String>.success(id: MapMethods.onMapLoaded))
    }
    
    func sendJsonMessageToFlutter<T: Codable> (message: ReplyToFlutter<T>) {
        if let jsonData = try? MapMethods.jsonEncoder.encode(message) {
            messageChannel.sendMessage(String(data:jsonData, encoding: .utf8))
        } else {
            print("sendJsonMessageToFlutter failed \(message)")
        }
    }
}
