class MarkerData {
  final String id;
  final String title;
  final String snippet;

  MarkerData(this.id, {this.title, this.snippet});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['snippet'] = snippet;
    return data;
  }
}
