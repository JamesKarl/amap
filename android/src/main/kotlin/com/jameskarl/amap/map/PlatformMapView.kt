package com.jameskarl.amap.map

import android.app.Activity
import android.app.Application
import android.content.Context
import android.os.Bundle
import android.util.Log
import android.view.View
import com.amap.api.maps.TextureMapView
import com.jameskarl.amap.map.bean.ChannelMessageData
import com.jameskarl.amap.map.bean.toMarkerData
import com.jameskarl.shop.toJson
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.StringCodec
import io.flutter.plugin.platform.PlatformView

class PlatformMapView(private val context: Context, private val id: Int, private val registrar: PluginRegistry.Registrar) : PlatformView, Application.ActivityLifecycleCallbacks {

    private val methodChannelPrefix = "com.myb/mapView"
    private val mapMethodChannelName = "$methodChannelPrefix/map$id"

    private val mapView = TextureMapView(context)
    private val registrarActivityHashCode: Int = registrar.activity().hashCode()
    private var disposed = false

    private val messageChannel: BasicMessageChannel<String>

    init {
        messageChannel = BasicMessageChannel<String>(registrar.messenger(), mapMethodChannelName, StringCodec.INSTANCE)
        setup()
    }

    override fun getView(): View {
        return mapView
    }

    override fun dispose() {
        if (disposed) {
            return
        }

        disposed = true
        registrar.activity().application.unregisterActivityLifecycleCallbacks(this)
        mapView.onDestroy()
    }

    private fun setup() {
        mapView.onCreate(null)
        initChannel()
        // 注册生命周期
        registrar.activity().application.registerActivityLifecycleCallbacks(this)
    }

    private fun initChannel() {
        messageChannel.setMessageHandler(MapMessageHandler(registrar, mapView))

        mapView.map.setOnMarkerClickListener {
            it.showInfoWindow()
            sendMessageToFlutter(ChannelMessageData(MapMethods.ON_MARKER_CLICKED, it.toMarkerData()))
            true
        }
        mapView.map.setOnMapClickListener {
            sendMessageToFlutter(ChannelMessageData(MapMethods.ON_MAP_CLICKED, it))
        }
        mapView.map.setOnMapLoadedListener {
            sendMessageToFlutter(ChannelMessageData(MapMethods.ON_MAP_LOADED))
        }
        Log.d("MAP", mapMethodChannelName)
    }

    private fun sendMessageToFlutter(message: ChannelMessageData) {
        val msg = message.toJson()
        Log.d("MAP", msg)
        messageChannel.send(msg)
    }

    override fun onActivityCreated(activity: Activity, savedInstanceState: Bundle?) {
        if (disposed || activity.hashCode() != registrarActivityHashCode) {
            return
        }
        mapView.onCreate(savedInstanceState)
    }

    override fun onActivityStarted(activity: Activity) {
        if (disposed || activity.hashCode() != registrarActivityHashCode) {
            return
        }
    }

    override fun onActivityResumed(activity: Activity) {
        if (disposed || activity.hashCode() != registrarActivityHashCode) {
            return
        }
        mapView.onResume()
    }

    override fun onActivityPaused(activity: Activity) {
        if (disposed || activity.hashCode() != registrarActivityHashCode) {
            return
        }
        mapView.onPause()
    }

    override fun onActivityStopped(activity: Activity) {
        if (disposed || activity.hashCode() != registrarActivityHashCode) {
            return
        }
    }

    override fun onActivitySaveInstanceState(activity: Activity, outState: Bundle?) {
        if (disposed || activity.hashCode() != registrarActivityHashCode) {
            return
        }
        mapView.onSaveInstanceState(outState)
    }

    override fun onActivityDestroyed(activity: Activity) {
        if (disposed || activity.hashCode() != registrarActivityHashCode) {
            return
        }
        mapView.onDestroy()
    }

}