///相机位置，这个类包含了所有的可视区域的位置参数。
class CameraPosition {
  ///可视区域指向的方向，以角度为单位，从正北向逆时针方向计算，从0 度到360 度。
  double bearing;

  ///目标位置的屏幕中心点经纬度坐标。
  LatLng target;

  ///目标可视区域的倾斜度，以角度为单位。
  double tilt;

  ///目标可视区域的缩放级别。
  double zoom;

  CameraPosition({
    this.bearing,
    this.target,
    this.tilt,
    this.zoom,
  });

  CameraPosition.fromJson(Map<String, dynamic> json) {
    this.bearing = json['bearing'];
    this.target = LatLng.fromJson(json['target']);
    this.tilt = json['tilt'];
    this.zoom = json['zoom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bearing'] = bearing;
    data['target'] = target;
    data['tilt'] = tilt;
    data['zoom'] = zoom;
    return data;
  }

  @override
  String toString() {
    return 'CameraPosition{bearing: $bearing, target: $target, tilt: $tilt, zoom: $zoom}';
  }
}

class ScreenPoint {
  int x, y;

  ScreenPoint({this.x, this.y});

  Map<String, dynamic> toJson() {
    return {
      'x': this.x,
      'y': this.y,
    };
  }

  factory ScreenPoint.fromJson(Map<String, dynamic> map) {
    return new ScreenPoint(
      x: map['x'] as int,
      y: map['y'] as int,
    );
  }

  @override
  String toString() {
    return 'ScreenPoint{x: $x, y: $y}';
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

///代表了经纬度划分的一个矩形区域。
class LatLngBounds {
  LatLng northeast, southwest;

  LatLngBounds.fromJson(Map<String, dynamic> json) {
    this.northeast = json['northeast'];
    this.southwest = json['southwest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['northeast'] = northeast;
    data['southwest'] = southwest;
    return data;
  }

  @override
  String toString() {
    return 'LatLngBounds{northeast: $northeast, southwest: $southwest}';
  }
}

enum LogoPosition { BOTTOM_LEFT, BOTTOM_CENTER, BOTTOM_RIGHT }
