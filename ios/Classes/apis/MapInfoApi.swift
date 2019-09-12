//
//  MapInfoApi.swift
//  amap
//
//  Created by James Karl on 2019/9/12.
//

import Foundation
import MAMapKit

class MapInfoApi : FlutterApi {
    
    func handle(methodId: String, mapView: MAMapView, data: Any?, reply: FlutterReply) -> Bool {
        var consumed = true
        switch methodId {
        case "setZoomControlsEnabled":
            setZoomControlsEnabled(mapView: mapView, data: data)
        case "setCompassEnabled":
            setCompassEnabled(mapView: mapView, data: data)
        case "setMyLocationButtonEnabled" :
            setMyLocationButtonEnabled(mapView: mapView, data: data)
        case "setMyLocationEnabled" :
            setMyLocationEnabled(mapView: mapView, data: data)
        case "setScaleControlsEnabled" :
            setScaleControlsEnabled(mapView: mapView, data: data)
        case "setLogoPosition" :
            setLogoPosition(mapView: mapView, data: data)
        case "setZoomGesturesEnabled" :
            setZoomGesturesEnabled(mapView: mapView, data: data)
        case "setScrollGesturesEnabled" :
            setScrollGesturesEnabled(mapView: mapView, data: data)
        case "setRotateGesturesEnabled" :
            setRotateGesturesEnabled(mapView: mapView, data: data)
        case "setTiltGesturesEnabled" :
            setTiltGesturesEnabled(mapView: mapView, data: data)
        case "setPointToCenter" :
            setPointToCenter(mapView: mapView, data: data)
        case "setGestureScaleBymapViewCenter" : setGestureScaleBymapViewCenter(mapView: mapView, data: data)
        case "getCenter" :
            getCenter(mapView: mapView)
        default :
            consumed = false
        }
        return consumed
    }
    
    
    private func getCenter(mapView: MAMapView) {
        //        let target = mapView.cameraPosition.target
        //        let data = {
        //            "longitude" : target.longitude,
        //            "latitude" : target.latitude
        //        }
    }
    
    private func setZoomControlsEnabled(mapView: MAMapView, data: Any?) {
        //        require(data is Boolean)
        //        mapView.uiSettings.isZoomControlsEnabled = data
        //        return Bool.Success()
    }
    
    private func setCompassEnabled(mapView: MAMapView, data: Any?) {
        //        require(data is Boolean)
        //        mapView.uiSettings.isCompassEnabled = data
        //        return Bool.Success()
    }
    
    private func setMyLocationButtonEnabled(mapView: MAMapView,  data: Any?) {
        //        require(data is Boolean)
        //        mapView.uiSettings.isMyLocationButtonEnabled = data
        //        return Bool.Success()
    }
    
    private func setMyLocationEnabled(mapView: MAMapView, data: Any?) {
        //        require(data is Boolean)
        //        mapView.isMyLocationEnabled = data
        //        return Bool.Success()
    }
    
    private func setScaleControlsEnabled(mapView: MAMapView, data: Any?) {
        //        require(data is Boolean)
        //        mapView.uiSettings.isScaleControlsEnabled = data
        //        return Bool.Success()
    }
    
    private func setLogoPosition(mapView: MAMapView, data: Any?) {
        //        require(data is Int)
        //        mapView.uiSettings.logoPosition = data
        //        return Bool.Success()
    }
    
    private func setZoomGesturesEnabled(mapView: MAMapView, data:  Any?) {
        //        require(data is Boolean)
        //        mapView.uiSettings.isZoomGesturesEnabled = data
        //        return Bool.Success()
    }
    
    private func setScrollGesturesEnabled(mapView: MAMapView, data: Any?) {
        //        require(data is Boolean)
        //        mapView.uiSettings.isScrollGesturesEnabled = data
        //        return Bool.Success()
    }
    
    private func setRotateGesturesEnabled(mapView: MAMapView, data: Any?) {
        //        require(data is Boolean)
        //        mapView.uiSettings.isRotateGesturesEnabled = data
        //        return Bool.Success()
    }
    
    private func setTiltGesturesEnabled(mapView: MAMapView, data: Any?) {
        //        require(data is Boolean)
        //        mapView.uiSettings.isTiltGesturesEnabled = data
        //        return Bool.Success()
    }
    
    private func setPointToCenter(mapView: MAMapView, data: Any?) {
        //        require(data is JSONObject)
        //        mapView.setPointToCenter(data["x"] as Int, data["y"] as Int)
        //        return Bool.Success()
    }
    
    private func setGestureScaleBymapViewCenter(mapView: MAMapView, data: Any?) {
        //        require(data is Boolean)
        //        mapView.uiSettings.isGestureScaleBymapViewCenter = data
        //        return Bool.Success()
    }
}
