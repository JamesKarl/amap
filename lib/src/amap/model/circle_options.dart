import 'package:amap/amap.dart';

class CircleOptions {
  List<CircleHoleOptionsData> holeOptions;
  LatLng center;
  int fillColor;
  double radius;
  int strokeColor;

  int strokeDottedLineType;
  double strokeWidth;
  double zIndex;
  bool visible;

  CircleOptions({
    this.holeOptions = const [],
    this.center,
    this.fillColor,
    this.radius,
    this.strokeColor,
    this.strokeDottedLineType,
    this.strokeWidth,
    this.zIndex,
    this.visible,
  });

  Map<String, dynamic> toJson() {
    return {
      'holeOptions': this.holeOptions,
      'center': this.center,
      'fillColor': this.fillColor,
      'radius': this.radius,
      'strokeColor': this.strokeColor,
      'strokeDottedLineType': this.strokeDottedLineType,
      'strokeWidth': this.strokeWidth,
      'zIndex': this.zIndex,
      'visible': this.visible,
    };
  }

  factory CircleOptions.fromJson(Map<String, dynamic> map) {
    return new CircleOptions(
      holeOptions: map['holeOptions'] as List<CircleHoleOptionsData>,
      center: map['center'] as LatLng,
      fillColor: map['fillColor'] as int,
      radius: map['radius'] as double,
      strokeColor: map['strokeColor'] as int,
      strokeDottedLineType: map['strokeDottedLineType'] as int,
      strokeWidth: map['strokeWidth'] as double,
      zIndex: map['zIndex'] as double,
      visible: map['visible'] as bool,
    );
  }
}

class CircleHoleOptionsData {
  LatLng center;
  double radius;

  CircleHoleOptionsData({this.center, this.radius});

  Map<String, dynamic> toJson() {
    return {
      'center': this.center,
      'radius': this.radius,
    };
  }

  factory CircleHoleOptionsData.fromJson(Map<String, dynamic> map) {
    return new CircleHoleOptionsData(
      center: map['center'] as LatLng,
      radius: map['radius'] as double,
    );
  }
}
