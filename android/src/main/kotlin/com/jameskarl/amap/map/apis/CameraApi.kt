package com.jameskarl.amap.map.apis

import com.amap.api.maps.AMap
import com.amap.api.maps.CameraUpdateFactory
import com.jameskarl.amap.map.ReplyToFlutter
import com.jameskarl.amap.map.bean.LatLngData
import com.jameskarl.amap.map.parseObject
import org.json.JSONObject

class CameraApi : FlutterApi {
    override fun handle(methodId: String, map: AMap, data: Any?): ReplyToFlutter? {
        return when (methodId) {
            "changeBearing" -> changeBearing(map, data)
            "changeLatLng" -> changeLatLng(map, data)
            "changeTilt" -> changeTilt(map, data)
            "zoomIn" -> zoomIn(map)
            "zoomOut" -> zoomOut(map)
            "zoomTo" -> zoomTo(map, data)
            else -> null
        }
    }

    private fun changeBearing(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Double)
        map.moveCamera(CameraUpdateFactory.changeBearing(data.toFloat()))
        return ReplyToFlutter.Success()
    }

    private fun changeLatLng(map: AMap, data: Any?): ReplyToFlutter {
        require(data is JSONObject)
        val latLngData: LatLngData? = data.toString().parseObject()
        require(latLngData != null)
        map.moveCamera(CameraUpdateFactory.changeLatLng(latLngData.toLatLng()))
        return ReplyToFlutter.Success()
    }

    private fun changeTilt(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Double)
        map.moveCamera(CameraUpdateFactory.changeTilt(data.toFloat()))
        return ReplyToFlutter.Success()
    }

    private fun zoomIn(map: AMap): ReplyToFlutter {
        map.moveCamera(CameraUpdateFactory.zoomIn())
        return ReplyToFlutter.Success()
    }

    private fun zoomOut(map: AMap): ReplyToFlutter {
        map.moveCamera(CameraUpdateFactory.zoomOut())
        return ReplyToFlutter.Success()
    }

    private fun zoomTo(map: AMap, data: Any?): ReplyToFlutter {
        require(data is Double)
        map.moveCamera(CameraUpdateFactory.changeBearing(data.toFloat()))
        return ReplyToFlutter.Success()
    }

}