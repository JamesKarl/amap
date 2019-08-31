package com.jameskarl.amap.map.apis

import com.amap.api.maps.AMap
import com.jameskarl.amap.map.ReplyToFlutter
import org.json.JSONObject

class MapInfoApi {
    fun getCenterPoint(map: AMap): ReplyToFlutter {
        val target = map.cameraPosition.target
        return ReplyToFlutter.Success(data = mapOf(
                "longitude" to target.longitude,
                "latitude" to target.latitude
        ))
    }

    fun setZoomControlsEnabled(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.uiSettings.isZoomControlsEnabled = data
        return ReplyToFlutter.Success()
    }

    fun setCompassEnabled(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.uiSettings.isCompassEnabled = data
        return ReplyToFlutter.Success()
    }

    fun setMyLocationButtonEnabled(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.uiSettings.isMyLocationButtonEnabled = data
        return ReplyToFlutter.Success()
    }

    fun setMyLocationEnabled(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.isMyLocationEnabled = data
        return ReplyToFlutter.Success()
    }

    fun setScaleControlsEnabled(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.uiSettings.isScaleControlsEnabled = data
        return ReplyToFlutter.Success()
    }

    fun setLogoPosition(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Int)
        map.uiSettings.logoPosition = data
        return ReplyToFlutter.Success()
    }

    fun setZoomGesturesEnabled(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.uiSettings.isZoomGesturesEnabled = data
        return ReplyToFlutter.Success()
    }

    fun setScrollGesturesEnabled(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.uiSettings.isScrollGesturesEnabled = data
        return ReplyToFlutter.Success()
    }

    fun setRotateGesturesEnabled(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.uiSettings.isRotateGesturesEnabled = data
        return ReplyToFlutter.Success()
    }

    fun setTiltGesturesEnabled(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.uiSettings.isTiltGesturesEnabled = data
        return ReplyToFlutter.Success()
    }

    fun setPointToCenter(map: AMap, data: Any?): ReplyToFlutter {
        require(data is JSONObject)
        map.setPointToCenter(data["x"] as Int, data["y"] as Int)
        return ReplyToFlutter.Success()
    }

    fun setGestureScaleByMapCenter(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.uiSettings.isGestureScaleByMapCenter = data
        return ReplyToFlutter.Success()
    }
}