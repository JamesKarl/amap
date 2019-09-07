package com.jameskarl.amap.map.apis

import com.amap.api.maps.AMap
import com.amap.api.maps.CameraUpdateFactory
import com.jameskarl.amap.map.ReplyToFlutter
import com.jameskarl.amap.map.bean.CameraPositionData
import com.jameskarl.amap.map.bean.LatLngBoundsData
import com.jameskarl.amap.map.bean.LatLngData
import com.jameskarl.amap.map.bean.ScreenPoint
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
            "newLatLng" -> newLatLng(map, data)
            "newLatLngZoom" -> newLatLngZoom(map, data)
            "scrollBy" -> scrollBy(map, data)
            "newCameraPosition" -> newCameraPosition(map, data)
            "newLatLngBounds" -> newLatLngBounds(map, data)
            "newLatLngBoundsRect" -> newLatLngBoundsRect(map, data)
            "zoomBy" -> zoomBy(map, data)
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
        map.moveCamera(CameraUpdateFactory.zoomTo(data.toFloat()))
        return ReplyToFlutter.Success()
    }

    private fun newCameraPosition(map: AMap, data: Any?): ReplyToFlutter {
        require(data is JSONObject)
        val cameraPositionData: CameraPositionData? = data.toString().parseObject()
        require(cameraPositionData != null)
        map.moveCamera(CameraUpdateFactory.newCameraPosition(cameraPositionData.toCameraPosition()))
        return ReplyToFlutter.Success()
    }

    private fun newLatLng(map: AMap, data: Any?): ReplyToFlutter {
        require(data is JSONObject)
        val latLngData: LatLngData? = data.toString().parseObject()
        require(latLngData != null)
        map.moveCamera(CameraUpdateFactory.newLatLng(latLngData.toLatLng()))
        return ReplyToFlutter.Success()
    }

    private fun newLatLngBounds(map: AMap, data: Any?): ReplyToFlutter {
        require(data is JSONObject)
        val bounds: LatLngBoundsData? = data.opt("bounds")?.toString()?.parseObject()
        val width = data.optInt("width")
        val height = data.optInt("height")
        val padding = data.optInt("padding")
        require(bounds != null)
        if (width > 0 && height > 0) {
            map.moveCamera(CameraUpdateFactory.newLatLngBounds(bounds.toLatLngBounds(), width, height, padding))
        } else {
            map.moveCamera(CameraUpdateFactory.newLatLngBounds(bounds.toLatLngBounds(), padding))
        }
        return ReplyToFlutter.Success()
    }

    private fun newLatLngBoundsRect(map: AMap, data: Any?): ReplyToFlutter {
        require(data is JSONObject)
        val bounds: LatLngBoundsData? = data.opt("latLngBounds")?.toString()?.parseObject()
        val paddingLeft = data.optInt("paddingLeft")
        val paddingRight = data.optInt("paddingRight")
        val paddingTop = data.optInt("paddingTop")
        val paddingBottom = data.optInt("paddingBottom")
        require(bounds != null)
        map.moveCamera(CameraUpdateFactory.newLatLngBoundsRect(bounds.toLatLngBounds(), paddingLeft, paddingRight, paddingTop, paddingBottom))
        return ReplyToFlutter.Success()
    }

    private fun newLatLngZoom(map: AMap, data: Any?): ReplyToFlutter {
        require(data is JSONObject)
        val latLng: LatLngData? = data.opt("latLng")?.toString()?.parseObject()
        val zoom = data.optDouble("zoom")
        require(latLng != null && !zoom.isNaN())
        map.moveCamera(CameraUpdateFactory.newLatLngZoom(latLng.toLatLng(), zoom.toFloat()))
        return ReplyToFlutter.Success()
    }

    private fun scrollBy(map: AMap, data: Any?): ReplyToFlutter {
        require(data is JSONObject)
        val xPixel = data.optDouble("xPixel")
        val yPixel = data.optDouble("yPixel")
        require(!xPixel.isNaN() && !yPixel.isNaN())
        map.moveCamera(CameraUpdateFactory.scrollBy(xPixel.toFloat(), yPixel.toFloat()))
        return ReplyToFlutter.Success()
    }

    private fun zoomBy(map: AMap, data: Any?): ReplyToFlutter {
        require(data is JSONObject)
        val amount = data.optDouble("amount")
        val focus = data.opt("focus")?.toString()?.parseObject<ScreenPoint>()
        require(focus != null)
        map.moveCamera(CameraUpdateFactory.zoomBy(amount.toFloat(), focus.toPoint()))
        return ReplyToFlutter.Success()
    }

}