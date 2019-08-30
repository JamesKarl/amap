package com.jameskarl.amap.map

import android.util.Log
import com.amap.api.maps.TextureMapView
import com.amap.api.maps.model.LatLng
import com.amap.api.maps.model.MarkerOptions
import com.jameskarl.amap.AmapPlugin
import com.jameskarl.amap.map.bean.ChannelMessageData
import com.jameskarl.amap.map.bean.toMarkerData
import com.jameskarl.shop.toJson
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.StringCodec
import org.json.JSONObject

class MapMessageHandler(
        private val registrar: PluginRegistry.Registrar,
        private val mapView: TextureMapView,
        viewId: Int
) : BasicMessageChannel.MessageHandler<String> {

    private val mapMethodChannelName = "${AmapPlugin.mapViewType}/map$viewId"

    private val messageChannel: BasicMessageChannel<String> = BasicMessageChannel<String>(registrar.messenger(), mapMethodChannelName, StringCodec.INSTANCE)

    fun setup() {
        messageChannel.setMessageHandler(this)
        mapView.map.setOnMarkerClickListener {
            it.showInfoWindow()
            sendMessageToFlutter(ChannelMessageData(MapMethods.onMarkerClicked, it.toMarkerData()))
            true
        }
        mapView.map.setOnMapClickListener {
            sendMessageToFlutter(ChannelMessageData(MapMethods.onMapClicked, it))
        }
        mapView.map.setOnMapLoadedListener {
            sendMessageToFlutter(ChannelMessageData(MapMethods.onMapLoaded))
        }
        Log.d("MAP", mapMethodChannelName)
    }

    private fun sendMessageToFlutter(message: ChannelMessageData) {
        val msg = message.toJson()
        Log.d("MAP", msg)
        messageChannel.send(msg)
    }

    override fun onMessage(message: String?, reply: BasicMessageChannel.Reply<String>) {
        if (message != null) {
            try {
                val json = JSONObject(message)
                val methodId = json["id"]
                val data = json.opt("data")
                if (methodId is String && methodId.isNotBlank()) {
                    handle(methodId, data, reply)
                } else {
                    Log.e("MAP", "method id is absent.")
                    commonReply(methodId?.toString() ?: "???", false, "method id is absent", reply)
                }
            } catch (e: Throwable) {
                e.printStackTrace()
                commonReply("???", false, e.localizedMessage, reply)
            }
        }
    }

    private fun handle(methodId: String, data: Any?, reply: BasicMessageChannel.Reply<String>) {

        when (methodId) {
            MapMethods.getCenter -> getCenterPoint(reply)
            MapMethods.addMarker -> {
                if (data is JSONObject)
                    addMarker(data, reply)
                else
                    commonReply(methodId, false, "参数错误", reply)
            }
        }
    }

    private fun addMarker(data: JSONObject, reply: BasicMessageChannel.Reply<String>) {
        try {
            val pos = data.getJSONObject("at")
            val markerData = data.getJSONObject("marker")
            val marker = MarkerOptions()
                    .position(LatLng(pos.getDouble("latitude"), pos.getDouble("longitude")))
                    .title(markerData.getString("title"))
                    .snippet(markerData.getString("snippet"))
            mapView.map.addMarker(marker)
        } catch (e: Throwable) {
            e.printStackTrace()
        }
    }

    private fun getCenterPoint(reply: BasicMessageChannel.Reply<String>) {
        val target = mapView.map.cameraPosition.target
        val data = mapOf(
                "id" to MapMethods.getCenter,
                "data" to mapOf(
                        "longitude" to target.longitude,
                        "latitude" to target.latitude
                )
        )
        reply.reply(data.toJson())
    }

    private fun commonReply(methodId: String, success: Boolean, message: String?, reply: BasicMessageChannel.Reply<String>) {
        val data = mapOf(
                "id" to methodId,
                "success" to success,
                "message" to (message ?: "")
        )
        reply.reply(data.toJson())
    }
}