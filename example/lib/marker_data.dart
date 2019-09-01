import 'dart:math';

import 'package:amap/amap.dart';

class MarkerExtraData {
  int id;
  String name;

  MarkerExtraData({this.id, this.name});

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
    };
  }

  factory MarkerExtraData.fromJson(Map<String, dynamic> map) {
    return new MarkerExtraData(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }
}

abstract class DummyData {
  static MarkerOptions createMarker(double latitude, double longitude) {
    MarkerOptions option = MarkerOptions();
    option.position = LatLng(latitude, longitude);
    option.title = "Hello, world";
    option.snippet = "HaHA";
    option.rotateAngle = pi / 4;
    option..infoWindowEnable = true;
    option.draggable = true;
    option.flat = false;
    option.icon = "assets/icons/ico_test.png";
    option.extra = MarkerExtraData(id: 33, name: "James");
    return option;
  }

  static MarkerOptions createMarkerData(MapClickedEvent event) {
    return createMarker(event.latitude, event.longitude);
  }

  static List<MarkerOptions> createMarkerListData(
      MapClickedEvent event, int count) {
    final items = [createMarkerData(event)];
    final random = Random();
    for (var i = 0; i < count; i++) {
      items.add(
        createMarker(event.latitude + random.nextDouble() * 0.001,
            event.longitude + random.nextDouble() * 0.001),
      );
    }
    return items;
  }
}
