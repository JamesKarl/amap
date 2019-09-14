//
//  CameraApi.swift
//  amapView
//
//  Created by James Karl on 2019/9/12.
//

import Foundation
import MAMapKit

class CameraApi : FlutterApi {
    func handle(mapView: MAMapView, methodId: String,  data: Any?) -> ReplyToFlutter? {
        var result: ReplyToFlutter? = nil
        switch methodId {
        case "changeBearing":  result = changeBearing(mapView: mapView,data: data)
        case "changeLatLng":  result = changeLatLng(mapView: mapView,data: data)
        case "changeTilt":  result = changeTilt(mapView: mapView,data: data)
        case "zoomIn":  result = zoomIn(mapView: mapView)
        case "zoomOut":  result = zoomOut(mapView: mapView)
        case "zoomTo":  result = zoomTo(mapView: mapView,data: data)
        case "newLatLng":  result = newLatLng(mapView: mapView,data: data)
        case "newLatLngZoom":  result = newLatLngZoom(mapView: mapView,data: data)
        case "scrollBy":  result = scrollBy(mapView: mapView,data: data)
        case "newCameraPosition":  result = newCameraPosition(mapView: mapView,data: data)
        case "newLatLngBounds":  result = newLatLngBounds(mapView: mapView,data: data)
        case "newLatLngBoundsRect":  result = newLatLngBoundsRect(mapView: mapView,data: data)
        case "zoomBy":  result = zoomBy(mapView: mapView,data: data)
        default:
            result = nil
        }
        return result
    }
    
    private func changeBearing(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        //        if let bearing = data as? Float {
        //            mapView.camera
        //        }
        //        mapView.moveCamera(CameraUpdateFactory.changeBearing(data.toFloat()))
        return ReplyToFlutter.notImplemented()
    }
    
    private func changeLatLng(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        if let json = data as? [String: Double] {
            if let center = CLLocationCoordinate2D(json: json) {
                mapView.setCenter(center, animated: true)
                return ReplyToFlutter.success()
            }
        }
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func changeTilt(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        //    require(data is Double)
        //    map.moveCamera(CameraUpdateFactory.changeTilt(data.toFloat()))
        //    return ReplyToFlutter.Success()
        return ReplyToFlutter.notImplemented()
    }
    
    private func zoomIn(mapView: MAMapView) -> ReplyToFlutter {
        let zoom = mapView.zoomLevel + 1
        if zoom <= mapView.maxZoomLevel {
            mapView.setZoomLevel(zoom , animated:  true)
        }
        return ReplyToFlutter.success()
    }
    
    private func zoomOut(mapView: MAMapView) -> ReplyToFlutter {
        let zoom = mapView.zoomLevel - 1
        if (zoom >= mapView.minZoomLevel) {
            mapView.setZoomLevel(zoom, animated: true)
        }
        return ReplyToFlutter.success()
    }
    
    private func zoomTo(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        if let zoom = data as? Float {
            let z = CGFloat(zoom)
            let finalZoom = z > mapView.maxZoomLevel ? mapView.maxZoomLevel : (z < mapView.minZoomLevel ? mapView.minZoomLevel : z)
            mapView.setZoomLevel(finalZoom, animated: true)
            return ReplyToFlutter.success()
        } else {
            return ReplyToFlutter.failed(message: "zoom value must be a float between 3 to 19")
        }
    }
    
    private func newCameraPosition(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        //    require(data is JSONObject)
        //    val cameraPositionData: CameraPositionData? = data.toString().parseObject()
        //    require(cameraPositionData != null)
        //    map.moveCamera(CameraUpdateFactory.newCameraPosition(cameraPositionData.toCameraPosition()))
        //    return ReplyToFlutter.Success()
        return ReplyToFlutter.notImplemented()
    }
    
    private func newLatLng(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        //    require(data is JSONObject)
        //    val latLngData: LatLngData? = data.toString().parseObject()
        //    require(latLngData != null)
        //    map.moveCamera(CameraUpdateFactory.newLatLng(latLngData.toLatLng()))
        //    return ReplyToFlutter.Success()
        return ReplyToFlutter.notImplemented()
    }
    
    private func newLatLngBounds(mapView: MAMapView, data: Any?)  -> ReplyToFlutter{
        //    require(data is JSONObject)
        //    val bounds: LatLngBoundsData? = data.opt("bounds")?.toString()?.parseObject()
        //    val width = data.optInt("width")
        //    val height = data.optInt("height")
        //    val padding = data.optInt("padding")
        //    require(bounds != null)
        //    if (width > 0 && height > 0) {
        //    map.moveCamera(CameraUpdateFactory.newLatLngBounds(bounds.toLatLngBounds(), width, height, padding))
        //    } else {
        //    map.moveCamera(CameraUpdateFactory.newLatLngBounds(bounds.toLatLngBounds(), padding))
        //    }
        //    return ReplyToFlutter.Success()
        return ReplyToFlutter.illegalArgumentException()
    }
    
    private func newLatLngBoundsRect(mapView: MAMapView, data: Any?)  -> ReplyToFlutter {
        //    require(data is JSONObject)
        //    val bounds: LatLngBoundsData? = data.opt("latLngBounds")?.toString()?.parseObject()
        //    val paddingLeft = data.optInt("paddingLeft")
        //    val paddingRight = data.optInt("paddingRight")
        //    val paddingTop = data.optInt("paddingTop")
        //    val paddingBottom = data.optInt("paddingBottom")
        //    require(bounds != null)
        //    map.moveCamera(CameraUpdateFactory.newLatLngBoundsRect(bounds.toLatLngBounds(), paddingLeft, paddingRight, paddingTop, paddingBottom))
        //    return ReplyToFlutter.Success()
        return ReplyToFlutter.notImplemented()
    }
    
    private func newLatLngZoom(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        //    require(data is JSONObject)
        //    val latLng: LatLngData? = data.opt("latLng")?.toString()?.parseObject()
        //    val zoom = data.optDouble("zoom")
        //    require(latLng != null && !zoom.isNaN())
        //    map.moveCamera(CameraUpdateFactory.newLatLngZoom(latLng.toLatLng(), zoom.toFloat()))
        //    return ReplyToFlutter.Success()
        return ReplyToFlutter.notImplemented()
    }
    
    private func scrollBy(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        //    require(data is JSONObject)
        //    val xPixel = data.optDouble("xPixel")
        //    val yPixel = data.optDouble("yPixel")
        //    require(!xPixel.isNaN() && !yPixel.isNaN())
        //    map.moveCamera(CameraUpdateFactory.scrollBy(xPixel.toFloat(), yPixel.toFloat()))
        //    return ReplyToFlutter.Success()
        return ReplyToFlutter.notImplemented()
    }
    
    private func zoomBy(mapView: MAMapView, data: Any?) -> ReplyToFlutter {
        //    require(data is JSONObject)
        //    val amount = data.optDouble("amount")
        //    val focus = data.opt("focus")?.toString()?.parseObject<ScreenPoint>()
        //    require(focus != null)
        //    map.moveCamera(CameraUpdateFactory.zoomBy(amount.toFloat(), focus.toPoint()))
        //    return ReplyToFlutter.Success()
        return ReplyToFlutter.notImplemented()
    }
}
