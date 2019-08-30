package com.jameskarl.amap

import android.content.Context
import com.jameskarl.amap.map.PlatformMapView
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class AmapPlugin : MethodCallHandler {
    companion object {
        const val mapViewType = "com.jameskarl/mapView"
        private const val channelName = "com.jameskarl/map"

        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), channelName)
            channel.setMethodCallHandler(AmapPlugin())
            registrar.platformViewRegistry().registerViewFactory(mapViewType, MapViewFactory(registrar))
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else {
            result.notImplemented()
        }
    }
}


private class MapViewFactory(val registrar: Registrar) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    override fun create(context: Context?, id: Int, params: Any?): PlatformView {
        return PlatformMapView(context!!, id, registrar)
    }
}
