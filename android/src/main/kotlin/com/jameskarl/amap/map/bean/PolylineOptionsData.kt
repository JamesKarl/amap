package com.jameskarl.amap.map.bean

import com.amap.api.maps.model.PolylineOptions
import com.jameskarl.amap.map.IJsonEntity

class PolylineOptionsData(
        var points: List<LatLngData>? = null,
        var color: Int? = null,
        var colorValues: List<Int>? = null,
        var geodesic: Boolean? = null,
        var dottedLine: Boolean? = null,
        var useGradient: Boolean? = null,
        var dottedLineType: Int? = null,
        var transparency: Float? = null,
        var width: Float? = null,
        var zIndex: Float? = null,
        var visible: Boolean? = null,
        var rangeBegin: Double? = null,
        var rangeEnd: Double? = null,
        var lineCapType: Int? = null,
        var lineJoinType: Int? = null
) : IJsonEntity {
    fun toPolylineOptionsData(): PolylineOptions {
        return PolylineOptions().also { option ->
            points?.let { option.addAll(it.map { point -> point.toLatLng() }) }
            color?.let { option.color(it) }
            colorValues?.let { option.colorValues(it) }
            geodesic?.let { option.geodesic(it) }
            dottedLineType?.let { option.setDottedLineType(it) }
            transparency?.let { option.transparency(it) }
            width?.let { option.width(it) }
            zIndex?.let { option.zIndex(it) }
            visible?.let { option.visible(it) }
            lineCapType?.let { option.lineCapType(PolylineOptions.LineCapType.valueOf(it)) }
            lineJoinType?.let { option.lineJoinType(PolylineOptions.LineJoinType.valueOf(it)) }
            dottedLine?.let { option.setDottedLine(it) }
            useGradient?.let { option.isUseTexture = it }
            rangeBegin?.let { begin ->
                rangeEnd?.let { end ->
                    option.setShownRange(begin.toFloat(), end.toFloat())
                }
            }
        }
    }
}