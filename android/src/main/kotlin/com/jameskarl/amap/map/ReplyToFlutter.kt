package com.jameskarl.amap.map

sealed class ReplyToFlutter(var id: String = "???", val success: Boolean = true, val message: String = "", val data: Any? = null) {
    class Success(id: String = "???", data: Any? = null) : ReplyToFlutter(id = id, success = true, data = data)
    class Failed(id: String = "???", message: String, data: Any? = null) : ReplyToFlutter(id = id, success = false, message = message, data = data)
}