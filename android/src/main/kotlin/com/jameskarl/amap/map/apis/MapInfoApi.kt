package com.jameskarl.amap.map.apis

import com.amap.api.maps.AMap
import com.jameskarl.amap.map.ReplyToFlutter

class MapInfoApi {
    fun getCenterPoint(map: AMap): ReplyToFlutter {
        val target = map.cameraPosition.target
        return ReplyToFlutter.Success(data = mapOf(
                "longitude" to target.longitude,
                "latitude" to target.latitude
        ))
    }

}