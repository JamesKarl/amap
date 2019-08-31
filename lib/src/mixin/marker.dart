import 'package:amap/src/amap/model/model.dart';

import '../../amap.dart';
import '../MapMethods.dart';

mixin MarkerMixin on NativeMessenger {
  ///在指定的位置（经纬度）添加Marker
  Future<MessageReply> addMarker(MarkerOptions marker) {
    return sendMessageToNative(MapMethods.addMarker, data: marker);
  }
}
