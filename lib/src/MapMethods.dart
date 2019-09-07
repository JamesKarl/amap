import '../amap.dart';
import 'bean/MapClickedEvent.dart';

abstract class MapMethods {
  ///地图事件
  static const onMapLoaded = "onMapLoaded";
  static const onMapClicked = "onMapClicked";

  ///控件交互
  static const setZoomControlsEnabled = "setZoomControlsEnabled";
  static const setCompassEnabled = "setCompassEnabled";
  static const setMyLocationButtonEnabled = "setMyLocationButtonEnabled";
  static const setMyLocationEnabled = "setMyLocationEnabled";
  static const setScaleControlsEnabled = "setScaleControlsEnabled";
  static const setLogoPosition = "setLogoPosition";

  ///手势交互
  static const setZoomGesturesEnabled = "setZoomGesturesEnabled";
  static const setScrollGesturesEnabled = "setScrollGesturesEnabled";
  static const setRotateGesturesEnabled = "setRotateGesturesEnabled";
  static const setTiltGesturesEnabled = "setTiltGesturesEnabled";
  static const setPointToCenter = "setPointToCenter";
  static const setGestureScaleByMapCenter = "setGestureScaleByMapCenter";

  ///调用方法交互
  static const animateCamera = "animateCamera";
  static const moveCamera = "moveCamera";

  ///地图截屏功能
  static const getMapScreenShot = "getMapScreenShot";

  ///绘制点标记
  static const addMarker = "addMarker";
  static const addMarkers = "addMarkers";
  static const onMarkerClicked = "onMarkerClicked";
  static const onMarkerDragged = "onMarkerDragged";
  static const onMarkerDragStart = "onMarkerDragStart";
  static const onMarkerDragEnd = "onMarkerDragEnd";
  static const onInfoWindowClicked = "onInfoWindowClicked";

  ///绘制几何图形
  static const addPolyline = "addPolyline";
  static const addCircle = "addCircle";
  static const addPolygon = "addPolygon";

  static const getCenter = "getCenter";

  static const clear = "clear";

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
    } else {
      print(
          "message from native platform not  consumed. methodId=$methodId data=$data ");
    }
  }
}
