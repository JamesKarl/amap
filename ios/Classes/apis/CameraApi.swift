//
//  CameraApi.swift
//  amapView
//
//  Created by James Karl on 2019/9/12.
//

import Foundation
import MAMapKit

class CameraApi : FlutterApi {
    func handle(methodId: String, mapView: MAMapView, data: Any?, reply: FlutterReply) -> Bool {
        var consumed = true
        switch methodId {
        case "changeBearing":  changeBearing(mapView: mapView,data: data)
        case "changeLatLng":  changeLatLng(mapView: mapView,data: data)
        case "changeTilt":  changeTilt(mapView: mapView,data: data)
        case "zoomIn":  zoomIn(mapView: mapView)
        case "zoomOut":  zoomOut(mapView: mapView)
        case "zoomTo":  zoomTo(mapView: mapView,data: data)
        case "newLatLng":  newLatLng(mapView: mapView,data: data)
        case "newLatLngZoom":  newLatLngZoom(mapView: mapView,data: data)
        case "scrollBy":  scrollBy(mapView: mapView,data: data)
        case "newCameraPosition":  newCameraPosition(mapView: mapView,data: data)
        case "newLatLngBounds":  newLatLngBounds(mapView: mapView,data: data)
        case "newLatLngBoundsRect":  newLatLngBoundsRect(mapView: mapView,data: data)
        case "zoomBy":  zoomBy(mapView: mapView,data: data)
        default:
            consumed = false
        }
        return consumed
    }
    
    private func changeBearing(mapView: MAMapView, data: Any?) {
        //    require(data is Double)
        //    map.moveCamera(CameraUpdateFactory.changeBearing(data.toFloat()))
        //    return ReplyToFlutter.Success()
    }
    
    private func changeLatLng(mapView: MAMapView, data: Any?) {
        //    require(data is JSONObject)
        //    val latLngData: LatLngData? = data.toString().parseObject()
        //    require(latLngData != null)
        //    map.moveCamera(CameraUpdateFactory.changeLatLng(latLngData.toLatLng()))
        //    return ReplyToFlutter.Success()
    }
    
    private func changeTilt(mapView: MAMapView, data: Any?) {
        //    require(data is Double)
        //    map.moveCamera(CameraUpdateFactory.changeTilt(data.toFloat()))
        //    return ReplyToFlutter.Success()
    }
    
    private func zoomIn(mapView: MAMapView) {
        let zoom = mapView.zoomLevel + 1
        if zoom <= mapView.maxZoomLevel {
            mapView.setZoomLevel(zoom , animated:  true)
        }
    }
    
    private func zoomOut(mapView: MAMapView) {
        let zoom = mapView.zoomLevel - 1
        if (zoom <= mapView.minZoomLevel) {
            mapView.setZoomLevel(zoom, animated: true)
        }
    }
    
    private func zoomTo(mapView: MAMapView, data: Any?) {
        //    require(data is Double)
        //    map.moveCamera(CameraUpdateFactory.zoomTo(data.toFloat()))
        //    return ReplyToFlutter.Success()
    }
    
    private func newCameraPosition(mapView: MAMapView, data: Any?) {
        //    require(data is JSONObject)
        //    val cameraPositionData: CameraPositionData? = data.toString().parseObject()
        //    require(cameraPositionData != null)
        //    map.moveCamera(CameraUpdateFactory.newCameraPosition(cameraPositionData.toCameraPosition()))
        //    return ReplyToFlutter.Success()
    }
    
    private func newLatLng(mapView: MAMapView, data: Any?) {
        //    require(data is JSONObject)
        //    val latLngData: LatLngData? = data.toString().parseObject()
        //    require(latLngData != null)
        //    map.moveCamera(CameraUpdateFactory.newLatLng(latLngData.toLatLng()))
        //    return ReplyToFlutter.Success()
    }
    
    private func newLatLngBounds(mapView: MAMapView, data: Any?) {
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
    }
    
    private func newLatLngBoundsRect(mapView: MAMapView, data: Any?) {
        //    require(data is JSONObject)
        //    val bounds: LatLngBoundsData? = data.opt("latLngBounds")?.toString()?.parseObject()
        //    val paddingLeft = data.optInt("paddingLeft")
        //    val paddingRight = data.optInt("paddingRight")
        //    val paddingTop = data.optInt("paddingTop")
        //    val paddingBottom = data.optInt("paddingBottom")
        //    require(bounds != null)
        //    map.moveCamera(CameraUpdateFactory.newLatLngBoundsRect(bounds.toLatLngBounds(), paddingLeft, paddingRight, paddingTop, paddingBottom))
        //    return ReplyToFlutter.Success()
    }
    
    private func newLatLngZoom(mapView: MAMapView, data: Any?) {
        //    require(data is JSONObject)
        //    val latLng: LatLngData? = data.opt("latLng")?.toString()?.parseObject()
        //    val zoom = data.optDouble("zoom")
        //    require(latLng != null && !zoom.isNaN())
        //    map.moveCamera(CameraUpdateFactory.newLatLngZoom(latLng.toLatLng(), zoom.toFloat()))
        //    return ReplyToFlutter.Success()
    }
    
    private func scrollBy(mapView: MAMapView, data: Any?) {
        //    require(data is JSONObject)
        //    val xPixel = data.optDouble("xPixel")
        //    val yPixel = data.optDouble("yPixel")
        //    require(!xPixel.isNaN() && !yPixel.isNaN())
        //    map.moveCamera(CameraUpdateFactory.scrollBy(xPixel.toFloat(), yPixel.toFloat()))
        //    return ReplyToFlutter.Success()
    }
    
    private func zoomBy(mapView: MAMapView, data: Any?) {
        //    require(data is JSONObject)
        //    val amount = data.optDouble("amount")
        //    val focus = data.opt("focus")?.toString()?.parseObject<ScreenPoint>()
        //    require(focus != null)
        //    map.moveCamera(CameraUpdateFactory.zoomBy(amount.toFloat(), focus.toPoint()))
        //    return ReplyToFlutter.Success()
    }
}
