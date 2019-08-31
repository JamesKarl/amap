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

  ///缩放手势
  ///缩放手势可改变地图的缩放级别，地图响应的手势如下：
  ///双击地图可以使缩放级别增加1 (放大)
  ///两个手指捏/拉伸
  ///也可以禁用或启用缩放手势。禁用缩放手势不会影响用户使用地图上的缩放控制按钮
  Future<MessageReply> setZoomGesturesEnabled(bool enable) {
    return sendMessageToNative(MapMethods.setZoomGesturesEnabled, data: enable);
  }

  /// 滑动手势
  ///您可以用手指拖动地图四处滚动（平移）或用手指滑动地图（动画效果），也可以禁用或开启平移（滑动）手势。 以
  Future<MessageReply> setScrollGesturesEnabled(bool enable) {
    return sendMessageToNative(MapMethods.setScrollGesturesEnabled,
        data: enable);
  }

  ///旋转手势
  ///您可以用两个手指在地图上转动，可以旋转3D矢量地图，也可以禁用旋转手势。
  Future<MessageReply> setRotateGesturesEnabled(bool enable) {
    return sendMessageToNative(MapMethods.setRotateGesturesEnabled,
        data: enable);
  }

  ///倾斜手势
  ///用户可以在地图上放置两个手指，移动它们一起向下或向上去增加或减小倾斜角，也可以禁用倾斜手势。
  Future<MessageReply> setTiltGesturesEnabled(bool enable) {
    return sendMessageToNative(MapMethods.setTiltGesturesEnabled, data: enable);
  }

  ///x、y均为屏幕坐标，屏幕左上角为坐标原点，即(0,0)点。
  Future<MessageReply> setPointToCenter(int x, int y) {
    return sendMessageToNative(MapMethods.setPointToCenter,
        data: {"x": x, "y": y});
  }

  ///开启以中心点进行手势操作的方法
  Future<MessageReply> setGestureScaleByMapCenter(bool enable) {
    return sendMessageToNative(MapMethods.setGestureScaleByMapCenter,
        data: enable);
  }
}

enum LogoPosition { BOTTOM_LEFT, BOTTOM_CENTER, BOTTOM_RIGHT }
