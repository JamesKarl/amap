package com.jameskarl.amap.map.apis

import android.view.View
import android.widget.TextView
import com.amap.api.maps.AMap
import com.amap.api.maps.model.Marker
import com.jameskarl.amap.map.PlatformMapView

/**
 * https://lbs.amap.com/api/android-sdk/guide/draw-on-map/draw-marker
 */
internal class DefaultInfoWindowAdapter : AMap.InfoWindowAdapter {
    /**
     * 当实现此方法并返回有效值时（返回值不为空，则视为有效）,SDK 将不会使用默认的样式，
     * 而采用此方法返回的样式（即 View）。默认会将Marker 的 title 和 snippet 显示到 InfoWindow 中。
     * 如果此时修改了 Marker 的 title 或者 snippet 内容，再次调用类 Marker 的 showInfoWindow() 方法，
     * InfoWindow 内容不会更新。自定义 InfoWindow 之后所有的内容更新都需要用户自己完成。
     * 当调用 Marker 类的 showInfoWindow() 方法时，SDK 会调用 getInfoWindow（Marker marker）
     * 方法和 getInfoContents(Marker marker) 方法（之后会提到），在这些方法中更新 InfoWindow 的内容即可。
     * 注意：如果此方法返回的 View 没有设置 InfoWindow 背景图，SDK 会默认添加一个背景图。
     */
    override fun getInfoWindow(marker: Marker?): View? {
        val activity = PlatformMapView.activity
        if (marker == null || activity == null) return null
        return TextView(activity).apply {
            text = "todo XXXX marker.title"
        }
    }

    /**
     * 此方法和 getInfoWindow（Marker marker） 方法的实质是一样的，唯一的区别是：
     * 此方法不能修改整个 InfoWindow 的背景和边框，无论自定义的样式是什么样，
     * SDK 都会在最外层添加一个默认的边框。
     */
    override fun getInfoContents(marker: Marker?): View? {
        val activity = PlatformMapView.activity
        if (marker == null || activity == null) return null

        return TextView(activity).apply {
            text = marker.title
        }
    }
}