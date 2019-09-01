package com.jameskarl.amap.map.apis

import android.graphics.BitmapFactory
import android.util.Log
import androidx.collection.LruCache
import com.amap.api.maps.AMap
import com.amap.api.maps.model.BitmapDescriptor
import com.amap.api.maps.model.BitmapDescriptorFactory
import com.amap.api.maps.model.MarkerOptions
import com.jameskarl.amap.map.PlatformMapView
import com.jameskarl.amap.map.ReplyToFlutter
import com.jameskarl.amap.map.bean.MarkerOptionData
import com.jameskarl.amap.map.parseObject
import org.json.JSONArray
import org.json.JSONObject

class MarkerApi {
    private val cache: LruCache<String, BitmapDescriptor> = LruCache(20)
    fun addMarker(map: AMap, data: Any?): ReplyToFlutter {
        require(data is JSONObject)
        return try {
            val markerOptionData: MarkerOptionData? = data.toString().parseObject()
            if (markerOptionData == null) {
                ReplyToFlutter.Failed(message = "parse data failed. $data")
            } else {
                setInfoWindowAdapter(map)
                val markerOptions = markerOptionData.toMarkerOptions()
                attachMarkerIcon(markerOptionData, markerOptions)
                map.addMarker(markerOptions).let { marker ->
                    markerOptionData.extra?.let { extra ->
                        Log.d("MAP", "extra runtime type: ${extra::class.java.simpleName}")
                        marker.setObject(extra)
                    }
                }
                ReplyToFlutter.Success()
            }
        } catch (e: Throwable) {
            ReplyToFlutter.Failed(message = e.localizedMessage)
        }
    }

    fun addMarkers(map: AMap, data: Any?): ReplyToFlutter {
        require(data is JSONArray && data.length() > 0)
        return try {
            setInfoWindowAdapter(map)
            (0 until data.length()).mapNotNull {
                val markerOptionData: MarkerOptionData? = data[it].toString().parseObject()
                markerOptionData
            }.map { markerOptionData ->
                val markerOptions = markerOptionData.toMarkerOptions()
                attachMarkerIcon(markerOptionData, markerOptions)
                markerOptions to markerOptionData
            }.let { markerOptionList ->
                map.addMarkers(ArrayList(markerOptionList.map { it.first }), true).let { markerList ->
                    markerList.zip(markerOptionList.map { it.second }).forEach {
                        it.second.extra?.let { extra ->
                            Log.d("MAP", "extra runtime type: ${extra::class.java.simpleName}")
                            it.first.setObject(extra)
                        }
                    }
                }
            }
            ReplyToFlutter.Success()
        } catch (e: Throwable) {
            ReplyToFlutter.Failed(message = e.localizedMessage)
        }
    }

    private fun setInfoWindowAdapter(map: AMap) {
        PlatformMapView.infoWindowAdapter?.let {
            map.setInfoWindowAdapter(it)
        }
    }

    private fun attachMarkerIcon(markerOptionData: MarkerOptionData, markerOptions: MarkerOptions) {
        markerOptionData.icon?.let { icon ->
            val cachedBitmapDescriptor = cache.get(icon)
            if (cachedBitmapDescriptor != null) {
                markerOptions.icon(cachedBitmapDescriptor)
            } else {
                PlatformMapView.getFlutterAsset(icon)?.let { fd ->
                    val bitmap = BitmapFactory.decodeStream(fd.createInputStream())
                    val bitmapDescriptor = BitmapDescriptorFactory.fromBitmap(bitmap)
                    cache.put(icon, bitmapDescriptor)
                    Log.d("MAP", "create new marker icon identified by $icon")
                    markerOptions.icon(bitmapDescriptor)
                }
            }
        }
    }
}