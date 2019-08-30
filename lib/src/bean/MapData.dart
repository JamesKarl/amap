class MapPoint {
  final double longitude;
  final double latitude;

  MapPoint({this.longitude, this.latitude});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }
}
