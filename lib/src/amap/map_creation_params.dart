import 'package:amap/amap.dart';

class MapCreationParams {
  CameraPosition cameraPosition;
  UiSettings settings;

  MapCreationParams({
    this.cameraPosition,
    this.settings,
  });

  Map<String, dynamic> toJson() {
    return {
      'cameraPosition': this.cameraPosition,
      'settings': this.settings,
    };
  }

  factory MapCreationParams.fromJson(Map<String, dynamic> map) {
    return new MapCreationParams(
      cameraPosition: CameraPosition.fromJson(map['cameraPosition']),
      settings: UiSettings.fromJson(map['settings']),
    );
  }

  @override
  String toString() {
    return 'MapCreationParams{cameraPosition: $cameraPosition, settings: $settings}';
  }
}
