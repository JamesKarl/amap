package com.jameskarl.amap.map.bean

import com.amap.api.maps.model.LatLng
import com.amap.api.maps.model.Marker

data class MarkerData(val id: String, val data: String)

fun Marker.toMarkerData(): MarkerData {
    return MarkerData(data = this.title, id = this.id)
}

data class MarkerOptionData(
        var alpha: Double?,
        var anchorU: Double?,
        var anchorV: Double?,
        var draggable: Boolean?,
        var icon: String?,
        var icons: List<String>?,
        var infoWindowOffsetX: Int?,
        var infoWindowOffsetY: Int?,
        var infoWindowEnable: Boolean?,
        var period: Int?,
        var position: LatLng?,
        var rotateAngle: Double?,
        var snippet: String?,
        var title: String?,
        var zIndex: Double?,
        var visible: Boolean?,
        var flat: Boolean?,
        var gps: Boolean?)