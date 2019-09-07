package com.jameskarl.amap.map.bean

import com.amap.api.maps.model.CircleHoleOptions
import com.amap.api.maps.model.CircleOptions
import com.jameskarl.amap.map.IJsonEntity

class CircleOptionsData(
        var holeOptions: List<CircleHoleOptionsData>? = null,
        var center: LatLngData? = null,
        var fillColor: Long? = null,
        var radius: Double? = null,
        var strokeColor: Long? = null,
        var strokeDottedLineType: Long? = null,
        var strokeWidth: Float? = null,
        var zIndex: Float? = null,
        var visible: Boolean? = null
) : IJsonEntity {

    fun toCircleOptions(): CircleOptions {
        return CircleOptions().also { option ->
            holeOptions?.let { option.addHoles(it.map { hole -> hole.toBaseHoleOptions() }) }
            center?.let { option.center(it.toLatLng()) }
            fillColor?.let { option.fillColor(it.toInt()) }
            radius?.let { option.radius(it) }
            strokeColor?.let { option.strokeColor(it.toInt()) }
            strokeDottedLineType?.let { option.setStrokeDottedLineType(it.toInt()) }
            strokeWidth?.let { option.strokeWidth(it) }
            zIndex?.let { option.zIndex(it) }
            visible?.let { option.visible(it) }
        }
    }
}

class CircleHoleOptionsData(
        var center: LatLngData? = null,
        var radius: Double? = null
) : IJsonEntity {
    fun toBaseHoleOptions(): CircleHoleOptions {
        return CircleHoleOptions().also { option ->
            center?.let { option.center(it.toLatLng()) }
            radius?.let { option.radius(it) }
        }
    }
}