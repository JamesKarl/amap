package com.jameskarl.amap.map

import android.content.Context
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class MapViewPlugin {
    companion object {

        private const val mapViewType = "myb.com/mapView"

        fun registerWith(registrar: PluginRegistry.Registrar) {
            registrar.platformViewRegistry().registerViewFactory(mapViewType, MapViewFactory(registrar))
        }
    }
}


private class MapViewFactory(val registrar: PluginRegistry.Registrar) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    override fun create(context: Context?, id: Int, params: Any?): PlatformView {
        return PlatformMapView(context!!, id, registrar)
    }
}