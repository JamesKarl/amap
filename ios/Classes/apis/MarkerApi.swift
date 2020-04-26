//
//  MarkerApi.swift
//  amap
//
//  Created by James Karl on 2019/9/12.
//

import Foundation
import MAMapKit

class MarkerApi : FlutterApi {
    
    func handle(mapView: MAMapView, methodId: String, data: Any?) -> ReplyToFlutter? {
        var result: ReplyToFlutter? = nil
        switch methodId {
        case "addMarker":
            result = addMarker(mapView: mapView, data: data)
        case "addMarkers":
            result = addMarkers(mapView: mapView, data: data)
        case "addCircle":
            result = addCircle(mapView: mapView, data: data)
        case "addPolyline":
            result = addPolyline(mapView: mapView, data: data)
        case  "addPolygon":
            result = addPolygon(data: data)
        case "clear":
            result = clear(mapView: mapView)
        default:
            result = nil
        }
        return result
    }
    
    
    private func addCircle(mapView: MAMapView, data: Any?) ->  ReplyToFlutter {
        //        require(data is JSONObject)
        //        val options: CircleOptionsData? = data.toString().parseObject()
        //        if (options != null) {
        //            map.addCircle(options.toCircleOptions())
        //            return ReplyToFlutter.Success()
        //        } else {
        //            throw IllegalAccessException()
        //        }
        return ReplyToFlutter.notImplemented()
    }
    
    private func addPolyline(mapView: MAMapView, data: Any?) ->  ReplyToFlutter {
        if let jsonData = data as? [String: Any?] {
            if let polylineOptionData = PolylineOptionsData(json: jsonData) {
                if let polyline = polylineOptionData.getPolyline() {
                    mapView.addOverlays([polyline])
                }
                
            }
        }
        return ReplyToFlutter.notImplemented()
    }
    
    private func addPolygon(data: Any?) ->  ReplyToFlutter {
        //        return ReplyToFlutter.Failed(message = "TODO")
        return ReplyToFlutter.notImplemented()
    }
    
    private func clear(mapView: MAMapView) ->  ReplyToFlutter {
        //        mapView.clea
        return ReplyToFlutter.success()
    }
    
    private func addMarker(mapView: MAMapView, data: Any?) ->  ReplyToFlutter {
        //        require(data is JSONObject)
        //        return try {
        //        val markerOptionData: MarkerOptionData? = data.toString().parseObject()
        //        if (markerOptionData == null) {
        //        ReplyToFlutter.Failed(message = "parse data failed. $data")
        //        } else {
        //        setInfoWindowAdapter(map)
        //        val markerOptions = markerOptionData.toMarkerOptions()
        //        attachMarkerIcon(markerOptionData, markerOptions)
        //        map.addMarker(markerOptions).let { marker ->
        //        markerOptionData.extra?.let { extra ->
        //        Log.d("MAP", "extra runtime type: ${extra::class.java.simpleName}")
        //        marker.setObject(extra)
        //        }
        //        }
        //        ReplyToFlutter.Success()
        //        }
        //        } catch (e: Throwable) {
        //        ReplyToFlutter.Failed(message = e.localizedMessage)
        //        }
        if let markerData = data as? [String: Any?] {
            if let marker = MAPointAnnotation(json: markerData) {
                mapView.addAnnotation(marker)
                return ReplyToFlutter.success()
            }
        }
        return ReplyToFlutter.notImplemented()
    }
    
    private func addMarkers(mapView: MAMapView, data: Any?) ->  ReplyToFlutter {
        //        require(data is JSONArray && data.length() > 0)
        //        return try {
        //        setInfoWindowAdapter(map)
        //        (0 until data.length()).mapNotNull {
        //        val markerOptionData: MarkerOptionData? = data[it].toString().parseObject()
        //        markerOptionData
        //        }.map { markerOptionData ->
        //        val markerOptions = markerOptionData.toMarkerOptions()
        //        attachMarkerIcon(markerOptionData, markerOptions)
        //        markerOptions to markerOptionData
        //        }.let { markerOptionList ->
        //        map.addMarkers(ArrayList(markerOptionList.map { it.first }), true).let { markerList ->
        //        markerList.zip(markerOptionList.map { it.second }).forEach {
        //        it.second.extra?.let { extra ->
        //        Log.d("MAP", "extra runtime type: ${extra::class.java.simpleName}")
        //        it.first.setObject(extra)
        //        }
        //        }
        //        }
        //        }
        //        ReplyToFlutter.Success()
        //        } catch (e: Throwable) {
        //        ReplyToFlutter.Failed(message = e.localizedMessage)
        //        }
        return ReplyToFlutter.notImplemented()
    }
    
    private func setInfoWindowAdapter(mapView: MAMapView) -> ReplyToFlutter {
        //        PlatformMapView.infoWindowAdapter?.let {
        //            map.setInfoWindowAdapter(it)
        //        }
        return ReplyToFlutter.notImplemented()
    }
    
//    private func attachMarkerIcon(markerOptionData: MarkerOptionData, markerOptions: MarkerOptions) {
        //        markerOptionData.icon?.let { icon ->
        //            val cachedBitmapDescriptor = cache.get(icon)
        //            if (cachedBitmapDescriptor != null) {
        //                markerOptions.icon(cachedBitmapDescriptor)
        //            } else {
        //                PlatformMapView.getFlutterAsset(icon)?.let { fd ->
        //                    val bitmap = BitmapFactory.decodeStream(fd.createInputStream())
        //                    val bitmapDescriptor = BitmapDescriptorFactory.fromBitmap(bitmap)
        //                    cache.put(icon, bitmapDescriptor)
        //                    Log.d("MAP", "create new marker icon identified by $icon")
        //                    markerOptions.icon(bitmapDescriptor)
        //                }
        //            }
        //        }
        //
        //        val activity = PlatformMapView.getActivity()
        //        val markerIconFactory = PlatformMapView.markerIconFactory
        //        if (markerOptionData.icon == null && activity != null && markerIconFactory != null) {
        //            markerIconFactory.createMarkerIcon(activity, markerOptionData)?.let { view ->
        //                val bitmap = convertViewToBitmap(view)
        //                Log.d("MAP", "create bitmap from view $bitmap")
        //                val bitmapDescriptor = BitmapDescriptorFactory.fromBitmap(bitmap)
        //                markerOptions.icon(bitmapDescriptor)
        //            }
        //        }
        
//    }
    
    //    private func convertViewToBitmap(view: View) ->  Bitmap {
    //        view.measure(ActionBar.LayoutParams.WRAP_CONTENT, ActionBar.LayoutParams.WRAP_CONTENT)
    //        val width = view.measuredWidth
    //        val height = view.measuredHeight
    //        val bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
    //        val canvas = Canvas(bitmap)
    //        view.layout(0, 0, width, height)
    //        view.draw(canvas)
    //        return bitmap
    //    }
}
