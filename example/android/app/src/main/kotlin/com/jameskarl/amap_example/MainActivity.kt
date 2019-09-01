package com.jameskarl.amap_example

import android.os.Bundle
import com.jameskarl.amap.map.PlatformMapView

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        PlatformMapView.markerIconFactory = MyMarkerIconFactory()
    }
}
