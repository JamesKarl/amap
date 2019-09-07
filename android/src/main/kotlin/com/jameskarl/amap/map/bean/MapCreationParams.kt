package com.jameskarl.amap.map.bean

import com.jameskarl.amap.map.IJsonEntity

data class MapCreationParams(
        var cameraPositionData: CameraPositionData? = null
) : IJsonEntity {
    override fun toString(): String {
        return "MapCreationParams(cameraPositionData=$cameraPositionData)"
    }
}
