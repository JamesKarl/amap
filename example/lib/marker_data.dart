class MarkerExtraData {
  int id;
  String name;

  MarkerExtraData({this.id, this.name});

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
    };
  }

  factory MarkerExtraData.fromJson(Map<String, dynamic> map) {
    return new MarkerExtraData(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }
}
