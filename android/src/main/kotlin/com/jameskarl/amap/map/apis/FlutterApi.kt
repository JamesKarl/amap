package com.jameskarl.amap.map.apis

import com.amap.api.maps.AMap
import com.jameskarl.amap.map.ReplyToFlutter

interface FlutterApi {
    fun handle(methodId: String, map: AMap, data: Any?): ReplyToFlutter?
}