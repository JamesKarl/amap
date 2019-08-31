package com.jameskarl.amap.map.apis

import android.graphics.BitmapFactory
import com.amap.api.maps.AMap
import com.amap.api.maps.model.BitmapDescriptorFactory
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

                val markerOptions = markerOptionData.toMarkerOptions()
                markerOptionData.icon?.let { icon ->
                    PlatformMapView.getFlutterAsset(icon)?.let { fd ->
                        val bitmap = BitmapFactory.decodeStream(fd.createInputStream())
                        markerOptions.icon(BitmapDescriptorFactory.fromBitmap(bitmap))
                    }
                }
                map.addMarker(markerOptions)
                ReplyToFlutter.Success()
            }
        } catch (e: Throwable) {
            ReplyToFlutter.Failed(message = e.localizedMessage)
        }
    }
}