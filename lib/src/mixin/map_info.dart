import 'package:amap/amap.dart';

import '../MapMethods.dart';

mixin MapInfo on NativeMessenger {
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
}
