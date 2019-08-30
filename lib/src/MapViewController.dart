import 'dart:convert';

import 'package:flutter/services.dart';

import 'MapMethods.dart';
import 'MessageReply.dart';
import 'bean/MapData.dart';
import 'bean/MarkerData.dart';

class MapViewController {
  BasicMessageChannel _basicMessageChannel;

  ///初始化与地图交互的通道
  void bindMessageChannel(BasicMessageChannel channel) {
    if (channel != null) {
      channel.setMessageHandler(this._channelMessageHandler);
    }
    _basicMessageChannel?.setMessageHandler(null);
    _basicMessageChannel = channel;
  }

  Future<dynamic> _channelMessageHandler(dynamic message) async {
    print("_basicMessageChannel $message");
  }

  ///在指定的位置（经纬度）添加Marker
  void addMarker(MapPoint at, MarkerData marker) {
    final data = {
      "id": MapMethods.MARKER_ADD,
      "data": {
        "at": at,
        "marker": marker,
      },
    };
    _basicMessageChannel.send(jsonEncode(data));
  }

  ///获取屏幕中心点经纬度
  Future<MapPoint> getCenterPoint() async {
    final data = {"id": MapMethods.GET_CENTER_POINT};
    final res = await _basicMessageChannel.send(jsonEncode(data));
    final msg = _handleReply(res);
    if (msg.success && msg.data != null) {
      return MapPoint(
        longitude: msg.data["longitude"],
        latitude: msg.data["latitude"],
      );
    }
    return null;
  }

  ///处理从原生代码中返回的数据（消息）
  MessageReply _handleReply(dynamic response) {
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
        return MessageReply.error(e.toString());
      }
    } else {
      return MessageReply.error("原生代码返回的数据必须是字符串");
    }
  }
}
