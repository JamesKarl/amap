package com.jameskarl.amap.map.apis

import com.amap.api.maps.AMap
import com.amap.api.maps.model.LatLng
import com.amap.api.maps.model.MarkerOptions
import com.jameskarl.amap.map.ReplyToFlutter
import org.json.JSONObject

class MarkerApi {
    fun addMarker(map: AMap, data: Any?): ReplyToFlutter {
        require(data is JSONObject)
        return try {
            val pos = data.getJSONObject("at")
            val markerData = data.getJSONObject("marker")
            val marker = MarkerOptions()
                    .position(LatLng(pos.getDouble("latitude"), pos.getDouble("longitude")))
                    .title(markerData.getString("title"))
                    .snippet(markerData.getString("snippet"))
            map.addMarker(marker)
            ReplyToFlutter.Success()
        } catch (e: Throwable) {
            ReplyToFlutter.Failed(message = e.localizedMessage)
        }
    }
}