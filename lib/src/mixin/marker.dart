import '../../amap.dart';

mixin MarkerMixin on NativeMessenger {
  ///在指定的位置（经纬度）添加Marker
  Future<MessageReply> addMarker(MarkerOptions marker) {
    return sendMessageToNative('addMarker', data: marker);
  }

  ///添加多个Marker
  Future<MessageReply> addMarkers(List<MarkerOptions> markers) {
    return sendMessageToNative('addMarkers', data: markers);
  }

  ///添加圆
  Future<MessageReply> addCircle(CircleOptions circleOptions) {
    return sendMessageToNative('addCircle', data: circleOptions);
  }

  ///添加折线
  Future<MessageReply> addPolyline(PolylineOptions polylineOptions) {
    return sendMessageToNative('addPolyline', data: polylineOptions);
  }

  ///从地图上删除所有的overlay（marker，circle，polyline 等对象）。
  Future<MessageReply> clear() {
    return sendMessageToNative('clear');
  }
}
