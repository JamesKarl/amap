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
    const val onMarkerClicked = "onMarkerClicked"

    private const val addMarker = "addMarker"
    private const val getCenter = "getCenter"


    fun handleMessage(map: AMap, methodId: String, data: Any?, reply: BasicMessageChannel.Reply<String>) {

        when (methodId) {
            MapMethods.getCenter -> MapMethods.getCenterPoint(map, reply)
            MapMethods.addMarker -> {
                if (data is JSONObject)
                    MapMethods.addMarker(map, data, reply)
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
                "id" to MapMethods.getCenter,
                "data" to mapOf(
                        "longitude" to target.longitude,
                        "latitude" to target.latitude
                )
        )
        reply.reply(data.toJson())
    }
}