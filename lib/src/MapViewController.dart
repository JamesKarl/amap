import 'dart:convert';

import 'package:amap/src/mixin/map_info.dart';
import 'package:flutter/services.dart';

import 'MapMethods.dart';
import 'MessageReply.dart';
import 'bean/MapClickedEvent.dart';
import 'mixin/marker.dart';

abstract class NativeMessenger {
  Future<MessageReply> sendMessageToNative(String methodId, {dynamic data});
}

class MapEventListener {
  void onMapClicked(MapClickedEvent event) {}

  void onMarkerClicked() {}

  void onMapLoaded() {}
}

class MapViewController extends NativeMessenger with MarkerMixin, MapInfoMixin {
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
    print("message from native platform: $message  ${message.runtimeType}");
    try {
      MapMethods.onMessage(mapEventListener, jsonDecode(message));
    } catch (e) {
      print(e);
    }
  }

  Future<MessageReply> sendMessageToNative(
    String methodId, {
    dynamic data,
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
        print("reply from native platform: $methodId -> $response");
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
}
