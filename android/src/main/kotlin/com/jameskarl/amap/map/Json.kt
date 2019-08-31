package com.jameskarl.amap.map

import com.alibaba.fastjson.JSON
import com.alibaba.fastjson.TypeReference

interface IJsonEntity

inline fun <reified T : IJsonEntity> String?.parseObject(): T? = try {
    if (this == null) null else JSON.parseObject(this, object : TypeReference<T>() {})
} catch (t: Throwable) {
    t.printStackTrace()
    null
}

fun Any.toJson(): String = JSON.toJSONString(this)