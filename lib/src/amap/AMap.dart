import 'model/model.dart';

///地图状态发生变化的监听接口。
///当调用AMap.animateCamera(CameraUpdate)、AMap.moveCamera(CameraUpdate)及手势操作地图时会触发该回调。
class OnCameraChangeListener {
  ///在地图状态改变过程中回调此方法。
  ///position - 一个cameraPosition对象，表示地图的当前状态。
  void onCameraChange(CameraPosition position) {}

  ///在地图状态改变完成时回调此方法。
  ///position - 一个cameraPosition对象，表示地图的当前状态。
  void onCameraChangeFinish(CameraPosition position) {}
}

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
}
