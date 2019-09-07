import '../amap.dart';
import 'bean/MapClickedEvent.dart';

abstract class MapMethods {
  ///地图事件
  static const onMapLoaded = "onMapLoaded";
  static const onMapClicked = "onMapClicked";

  ///绘制点标记
  static const onMarkerClicked = "onMarkerClicked";
  static const onMarkerDragged = "onMarkerDragged";
  static const onMarkerDragStart = "onMarkerDragStart";
  static const onMarkerDragEnd = "onMarkerDragEnd";
  static const onInfoWindowClicked = "onInfoWindowClicked";

  static const onCameraChange = "onCameraChange";
  static const onCameraChangeFinish = "onCameraChangeFinish";

  static onMessage(MapEventListener listener, Map<String, dynamic> message) {
    final methodId = message["id"];
    final data = message['data'];
    //print("onMessage $methodId -> $data");
    if (methodId == onMapClicked) {
      listener.onMapClicked(MapClickedEvent.fromJson(data));
    } else if (methodId == onMapLoaded) {
      listener.onMapLoaded();
    } else if (methodId == onMarkerClicked) {
      listener.onMarkerClicked(MarkerOptions.fromJson(data));
    } else if (methodId == onInfoWindowClicked) {
      listener.onInfoWindowClicked(MarkerOptions.fromJson(data));
    } else if (methodId == onMarkerDragged) {
      //listener.onMarkerDragged(MarkerOptions.fromJson(data));
    } else if (methodId == onMarkerDragStart) {
      //listener.onMarkerDragStart(MarkerOptions.fromJson(data));
    } else if (methodId == onMarkerDragEnd) {
      listener.onMarkerDragEnd(MarkerOptions.fromJson(data));
    } else if (methodId == onCameraChange) {
      listener.onCameraChange(CameraPosition.fromJson(data));
    } else if (methodId == onCameraChangeFinish) {
      listener.onCameraChange(CameraPosition.fromJson(data));
    } else {
      print(
          "message from native platform not  consumed. methodId=$methodId data=$data ");
    }
  }
}
