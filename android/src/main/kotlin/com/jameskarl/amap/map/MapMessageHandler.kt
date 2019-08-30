package com.jameskarl.amap.map

import android.util.Log
import com.amap.api.maps.TextureMapView
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
            sendJsonMessageToFlutter(ChannelMessageData(MapMethods.onMarkerClicked, it.toMarkerData()))
            true
        }
        mapView.map.setOnMapClickListener {
            sendJsonMessageToFlutter(ChannelMessageData(MapMethods.onMapClicked, it))
        }
        mapView.map.setOnMapLoadedListener {
            sendJsonMessageToFlutter(ChannelMessageData(MapMethods.onMapLoaded))
        }
        Log.d("MAP", mapMethodChannelName)
    }

    private fun sendJsonMessageToFlutter(message: ChannelMessageData) {
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
                    MapMethods.handleMessage(mapView.map, methodId, data, reply)
                } else {
                    Log.e("MAP", "method id is absent.")
                    MapMethods.commonReply(methodId?.toString()
                            ?: "???", false, "method id is absent", reply)
                }
            } catch (e: Throwable) {
                e.printStackTrace()
                MapMethods.commonReply("???", false, e.localizedMessage, reply)
            }
        }
    }

}