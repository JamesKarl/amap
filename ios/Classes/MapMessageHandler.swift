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
            if let message = message {
                self.handleMessage(message: message, reply: reply)
            }
        })
        mapView.delegate = self
    }
    
    func handleMessage(message: Any, reply: FlutterReply) {
        
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MAMapView!) {
        print("xxxxx map loaded")
        sendJsonMessageToFlutter(message: ReplyToFlutter<String>.success(id: MapMethods.onMapLoaded))
    }
    
    func sendJsonMessageToFlutter<T: Codable> (message: ReplyToFlutter<T>) {
        let jsonEncoder = JSONEncoder()
        if let jsonData = try? jsonEncoder.encode(message) {
            messageChannel.sendMessage(String(data:jsonData, encoding: .utf8))
        } else {
            print("sendJsonMessageToFlutter failed \(message)")
        }
    }
}
