class MapClickedEvent {
  double latitude;
  double longitude;

  MapClickedEvent({this.latitude, this.longitude});

  MapClickedEvent.fromJson(Map<String, dynamic> json) {
    this.latitude = json['latitude'];
    this.longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }

  @override
  String toString() {
    return 'MapClickedEvent{latitude: $latitude, longitude: $longitude}';
  }
}
