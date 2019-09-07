import 'package:amap/src/amap/model/circle_options.dart';
import 'package:amap/src/amap/model/model.dart';
import 'package:amap/src/amap/model/polyline_options.dart';

import '../../amap.dart';
import '../MapMethods.dart';

mixin MarkerMixin on NativeMessenger {
  ///在指定的位置（经纬度）添加Marker
  Future<MessageReply> addMarker(MarkerOptions marker) {
    return sendMessageToNative(MapMethods.addMarker, data: marker);
  }

  ///添加多个Marker
  Future<MessageReply> addMarkers(List<MarkerOptions> markers) {
    return sendMessageToNative(MapMethods.addMarkers, data: markers);
  }

  ///添加圆
  Future<MessageReply> addCircle(CircleOptions circleOptions) {
    return sendMessageToNative(MapMethods.addCircle, data: circleOptions);
  }

  ///添加折线
  Future<MessageReply> addPolyline(PolylineOptions polylineOptions) {
    return sendMessageToNative(MapMethods.addPolyline, data: polylineOptions);
  }
}
