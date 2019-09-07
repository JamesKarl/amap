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

  static List<MarkerOptions> createMarkerListData(List<LatLng> points) {
    return points.map((p) => createMarker(p.latitude, p.longitude)).toList();
  }

  static CircleOptions createCircle(double latitude, double longitude) {
    final options = CircleOptions();
    options
      ..radius = 5.0
      ..fillColor = Colors.purple.value
      ..strokeColor = Colors.green.value
      ..strokeDottedLineType = MapConstants.DOTTED_LINE_TYPE_DEFAULT
      ..center = LatLng(latitude, longitude);
    return options;
  }

  static PolylineOptions createPolyline(List<LatLng> points) {
    return PolylineOptions(
      points: points,
      color: Colors.green.value,
      width: 15,
      dottedLine: false,
      lineCapType: LineCapType.LineCapArrow,
      lineJoinType: LineJoinType.LineJoinRound,
    );
  }

  static List<LatLng> createPoints(
      double latitude, double longitude, int count) {
    final points = <LatLng>[];
    final random = Random();
    for (var i = 0; i < count; i++) {
      final deltaX = random.nextDouble() * 0.001 * (random.nextBool() ? 1 : -1);
      final deltaY = random.nextDouble() * 0.001 * (random.nextBool() ? 1 : -1);
      points.add(LatLng(latitude + deltaX, longitude + deltaY));
    }
    return points;
  }
}
