package com.jameskarl.amap.map.bean

import com.amap.api.maps.model.LatLng
import com.amap.api.maps.model.Marker
import com.amap.api.maps.model.MarkerOptions
import com.jameskarl.amap.map.IJsonEntity

data class MarkerData(val id: String, val data: String)

fun Marker.toMarkerData(): MarkerData {
    return MarkerData(data = this.title, id = this.id)
}

data class MarkerOptionData(
        var alpha: Float?,
        var anchorU: Float?,
        var anchorV: Float?,
        var draggable: Boolean?,
        var icon: String?, //todo
        var icons: List<String>?, //todo
        var infoWindowOffsetX: Int?,
        var infoWindowOffsetY: Int?,
        var infoWindowEnable: Boolean?,
        var period: Int?,
        var position: LatLng?,
        var rotateAngle: Float?,
        var snippet: String?,
        var title: String?,
        var zIndex: Float?,
        var visible: Boolean?,
        var flat: Boolean?,
        var gps: Boolean?) : IJsonEntity {

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
                options.position(it)
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