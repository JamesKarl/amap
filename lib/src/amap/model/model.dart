///相机位置，这个类包含了所有的可视区域的位置参数。
class CameraPosition {
  ///可视区域指向的方向，以角度为单位，从正北向逆时针方向计算，从0 度到360 度。
  double bearing;

  ///该位置是否在国内（此属性不是精确计算，不能用于边界区域）
  bool isAbroad;

  ///目标位置的屏幕中心点经纬度坐标。
  LatLng target;

  ///目标可视区域的倾斜度，以角度为单位。
  double tilt;

  ///目标可视区域的缩放级别。
  double zoom;

  CameraPosition({
    this.bearing,
    this.isAbroad,
    this.target,
    this.tilt,
    this.zoom,
  });

  CameraPosition.fromJson(Map<String, dynamic> json) {
    this.bearing = json['bearing'];
    this.isAbroad = json['isAbroad'];
    this.target = json['target'];
    this.tilt = json['tilt'];
    this.zoom = json['zoom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bearing'] = bearing;
    data['isAbroad'] = isAbroad;
    data['target'] = target;
    data['tilt'] = tilt;
    data['zoom'] = zoom;
    return data;
  }

  @override
  String toString() {
    return 'CameraPosition{bearing: $bearing, isAbroad: $isAbroad, target: $target, tilt: $tilt, zoom: $zoom}';
  }
}

class LatLng {
  double latitude, longitude;

  LatLng(this.latitude, this.longitude);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }

  LatLng.fromJson(Map<String, dynamic> json) {
    this.latitude = json['latitude'];
    this.longitude = json['longitude'];
  }

  @override
  String toString() {
    return 'LatLng{latitude: $latitude, longitude: $longitude}';
  }
}
