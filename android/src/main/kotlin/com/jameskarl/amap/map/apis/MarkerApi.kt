package com.jameskarl.amap.map.apis

import com.amap.api.maps.AMap
import com.jameskarl.amap.map.PlatformMapView
import com.jameskarl.amap.map.ReplyToFlutter
import com.jameskarl.amap.map.bean.MarkerOptionData
import com.jameskarl.amap.map.parseObject
import org.json.JSONObject

class MarkerApi {
    fun addMarker(map: AMap, data: Any?): ReplyToFlutter {
        require(data is JSONObject)
        return try {
            val markerOptionData: MarkerOptionData? = data.toString().parseObject()
            if (markerOptionData == null) {
                ReplyToFlutter.Failed(message = "parse data failed. $data")
            } else {
                PlatformMapView.infoWindowAdapter?.let {
                    map.setInfoWindowAdapter(it)
                }
                map.addMarker(markerOptionData.toMarkerOptions())
                ReplyToFlutter.Success()
            }
        } catch (e: Throwable) {
            ReplyToFlutter.Failed(message = e.localizedMessage)
        }
    }
}