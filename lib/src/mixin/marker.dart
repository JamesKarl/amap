import 'package:amap/src/amap/model/model.dart';

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
}
