package com.jameskarl.amap.map

import android.util.Log
import com.amap.api.maps.AMap
import com.jameskarl.amap.map.apis.CameraApi
import com.jameskarl.amap.map.apis.FlutterApi
import com.jameskarl.amap.map.apis.MapInfoApi
import com.jameskarl.amap.map.apis.MarkerApi
import io.flutter.plugin.common.BasicMessageChannel

object MapMethods {
    const val onMapLoaded = "onMapLoaded"
    const val onMapClicked = "onMapClicked"

    const val onMarkerClicked = "onMarkerClicked"
    const val onMarkerDragged = "onMarkerDragged"
    const val onMarkerDragStart = "onMarkerDragStart"
    const val onMarkerDragEnd = "onMarkerDragEnd"
    const val onInfoWindowClicked = "onInfoWindowClicked"

    private val flutterApis: List<FlutterApi> = listOf(MarkerApi(), MapInfoApi(), CameraApi())

    fun handleMessage(map: AMap, methodId: String, data: Any?, reply: BasicMessageChannel.Reply<String>) {
        Log.d("MAP", "handleMessage $methodId -> $data")
        try {
            flutterApis.forEach { api ->
                val replyMessage = api.handle(methodId, map, data)
                if (replyMessage != null) {
                    replyMessage.id = methodId
                    notifyFlutter(reply, replyMessage)
                    return
                }
            }
            notifyFlutter(reply, ReplyToFlutter.Failed(methodId, "NOT IMPLEMENTED"))
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