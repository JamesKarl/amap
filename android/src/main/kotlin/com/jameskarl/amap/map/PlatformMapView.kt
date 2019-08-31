package com.jameskarl.amap.map

import android.app.Activity
import android.app.Application
import android.content.Context
import android.content.res.AssetFileDescriptor
import android.os.Bundle
import android.view.View
import com.amap.api.maps.AMap
import com.amap.api.maps.TextureMapView
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.platform.PlatformView

class PlatformMapView(context: Context, id: Int, private val registrar: PluginRegistry.Registrar) : PlatformView, Application.ActivityLifecycleCallbacks {

    private val mapView: TextureMapView = TextureMapView(context)
    private val messageHandler: MapMessageHandler = MapMessageHandler(registrar, mapView, id)

    private val registrarActivityHashCode: Int = registrar.activity().hashCode()
    private var disposed = false

    init {
        pluginRegistrar = registrar
        setup()
        messageHandler.setup()
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
        registrar.activity().application.registerActivityLifecycleCallbacks(this)
    }

    override fun onActivityCreated(activity: Activity, savedInstanceState: Bundle?) {
        if (!hasDisposed(activity)) {
            mapView.onCreate(savedInstanceState)
        }
    }

    override fun onActivityStarted(activity: Activity) {
        //np
    }

    override fun onActivityResumed(activity: Activity) {
        if (!hasDisposed(activity)) {
            mapView.onResume()
        }
    }

    override fun onActivityPaused(activity: Activity) {
        if (!hasDisposed(activity)) {
            mapView.onPause()
        }
    }

    override fun onActivityStopped(activity: Activity) {
        //np
    }

    override fun onActivitySaveInstanceState(activity: Activity, outState: Bundle?) {
        if (!hasDisposed(activity)) {
            mapView.onSaveInstanceState(outState)
        }
    }

    override fun onActivityDestroyed(activity: Activity) {
        if (!hasDisposed(activity)) {
            mapView.onDestroy()
        }
    }

    private fun hasDisposed(activity: Activity) =
            disposed || activity.hashCode() != registrarActivityHashCode

    companion object {
        var infoWindowAdapter: AMap.InfoWindowAdapter? = null
        internal var pluginRegistrar: PluginRegistry.Registrar? = null
        val activity: Activity? = pluginRegistrar?.activity()

        internal fun getFlutterAsset(relativePath: String): AssetFileDescriptor? {
            val registrar = pluginRegistrar ?: return null
            val assetManager = registrar.context().assets
            val key = registrar.lookupKeyForAsset(relativePath)
            return try {
                assetManager.openFd(key)
            } catch (e: Throwable) {
                e.printStackTrace()
                null
            }
        }
    }
}