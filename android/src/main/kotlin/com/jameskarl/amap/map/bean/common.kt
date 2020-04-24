package com.jameskarl.amap.map.bean

import android.graphics.Point
import com.amap.api.maps.model.CameraPosition
import com.amap.api.maps.model.LatLng
import com.amap.api.maps.model.LatLngBounds
import com.jameskarl.amap.map.IJsonEntity

data class LatLngData(var latitude: Double = 0.0, var longitude: Double = 0.0) : IJsonEntity {

    constructor(position: LatLng) : this(position.latitude, position.longitude)

    fun toLatLng() = LatLng(latitude, longitude, true)

    override fun toString(): String {
        return "LatLngData(latitude=$latitude, longitude=$longitude)"
    }
}

data class ScreenPoint(var x: Int = 0, var y: Int = 0) : IJsonEntity {

    fun toPoint() = Point(x, y)

    override fun toString(): String {
        return "ScreenPoint(x=$x, y=$y)"
    }
}

data class LatLngBoundsData(
        var northeast: LatLngData = LatLngData(),
        var southwest: LatLngData = LatLngData()
) : IJsonEntity {
    fun toLatLngBounds(): LatLngBounds {
        return LatLngBounds(northeast.toLatLng(), southwest.toLatLng())
    }

    override fun toString(): String {
        return "LatLngBoundsData(northeast=$northeast, southwest=$southwest)"
    }
}

data class CameraPositionData(
        var bearing: Double? = null,
        var target: LatLngData? = null,
        var tilt: Double? = null,
        var zoom: Double? = null
) : IJsonEntity {

    constructor(cameraPosition: CameraPosition) : this(
            bearing = cameraPosition.bearing.toDouble(),
            target = LatLngData(cameraPosition.target),
            tilt = cameraPosition.tilt.toDouble(),
            zoom = cameraPosition.zoom.toDouble()
    )

    fun toCameraPosition(): CameraPosition {
        val builder = CameraPosition.Builder()
        bearing?.let { builder.bearing(it.toFloat()) }
        target?.let { builder.target(it.toLatLng()) }
        tilt?.let { builder.tilt(it.toFloat()) }
        zoom?.let { builder.zoom(it.toFloat()) }
        return builder.build()
    }

    override fun toString(): String {
        return "CameraPositionData(bearing=$bearing, target=$target, tilt=$tilt, zoom=$zoom)"
    }
}

data class UiSettings(
        var logoPosition: Int? = null,
        var zoomPosition: Int? = null,
        var compassEnabled: Boolean? = null,
        var gestureScaleByMapCenter: Boolean? = null,
        var indoorSwitchEnabled: Boolean? = null,
        var myLocationButtonEnabled: Boolean? = null,
        var rotateGesturesEnabled: Boolean? = null,
        var scaleControlsEnabled: Boolean? = null,
        var scrollGesturesEnabled: Boolean? = null,
        var tiltGesturesEnabled: Boolean? = null,
        var zoomControlsEnabled: Boolean? = null,
        var zoomGesturesEnabled: Boolean? = null,
        var allGesturesEnabled: Boolean? = null
) : IJsonEntity