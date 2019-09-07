import 'package:amap/amap.dart';

class MapCreationParams {
  CameraPosition cameraPosition;

  MapCreationParams({this.cameraPosition});

  Map<String, dynamic> toJson() {
    return {
      'cameraPosition': this.cameraPosition,
    };
  }

  factory MapCreationParams.fromJson(Map<String, dynamic> map) {
    return new MapCreationParams(
      cameraPosition: map['cameraPosition'] as CameraPosition,
    );
  }

  @override
  String toString() {
    return 'MapCreationParams{cameraPosition: $cameraPosition}';
  }
}
