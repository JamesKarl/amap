import '../amap.dart';
import 'bean/MapClickedEvent.dart';

abstract class MapMethods {
  static const onMapLoaded = "onMapLoaded";
  static const onMapClicked = "onMapClicked";
  static const onMarkerClicked = "onMarkerClicked";

  static const addMarker = "addMarker";
  static const getCenter = "getCenter";

  static onMessage(MapEventListener listener, Map<String, dynamic> message) {
    final methodId = message["id"];
    final data = message['data'];
    if (methodId == onMapClicked) {
      listener.onMapClicked(MapClickedEvent.fromJson(data));
    }
  }
}
