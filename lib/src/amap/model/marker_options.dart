import 'common.dart';

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
