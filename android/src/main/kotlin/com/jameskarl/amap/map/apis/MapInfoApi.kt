package com.jameskarl.amap.map.apis

import com.amap.api.maps.AMap
import com.jameskarl.amap.map.ReplyToFlutter
import org.json.JSONObject

class MapInfoApi : FlutterApi {
    override fun handle(methodId: String, map: AMap, data: Any?): ReplyToFlutter? {
        return when (methodId) {
            "setZoomControlsEnabled" -> setZoomControlsEnabled(map, data)
            "setCompassEnabled" -> setCompassEnabled(map, data)
            "setMyLocationButtonEnabled" -> setMyLocationButtonEnabled(map, data)
            "setMyLocationEnabled" -> setMyLocationEnabled(map, data)
            "setScaleControlsEnabled" -> setScaleControlsEnabled(map, data)
            "setLogoPosition" -> setLogoPosition(map, data)
            "setZoomGesturesEnabled" -> setZoomGesturesEnabled(map, data)
            "setScrollGesturesEnabled" -> setScrollGesturesEnabled(map, data)
            "setRotateGesturesEnabled" -> setRotateGesturesEnabled(map, data)
            "setTiltGesturesEnabled" -> setTiltGesturesEnabled(map, data)
            "setPointToCenter" -> setPointToCenter(map, data)
            "setGestureScaleByMapCenter" -> setGestureScaleByMapCenter(map, data)
            "getCenter" -> getCenter(map)
            else -> null
        }
    }

    private fun getCenter(map: AMap): ReplyToFlutter {
        val target = map.cameraPosition.target
        return ReplyToFlutter.Success(data = mapOf(
                "longitude" to target.longitude,
                "latitude" to target.latitude
        ))
    }

    private fun setZoomControlsEnabled(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.uiSettings.isZoomControlsEnabled = data
        return ReplyToFlutter.Success()
    }

    private fun setCompassEnabled(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.uiSettings.isCompassEnabled = data
        return ReplyToFlutter.Success()
    }

    private fun setMyLocationButtonEnabled(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.uiSettings.isMyLocationButtonEnabled = data
        return ReplyToFlutter.Success()
    }

    private fun setMyLocationEnabled(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.isMyLocationEnabled = data
        return ReplyToFlutter.Success()
    }

    private fun setScaleControlsEnabled(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.uiSettings.isScaleControlsEnabled = data
        return ReplyToFlutter.Success()
    }

    private fun setLogoPosition(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Int)
        map.uiSettings.logoPosition = data
        return ReplyToFlutter.Success()
    }

    private fun setZoomGesturesEnabled(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.uiSettings.isZoomGesturesEnabled = data
        return ReplyToFlutter.Success()
    }

    private fun setScrollGesturesEnabled(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.uiSettings.isScrollGesturesEnabled = data
        return ReplyToFlutter.Success()
    }

    private fun setRotateGesturesEnabled(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.uiSettings.isRotateGesturesEnabled = data
        return ReplyToFlutter.Success()
    }

    private fun setTiltGesturesEnabled(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.uiSettings.isTiltGesturesEnabled = data
        return ReplyToFlutter.Success()
    }

    private fun setPointToCenter(map: AMap, data: Any?): ReplyToFlutter {
        require(data is JSONObject)
        map.setPointToCenter(data["x"] as Int, data["y"] as Int)
        return ReplyToFlutter.Success()
    }

    private fun setGestureScaleByMapCenter(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Boolean)
        map.uiSettings.isGestureScaleByMapCenter = data
        return ReplyToFlutter.Success()
    }
}