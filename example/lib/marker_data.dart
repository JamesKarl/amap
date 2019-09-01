import 'dart:math';

import 'package:amap/amap.dart';
import 'package:flutter/material.dart';

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
  static MarkerOptions createMarker(double latitude, double longitude,
      {String icon = "assets/icons/ico_test.png"}) {
    MarkerOptions option = MarkerOptions();
    option.position = LatLng(latitude, longitude);
    option.title = "Hello, world";
    option.snippet = "HaHA";
    option.rotateAngle = pi / 4;
    option..infoWindowEnable = true;
    option.draggable = true;
    option.flat = false;
    option.icon = icon;
    option.extra = MarkerExtraData(id: 33, name: "James");
    return option;
  }

  static MarkerOptions createMarkerData(MapClickedEvent event) {
    return createMarker(event.latitude, event.longitude, icon: null);
  }

  static List<MarkerOptions> createMarkerListData(
      MapClickedEvent event, int count) {
    final items = [createMarkerData(event)];
    final random = Random();
    for (var i = 0; i < count; i++) {
      final deltaX = random.nextDouble() * 0.001 * (random.nextBool() ? 1 : -1);
      final deltaY = random.nextDouble() * 0.001 * (random.nextBool() ? 1 : -1);
      items
          .add(createMarker(event.latitude + deltaX, event.longitude + deltaY));
    }
    return items;
  }

  static CircleOptions createCircle(double latitude, double longitude) {
    final options = CircleOptions();
    options
      ..radius = 30.0
      ..fillColor = Colors.purple.value
      ..strokeColor = Colors.green.value
      ..center = LatLng(latitude, longitude);
    return options;
  }
}
