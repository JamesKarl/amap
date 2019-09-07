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

class MarkerOptions {
  double alpha;
  double anchorU, anchorV;
  bool draggable;
  String icon; //todo
  List<String> icons; //todo
  int infoWindowOffsetX, infoWindowOffsetY;
  bool infoWindowEnable;
  int period;
  LatLng position;
  double rotateAngle;
  String snippet;
  String title;
  double zIndex;
  bool visible;
  bool flat;
  bool gps;
  dynamic extra;

  MarkerOptions({
    this.alpha,
    this.anchorU,
    this.anchorV,
    this.draggable,
    this.icon,
    this.icons,
    this.infoWindowOffsetX,
    this.infoWindowOffsetY,
    this.infoWindowEnable,
    this.period,
    this.position,
    this.rotateAngle,
    this.snippet,
    this.title,
    this.zIndex,
    this.visible,
    this.flat,
    this.gps,
    this.extra,
  });

  MarkerOptions.fromJson(Map<String, dynamic> json) {
    this.alpha = json['alpha'];
    this.anchorU = json['anchorU'];
    this.anchorV = json['anchorV'];
    this.draggable = json['draggable'];
    this.icon = json['icon'];
    this.icons = json['icons'];
    this.infoWindowOffsetX = json['infoWindowOffsetX'];
    this.infoWindowOffsetY = json['infoWindowOffsetY'];
    this.infoWindowEnable = json['infoWindowEnable'];
    this.period = json['period'];
    this.position = json['position'];
    this.rotateAngle = json['rotateAngle'];
    this.snippet = json['snippet'];
    this.title = json['title'];
    this.zIndex = json['zIndex'];
    this.visible = json['visible'];
    this.flat = json['flat'];
    this.gps = json['gps'];
    this.extra = json['extra'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alpha'] = alpha;
    data['anchorU'] = anchorU;
    data['anchorV'] = anchorV;
    data['draggable'] = draggable;
    data['icon'] = icon;
    data['icons'] = icons;
    data['infoWindowOffsetX'] = infoWindowOffsetX;
    data['infoWindowOffsetY'] = infoWindowOffsetY;
    data['infoWindowEnable'] = infoWindowEnable;
    data['period'] = period;
    data['position'] = position;
    data['rotateAngle'] = rotateAngle;
    data['snippet'] = snippet;
    data['title'] = title;
    data['zIndex'] = zIndex;
    data['visible'] = visible;
    data['flat'] = flat;
    data['gps'] = gps;
    data['extra'] = extra;
    return data;
  }
}
