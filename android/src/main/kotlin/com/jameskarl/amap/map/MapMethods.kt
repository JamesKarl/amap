package com.jameskarl.amap.map

import com.amap.api.maps.AMap
import com.amap.api.maps.model.LatLng
import com.amap.api.maps.model.MarkerOptions
import com.jameskarl.shop.toJson
import io.flutter.plugin.common.BasicMessageChannel
import org.json.JSONObject

object MapMethods {
    const val onMapLoaded = "onMapLoaded"
    const val onMapClicked = "onMapClicked"

    ///控件交互
    private const val setZoomControlsEnabled = "setZoomControlsEnabled"
    private const val setCompassEnabled = "setCompassEnabled"
    private const val setMyLocationButtonEnabled = "setMyLocationButtonEnabled"
    private const val setMyLocationEnabled = "setMyLocationEnabled"
    private const val setScaleControlsEnabled = "setScaleControlsEnabled"
    private const val setLogoPosition = "setLogoPosition"

    ///手势交互
    private const val setZoomGesturesEnabled = "setZoomGesturesEnabled"
    private const val setScrollGesturesEnabled = "setScrollGesturesEnabled"
    private const val setRotateGesturesEnabled = "setRotateGesturesEnabled"
    private const val setTiltGesturesEnabled = "setTiltGesturesEnabled"
    private const val setPointToCenter = "setPointToCenter"
    private const val setGestureScaleByMapCenter = "setGestureScaleByMapCenter"

    ///调用方法交互
    private const val animateCamera = "animateCamera"
    private const val moveCamera = "moveCamera"

    ///地图截屏功能
    private const val getMapScreenShot = "getMapScreenShot"

    ///绘制点标记
    private const val addMarker = "addMarker"
    private const val onMarkerClicked = "onMarkerClicked"
    private const val onMarkerDragged = "onMarkerDragged"
    private const val onMarkerDragStart = "onMarkerDragStart"
    private const val onMarkerDragEnd = "onMarkerDragEnd"
    private const val onInfoWindowClicked = "onInfoWindowClicked"

    ///绘制几何图形
    private const val addPolyline = "addPolyline"
    private const val addCircle = "addCircle"
    private const val addPolygon = "addPolygon"

    private const val getCenter = "getCenter"


    fun handleMessage(map: AMap, methodId: String, data: Any?, reply: BasicMessageChannel.Reply<String>) {

        when (methodId) {
            getCenter -> getCenterPoint(map, reply)
            addMarker -> {
                if (data is JSONObject)
                    addMarker(map, data, reply)
                else
                    commonReply(methodId, false, "参数错误", reply)
            }
        }
    }

    fun commonReply(methodId: String, success: Boolean, message: String?, reply: BasicMessageChannel.Reply<String>) {
        val data = mapOf(
                "id" to methodId,
                "success" to success,
                "message" to (message ?: "")
        )
        reply.reply(data.toJson())
    }


    private fun addMarker(map: AMap, data: JSONObject, reply: BasicMessageChannel.Reply<String>) {
        try {
            val pos = data.getJSONObject("at")
            val markerData = data.getJSONObject("marker")
            val marker = MarkerOptions()
                    .position(LatLng(pos.getDouble("latitude"), pos.getDouble("longitude")))
                    .title(markerData.getString("title"))
                    .snippet(markerData.getString("snippet"))
            map.addMarker(marker)
        } catch (e: Throwable) {
            e.printStackTrace()
        }
    }


    private fun getCenterPoint(map: AMap, reply: BasicMessageChannel.Reply<String>) {
        val target = map.cameraPosition.target
        val data = mapOf(
                "id" to getCenter,
                "data" to mapOf(
                        "longitude" to target.longitude,
                        "latitude" to target.latitude
                )
        )
        reply.reply(data.toJson())
    }
}