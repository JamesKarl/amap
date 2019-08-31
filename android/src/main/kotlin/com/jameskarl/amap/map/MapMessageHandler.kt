package com.jameskarl.amap.map

import android.util.Log
import com.amap.api.maps.AMap
import com.amap.api.maps.TextureMapView
import com.amap.api.maps.model.Marker
import com.jameskarl.amap.AmapPlugin
import com.jameskarl.amap.map.bean.toMarkerOptionData
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

        with(mapView.map) {
            setOnMarkerClickListener {
                it.showInfoWindow()
                sendJsonMessageToFlutter(ReplyToFlutter.Success(MapMethods.onMarkerClicked, it.toMarkerOptionData()))
                true
            }

            setOnMapClickListener {
                sendJsonMessageToFlutter(ReplyToFlutter.Success(MapMethods.onMapClicked, it))
            }

            setOnMapLoadedListener {
                Log.d("MAP", "onMapLoaded")
                sendJsonMessageToFlutter(ReplyToFlutter.Success(MapMethods.onMapLoaded))
            }

            setOnMarkerDragListener(object : AMap.OnMarkerDragListener {
                override fun onMarkerDragEnd(marker: Marker?) {
                    marker?.let {
                        sendJsonMessageToFlutter(ReplyToFlutter.Success(MapMethods.onMarkerDragEnd, it.toMarkerOptionData()))
                    }
                }

                override fun onMarkerDragStart(marker: Marker?) {
                    marker?.let {
                        //sendJsonMessageToFlutter(ReplyToFlutter.Success(MapMethods.onMarkerDragStart, it.toMarkerOptionData()))
                    }
                }

                override fun onMarkerDrag(marker: Marker?) {
                    marker?.let {
                        //sendJsonMessageToFlutter(ReplyToFlutter.Success(MapMethods.onMarkerDragged, it.toMarkerOptionData()))
                    }
                }

            })

            setOnInfoWindowClickListener { marker ->
                marker?.let {
                    sendJsonMessageToFlutter(ReplyToFlutter.Success(MapMethods.onInfoWindowClicked, it.toMarkerOptionData()))
                }
            }
        }

        Log.d("MAP", mapMethodChannelName)
    }

    private fun sendJsonMessageToFlutter(message: ReplyToFlutter) {
        val msg = message.toJson()
        Log.d("MAP", "sendJsonMessageToFlutter $message")
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
                    MapMethods.handleException(methodId?.toString()
                            ?: "???", "method id is absent", reply)
                }
            } catch (e: Throwable) {
                e.printStackTrace()
                MapMethods.handleException("???", e.localizedMessage, reply)
            }
        }
    }

}