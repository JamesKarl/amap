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
        return ReplyToFlutter.notImplemented()
    }
    
    private func setZoomControlsEnabled(mapView: MAMapView, data: Any?)-> ReplyToFlutter {
        if let enable = data as? Bool {
            mapView.isZoomEnabled = enable
            return ReplyToFlutter.success()
        }
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setCompassEnabled(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        if let show = data as? Bool {
            mapView.showsCompass = show
            return ReplyToFlutter.success()
        }
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setMyLocationButtonEnabled(mapView: MAMapView,  data: Any?) -> ReplyToFlutter{
        //        require(data is Boolean)
        //        mapView.uiSettings.isMyLocationButtonEnabled = data
        //        return Bool.Success()
        return ReplyToFlutter.notImplemented()
    }
    
    private func setMyLocationEnabled(mapView: MAMapView, data: Any?) -> ReplyToFlutter{
        //        require(data is Boolean)
        //        mapView.isMyLocationEnabled = data
        //        return Bool.Success()
        return ReplyToFlutter.notImplemented()
    }
    
    private func setScaleControlsEnabled(mapView: MAMapView, data: Any?) -> ReplyToFlutter{
        if let show = data as? Bool {
            mapView.showsScale = show
            return ReplyToFlutter.success()
        }
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setLogoPosition(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        if let position = data as? Int {
            let w = mapView.bounds.width;
            var x = 10
            switch position {
            case 0:
                x = 10
            case 1:
                x = Int(w / 2)
            case 2:
                x = Int(w - 30)
            default:
                x = 20
            }
            mapView.logoCenter = CGPoint(x: x, y: 12)
            return ReplyToFlutter.success()
        }
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setZoomGesturesEnabled(mapView: MAMapView, data:  Any?) -> ReplyToFlutter {
        if let enabled = data as? Bool {
            mapView.isZoomEnabled = enabled
            return ReplyToFlutter.success()
        }
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setScrollGesturesEnabled(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        if let enabled = data as? Bool {
            mapView.isScrollEnabled = enabled
            return ReplyToFlutter.success()
        }
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setRotateGesturesEnabled(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        if let enabled = data as? Bool {
            mapView.isRotateEnabled = enabled
            return ReplyToFlutter.success()
        }
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func setTiltGesturesEnabled(mapView: MAMapView, data: Any?) -> ReplyToFlutter{
        //        require(data is Boolean)
        //        mapView.uiSettings.isTiltGesturesEnabled = data
        //        return Bool.Success()
        return ReplyToFlutter.notImplemented()
    }
    
    private func setPointToCenter(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        //        require(data is JSONObject)
        //        mapView.setPointToCenter(data["x"] as Int, data["y"] as Int)
        //        return Bool.Success()
        return ReplyToFlutter.notImplemented()
    }
    
    private func setGestureScaleBymapViewCenter(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        //        require(data is Boolean)
        //        mapView.uiSettings.isGestureScaleBymapViewCenter = data
        //        return Bool.Success()
        return ReplyToFlutter.notImplemented()
    }
}
