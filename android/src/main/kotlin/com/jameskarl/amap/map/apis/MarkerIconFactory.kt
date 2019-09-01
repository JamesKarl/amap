package com.jameskarl.amap.map.apis

import android.app.Activity
import android.view.View
import com.jameskarl.amap.map.bean.MarkerOptionData

interface MarkerIconFactory {
    fun createMarkerIcon(context: Activity, markerOptionData: MarkerOptionData): View?
}