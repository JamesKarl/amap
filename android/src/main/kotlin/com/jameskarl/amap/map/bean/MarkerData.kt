package com.jameskarl.amap.map.bean

import com.amap.api.maps.model.Marker

data class MarkerData(val id: String, val data: String)


fun Marker.toMarkerData(): MarkerData {
    return MarkerData(data = this.title, id = this.id)
}