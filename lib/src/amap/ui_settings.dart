class UiSettings {
  int logoPosition;
  int zoomPosition;
  bool compassEnabled;
  bool gestureScaleByMapCenter;
  bool indoorSwitchEnabled;
  bool myLocationButtonEnabled;
  bool rotateGesturesEnabled;
  bool scaleControlsEnabled;
  bool scrollGesturesEnabled;
  bool tiltGesturesEnabled;
  bool zoomControlsEnabled;
  bool zoomGesturesEnabled;
  bool allGesturesEnabled;

  UiSettings({
    this.logoPosition,
    this.zoomPosition,
    this.compassEnabled,
    this.gestureScaleByMapCenter,
    this.indoorSwitchEnabled,
    this.myLocationButtonEnabled,
    this.rotateGesturesEnabled,
    this.scaleControlsEnabled,
    this.scrollGesturesEnabled,
    this.tiltGesturesEnabled,
    this.zoomControlsEnabled,
    this.zoomGesturesEnabled,
    this.allGesturesEnabled,
  });

  Map<String, dynamic> toJson() {
    return {
      'logoPosition': this.logoPosition,
      'zoomPosition': this.zoomPosition,
      'compassEnabled': this.compassEnabled,
      'gestureScaleByMapCenter': this.gestureScaleByMapCenter,
      'indoorSwitchEnabled': this.indoorSwitchEnabled,
      'myLocationButtonEnabled': this.myLocationButtonEnabled,
      'rotateGesturesEnabled': this.rotateGesturesEnabled,
      'scaleControlsEnabled': this.scaleControlsEnabled,
      'scrollGesturesEnabled': this.scrollGesturesEnabled,
      'tiltGesturesEnabled': this.tiltGesturesEnabled,
      'zoomControlsEnabled': this.zoomControlsEnabled,
      'zoomGesturesEnabled': this.zoomGesturesEnabled,
      'allGesturesEnabled': this.allGesturesEnabled,
    };
  }

  factory UiSettings.fromJson(Map<String, dynamic> map) {
    return new UiSettings(
      logoPosition: map['logoPosition'] as int,
      zoomPosition: map['zoomPosition'] as int,
      compassEnabled: map['compassEnabled'] as bool,
      gestureScaleByMapCenter: map['gestureScaleByMapCenter'] as bool,
      indoorSwitchEnabled: map['indoorSwitchEnabled'] as bool,
      myLocationButtonEnabled: map['myLocationButtonEnabled'] as bool,
      rotateGesturesEnabled: map['rotateGesturesEnabled'] as bool,
      scaleControlsEnabled: map['scaleControlsEnabled'] as bool,
      scrollGesturesEnabled: map['scrollGesturesEnabled'] as bool,
      tiltGesturesEnabled: map['tiltGesturesEnabled'] as bool,
      zoomControlsEnabled: map['zoomControlsEnabled'] as bool,
      zoomGesturesEnabled: map['zoomGesturesEnabled'] as bool,
      allGesturesEnabled: map['allGesturesEnabled'] as bool,
    );
  }
}
