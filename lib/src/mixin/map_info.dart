import 'package:amap/amap.dart';

import '../MapMethods.dart';

mixin MapInfoMixin on NativeMessenger {
  ///获取屏幕中心点经纬度
  Future<MapPoint> getCenterPoint() async {
    return sendMessageToNative(MapMethods.getCenter).then((reply) {
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

  Future<MessageReply> setZoomControlsEnabled(bool enable) {
    return sendMessageToNative(MapMethods.setZoomControlsEnabled, data: enable);
  }

  Future<MessageReply> setCompassEnabled(bool enable) {
    return sendMessageToNative(MapMethods.setCompassEnabled, data: enable);
  }

  Future<MessageReply> setMyLocationButtonEnabled(bool enable) {
    return sendMessageToNative(MapMethods.setMyLocationButtonEnabled,
        data: enable);
  }

  Future<MessageReply> setMyLocationEnabled(bool enable) {
    return sendMessageToNative(MapMethods.setMyLocationEnabled, data: enable);
  }

  Future<MessageReply> setScaleControlsEnabled(bool enable) {
    return sendMessageToNative(MapMethods.setScaleControlsEnabled,
        data: enable);
  }

  Future<MessageReply> setLogoPosition(LogoPosition position) {
    return sendMessageToNative(MapMethods.setLogoPosition,
        data: position.index);
  }
}

enum LogoPosition { BOTTOM_LEFT, BOTTOM_CENTER, BOTTOM_RIGHT }
