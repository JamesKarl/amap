import 'package:amap/amap.dart';

class RegionBean {
  String name;
  double lng;
  double lat;
  int id;
  int flowCount;
  int coalpitCount;
  List<FlowBean> flowList;

  RegionBean({
    this.name,
    this.lng,
    this.lat,
    this.id,
    this.flowCount,
    this.coalpitCount,
    this.flowList,
  });

  RegionBean.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.lng = json['lng'];
    this.lat = json['lat'];
    this.id = json['id'];
    this.flowCount = json['flowCount'];
    this.coalpitCount = json['coalpitCount'];
    this.flowList = (json['flowList'] as List) != null
        ? (json['flowList'] as List).map((i) => FlowBean.fromJson(i)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['lng'] = this.lng;
    data['lat'] = this.lat;
    data['id'] = this.id;
    data['flowCount'] = this.flowCount;
    data['coalpitCount'] = this.coalpitCount;
    data['flowList'] = this.flowList != null
        ? this.flowList.map((i) => i.toJson()).toList()
        : null;
    return data;
  }

  List<LatLng> getAllPoints() {
    List<LatLng> points = [LatLng(lat, lng)];
    flowList?.forEach((flow) {
      flow.flowStationList?.forEach((s) {
        points.add(LatLng(s.lat, s.lng));
      });
    });
    return points;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegionBean && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'RegionBean{name: $name, lng: $lng, lat: $lat, id: $id, flowCount: $flowCount, coalpitCount: $coalpitCount, flowList: $flowList}';
  }
}

class FlowBean {
  String name;
  int id;
  List<FlowStationBean> flowStationList;

  FlowBean({this.name, this.id, this.flowStationList});

  FlowBean.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.id = json['id'];
    this.flowStationList = (json['flowStationList'] as List) != null
        ? (json['flowStationList'] as List)
            .map((i) => FlowStationBean.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['flowStationList'] = this.flowStationList != null
        ? this.flowStationList.map((i) => i.toJson()).toList()
        : null;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlowBean && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'FlowBean{name: $name, id: $id, flowStationList: $flowStationList}';
  }
}

class FlowStationBean {
  String name;
  double lng;
  double lat;
  int id;

  FlowStationBean({this.name, this.lng, this.lat, this.id});

  FlowStationBean.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.lng = json['lng'];
    this.lat = json['lat'];
    this.id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['lng'] = this.lng;
    data['lat'] = this.lat;
    data['id'] = this.id;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlowStationBean &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return '$name';
  }
}
