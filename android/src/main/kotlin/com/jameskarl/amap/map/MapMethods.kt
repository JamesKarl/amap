package com.jameskarl.amap.map

import android.util.Log
import com.amap.api.maps.AMap
import com.jameskarl.amap.map.apis.MapInfoApi
import com.jameskarl.amap.map.apis.MarkerApi
import io.flutter.plugin.common.BasicMessageChannel

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
    private const val addMarkers = "addMarkers"
    const val onMarkerClicked = "onMarkerClicked"
    const val onMarkerDragged = "onMarkerDragged"
    const val onMarkerDragStart = "onMarkerDragStart"
    const val onMarkerDragEnd = "onMarkerDragEnd"
    const val onInfoWindowClicked = "onInfoWindowClicked"

    ///绘制几何图形
    private const val addPolyline = "addPolyline"
    private const val addCircle = "addCircle"
    private const val addPolygon = "addPolygon"

    private const val getCenter = "getCenter"

    private const val clear = "clear"

    private val mapInfoApi = MapInfoApi()
    private val markerApi = MarkerApi()

    fun handleMessage(map: AMap, methodId: String, data: Any?, reply: BasicMessageChannel.Reply<String>) {
        Log.d("MAP", "handleMessage $methodId -> $data")
        try {
            val replyMessage: ReplyToFlutter = when (methodId) {
                setZoomControlsEnabled -> mapInfoApi.setZoomControlsEnabled(map, data)
                setCompassEnabled -> mapInfoApi.setCompassEnabled(map, data)
                setMyLocationButtonEnabled -> mapInfoApi.setMyLocationButtonEnabled(map, data)
                setMyLocationEnabled -> mapInfoApi.setMyLocationEnabled(map, data)
                setScaleControlsEnabled -> mapInfoApi.setScaleControlsEnabled(map, data)
                setLogoPosition -> mapInfoApi.setLogoPosition(map, data)

                setZoomGesturesEnabled -> mapInfoApi.setZoomGesturesEnabled(map, data)
                setScrollGesturesEnabled -> mapInfoApi.setScrollGesturesEnabled(map, data)
                setRotateGesturesEnabled -> mapInfoApi.setRotateGesturesEnabled(map, data)
                setTiltGesturesEnabled -> mapInfoApi.setTiltGesturesEnabled(map, data)
                setPointToCenter -> mapInfoApi.setPointToCenter(map, data)
                setGestureScaleByMapCenter -> mapInfoApi.setGestureScaleByMapCenter(map, data)

                getCenter -> mapInfoApi.getCenterPoint(map)
                addMarker -> markerApi.addMarker(map, data)
                addMarkers -> markerApi.addMarkers(map, data)

                addCircle -> markerApi.addCircle(map, data)
                addPolyline -> markerApi.addPolyline(map, data)
                addPolygon -> markerApi.addPolygon(map, data)
                clear -> markerApi.clear(map, data);

                else -> ReplyToFlutter.Failed(methodId, "NOT IMPLEMENTED")
            }
            replyMessage.id = methodId;
            notifyFlutter(reply, replyMessage)
        } catch (e: IllegalArgumentException) {
            notifyFlutter(reply, ReplyToFlutter.Failed(methodId, e.message ?: "Invalid arguments"))
        } catch (t: Throwable) {
            t.printStackTrace()
            notifyFlutter(reply, ReplyToFlutter.Failed(methodId, message = t.localizedMessage
                    ?: "UNKNOWN ERROR"))
        }
    }

    fun handleException(methodId: String, message: String?, reply: BasicMessageChannel.Reply<String>) {
        Log.d("MAP", "handleException $message -> $message")
        notifyFlutter(reply, ReplyToFlutter.Failed(methodId, message ?: "UNKNOWN EXCEPTION"))
    }

    private fun notifyFlutter(reply: BasicMessageChannel.Reply<String>, message: ReplyToFlutter) {
        try {
            reply.reply(message.toJson())
        } catch (e: Throwable) {
            reply.reply(ReplyToFlutter.Failed(id = message.id, message = e.localizedMessage).toJson())
        }
    }
}