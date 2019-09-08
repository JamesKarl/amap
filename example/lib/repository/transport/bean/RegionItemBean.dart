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
}
