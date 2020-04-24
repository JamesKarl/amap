package com.jameskarl.amap.map.bean

import com.jameskarl.amap.map.IJsonEntity

data class MapCreationParams(
        var cameraPosition: CameraPositionData? = null,
        var settings: UiSettings? = null
) : IJsonEntity {
    override fun toString(): String {
        return "MapCreationParams(cameraPositionData=$cameraPosition, settings=$settings)"
    }
}
