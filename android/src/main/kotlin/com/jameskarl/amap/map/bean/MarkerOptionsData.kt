package com.jameskarl.amap.map.bean

import com.amap.api.maps.model.Marker
import com.amap.api.maps.model.MarkerOptions
import com.jameskarl.amap.map.IJsonEntity

fun Marker.toMarkerOptionData(): MarkerOptionData {
    return MarkerOptionData().also {
        it.alpha = alpha
        it.anchorU = anchorU
        it.anchorV = anchorV
        it.draggable = isDraggable
        it.infoWindowEnable = isInfoWindowEnable
        it.period = period
        it.position = LatLngData(position)
        it.rotateAngle = rotateAngle
        it.snippet = snippet
        it.title = title
        it.zIndex = zIndex
        it.visible = isVisible
        it.flat = isFlat
        it.extra = `object`
    }
}

data class MarkerOptionData(
        var alpha: Float? = null,
        var anchorU: Float? = null,
        var anchorV: Float? = null,
        var draggable: Boolean? = null,
        var icon: String? = null, //todo
        //var icons: List<String>? = null, //todo
        var infoWindowOffsetX: Int? = null,
        var infoWindowOffsetY: Int? = null,
        var infoWindowEnable: Boolean? = null,
        var period: Int? = null,
        var position: LatLngData? = null,
        var rotateAngle: Float? = null,
        var snippet: String? = null,
        var title: String? = null,
        var zIndex: Float? = null,
        var visible: Boolean? = null,
        var flat: Boolean? = null,
        var extra: Any? = null,
        var gps: Boolean? = null
) : IJsonEntity {

    fun toMarkerOptions(): MarkerOptions {
        return MarkerOptions().also { options ->
            alpha?.let {
                options.alpha(it)
            }

            anchorU?.let { u ->
                anchorV?.let { v ->
                    options.anchor(u, v)
                }
            }

            draggable?.let {
                options.draggable(it)
            }

            infoWindowOffsetX?.let { x ->
                infoWindowOffsetY?.let { y ->
                    options.setInfoWindowOffset(x, y)
                }
            }

            infoWindowEnable?.let {
                options.infoWindowEnable(it)
            }

            period?.let {
                options.period(it)
            }

            position?.let {
                options.position(it.toLatLng())
            }

            rotateAngle?.let {
                options.rotateAngle(it)
            }

            snippet?.let {
                options.snippet(it)
            }

            title?.let {
                options.title(it)
            }

            zIndex?.let {
                options.zIndex(it)
            }

            visible?.let {
                options.visible(it)
            }

            flat?.let {
                options.setFlat(it)
            }

            gps?.let {
                options.setGps(it)
            }
        }
    }
}