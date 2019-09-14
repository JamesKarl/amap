//
//  MapInfoApi.swift
//  amap
//
//  Created by James Karl on 2019/9/12.
//

import Foundation
import MAMapKit

class MapInfoApi : FlutterApi {
    
    func handle(mapView: MAMapView, methodId: String, data: Any?) -> ReplyToFlutter? {
        var result: ReplyToFlutter? = nil
        switch methodId {
        case "setZoomControlsEnabled":
            result = setZoomControlsEnabled(mapView: mapView, data: data)
        case "setCompassEnabled":
            result = setCompassEnabled(mapView: mapView, data: data)
        case "setMyLocationButtonEnabled" :
            result = setMyLocationButtonEnabled(mapView: mapView, data: data)
        case "setMyLocationEnabled" :
            result = setMyLocationEnabled(mapView: mapView, data: data)
        case "setScaleControlsEnabled" :
            result = setScaleControlsEnabled(mapView: mapView, data: data)
        case "setLogoPosition" :
            result = setLogoPosition(mapView: mapView, data: data)
        case "setZoomGesturesEnabled" :
            result = setZoomGesturesEnabled(mapView: mapView, data: data)
        case "setScrollGesturesEnabled" :
            result = setScrollGesturesEnabled(mapView: mapView, data: data)
        case "setRotateGesturesEnabled" :
            result = setRotateGesturesEnabled(mapView: mapView, data: data)
        case "setTiltGesturesEnabled" :
            result = setTiltGesturesEnabled(mapView: mapView, data: data)
        case "setPointToCenter" :
            result = setPointToCenter(mapView: mapView, data: data)
        case "setGestureScaleBymapViewCenter" :
            result = setGestureScaleBymapViewCenter(mapView: mapView, data: data)
        case "getCenter" :
            result = getCenter(mapView: mapView)
        default :
            result = nil
        }
        return result
    }
    
    
    private func getCenter(mapView: MAMapView) -> ReplyToFlutter {
        //        let target = mapView.cameraPosition.target
        //        let data = {
        //            "longitude" : target.longitude,
        //            "latitude" : target.latitude
        //        }
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setZoomControlsEnabled(mapView: MAMapView, data: Any?)-> ReplyToFlutter {
        //        require(data is Boolean)
        //        mapView.uiSettings.isZoomControlsEnabled = data
        //        return Bool.Success()
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setCompassEnabled(mapView: MAMapView, data: Any?) -> ReplyToFlutter{
        //        require(data is Boolean)
        //        mapView.uiSettings.isCompassEnabled = data
        //        return Bool.Success()
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setMyLocationButtonEnabled(mapView: MAMapView,  data: Any?) -> ReplyToFlutter{
        //        require(data is Boolean)
        //        mapView.uiSettings.isMyLocationButtonEnabled = data
        //        return Bool.Success()
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setMyLocationEnabled(mapView: MAMapView, data: Any?) -> ReplyToFlutter{
        //        require(data is Boolean)
        //        mapView.isMyLocationEnabled = data
        //        return Bool.Success()
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setScaleControlsEnabled(mapView: MAMapView, data: Any?) -> ReplyToFlutter{
        //        require(data is Boolean)
        //        mapView.uiSettings.isScaleControlsEnabled = data
        //        return Bool.Success()
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setLogoPosition(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        //        require(data is Int)
        //        mapView.uiSettings.logoPosition = data
        //        return Bool.Success()
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setZoomGesturesEnabled(mapView: MAMapView, data:  Any?) -> ReplyToFlutter {
        //        require(data is Boolean)
        //        mapView.uiSettings.isZoomGesturesEnabled = data
        //        return Bool.Success()
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setScrollGesturesEnabled(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        //        require(data is Boolean)
        //        mapView.uiSettings.isScrollGesturesEnabled = data
        //        return Bool.Success()
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setRotateGesturesEnabled(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        //        require(data is Boolean)
        //        mapView.uiSettings.isRotateGesturesEnabled = data
        //        return Bool.Success()
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setTiltGesturesEnabled(mapView: MAMapView, data: Any?) -> ReplyToFlutter{
        //        require(data is Boolean)
        //        mapView.uiSettings.isTiltGesturesEnabled = data
        //        return Bool.Success()
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setPointToCenter(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        //        require(data is JSONObject)
        //        mapView.setPointToCenter(data["x"] as Int, data["y"] as Int)
        //        return Bool.Success()
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setGestureScaleBymapViewCenter(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        //        require(data is Boolean)
        //        mapView.uiSettings.isGestureScaleBymapViewCenter = data
        //        return Bool.Success()
        return ReplyToFlutter.illegalArgumentException()
    }
}
