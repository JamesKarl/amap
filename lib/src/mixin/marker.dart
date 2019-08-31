import '../../amap.dart';
import '../MapMethods.dart';

mixin MarkerMixin on NativeMessenger {
  ///在指定的位置（经纬度）添加Marker
  Future<MessageReply> markerAddMarker(MapPoint at, MarkerData marker) {
    return sendMessageToNative(MapMethods.addMarker, data: {
      "at": at,
      "marker": marker,
    });
  }
}
