package com.jameskarl.amap_example

import android.app.Activity
import android.view.View
import android.widget.TextView
import com.jameskarl.amap.map.apis.MarkerIconFactory
import com.jameskarl.amap.map.bean.MarkerOptionData

class MyMarkerIconFactory : MarkerIconFactory {
    override fun createMarkerIcon(context: Activity, markerOptionData: MarkerOptionData): View? {
        return context.layoutInflater.inflate(R.layout.marker, null).also {
            it.findViewById<TextView>(R.id.title).text = markerOptionData.title
        }
    }
}