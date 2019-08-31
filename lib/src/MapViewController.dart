import 'dart:convert';

import 'package:flutter/services.dart';

import 'MapMethods.dart';
import 'MessageReply.dart';
import 'bean/MapClickedEvent.dart';
import 'bean/MapData.dart';
import 'bean/MarkerData.dart';

class MapEventListener {
  void onMapClicked(MapClickedEvent event) {}

  void onMarkerClicked() {}

  void onMapLoaded() {}
}

class MapViewController {
  final MapEventListener mapEventListener;
  BasicMessageChannel _basicMessageChannel;

  MapViewController(this.mapEventListener) : assert(mapEventListener != null);

  ///初始化与地图交互的通道
  void bindMessageChannel(BasicMessageChannel channel) {
    if (channel != null) {
      channel.setMessageHandler(this._nativeMessageHandler);
    }
    _basicMessageChannel?.setMessageHandler(null);
    _basicMessageChannel = channel;
  }

  Future<dynamic> _nativeMessageHandler(dynamic message) async {
    print("_basicMessageChannel $message  ${message.runtimeType}");
    try {
      MapMethods.onMessage(mapEventListener, jsonDecode(message));
    } catch (e) {
      print(e);
    }
  }

  Future<MessageReply> _sendMessageToNative(
    String methodId, {
    Map<String, dynamic> data,
  }) {
    return _basicMessageChannel
        .send(jsonEncode({"id": methodId, "data": data}))
        .then((res) {
      return _handleReply(methodId, res);
    }).catchError((e) {
      return MessageReply(
        methodId: methodId,
        success: false,
        message: e.toString(),
      );
    });
  }

  ///处理从原生代码中返回的数据（消息）
  MessageReply _handleReply(String methodId, dynamic response) {
    if (response is String) {
      try {
        final Map<String, dynamic> json = jsonDecode(response);
        return MessageReply(
            methodId: json["id"],
            success: json["success"] ?? true,
            message: json["message"],
            data: json["data"]);
      } catch (e) {
        print(e);
        return MessageReply.error(methodId, e.toString());
      }
    } else {
      return MessageReply.error(methodId, "原生代码返回的数据必须是字符串");
    }
  }

  ///在指定的位置（经纬度）添加Marker
  Future<MessageReply> addMarker(MapPoint at, MarkerData marker) {
    return _sendMessageToNative(MapMethods.addMarker, data: {
      "at": at,
      "marker": marker,
    });
  }

  ///获取屏幕中心点经纬度
  Future<MapPoint> getCenterPoint() async {
    return _sendMessageToNative(MapMethods.getCenter).then((reply) {
      if (reply.success && reply.data != null) {
        return MapPoint(
          longitude: reply.data["longitude"],
          latitude: reply.data["latitude"],
        );
      } else {
        return null;
      }
    });
  }
}
