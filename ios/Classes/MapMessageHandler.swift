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
        self.messageChannel = FlutterBasicMessageChannel.init(
            name: mapMethodChannelName,
            binaryMessenger:  registrar.messenger(),
            codec: FlutterStringCodec.sharedInstance()
        )
    }
    
    func setup() {
        messageChannel.setMessageHandler({ message, reply in
            print("message from flutter \(String(describing: message))")
            if let messageData  = message as? String {
                self.onReceiveFlutterMessage(message: messageData, reply: reply)
            } else {
                self.sendJsonMessageToFlutter(message: ReplyToFlutter.failed(message:"message must be a json string"))
            }
        })
        mapView.delegate = self
    }
    
    func onReceiveFlutterMessage(message: String, reply: FlutterReply) {
        if let messageData  = message.data(using: .utf8) {
            if let json = (try? JSONSerialization.jsonObject(with: messageData, options: [])) as? [String: Any?] {
                if let methodId = json["id"] as? String {
                    MapMethods.handleMessage(mapView: self.mapView, methodId: methodId, data: json["data"] as Any?, reply: reply)
                } else {
                    self.sendJsonMessageToFlutter(message: ReplyToFlutter.failed(message:"method id NOT found \(String(describing: message))"))
                }
            } else  {
                self.sendJsonMessageToFlutter(message: ReplyToFlutter.failed(message:"parse josn message \(String(describing: message)) failed)"))
            }
        } else {
            self.sendJsonMessageToFlutter(message: ReplyToFlutter.failed(message:"message  \(String(describing: message)) must be a json string"))
        }
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MAMapView!) {
        print("xxxxx map loaded")
        sendJsonMessageToFlutter(message: ReplyToFlutter.success(id: MapMethods.onMapLoaded))
    }
    
    func sendJsonMessageToFlutter(message: ReplyToFlutter) {
        if let json = message.toJson() {
            messageChannel.sendMessage(json)
        } else {
            print("sendJsonMessageToFlutter failed \(message)")
        }
    }

    func mapView(_ mapView: MAMapView!, didSingleTappedAt coordinate: CLLocationCoordinate2D) {
        sendJsonMessageToFlutter(message: ReplyToFlutter.success(id: MapMethods.onMapClicked, data: coordinate.toLatLngData()))
    }
    
    func mapView(_ mapView: MAMapView!, didAnnotationViewTapped view: MAAnnotationView!) {
        sendJsonMessageToFlutter(message: ReplyToFlutter.success(id: MapMethods.onMarkerClicked, data: view.toAnnotationViewData()))
    }
    
}
