import 'dart:async';

import 'package:flutter/services.dart';

export 'src/MapView.dart';
export 'src/MapViewController.dart';
export 'src/MessageReply.dart';

class Amap {
  static const mapViewType = "com.jameskarl/mapView";
  static const channelName = "com.jameskarl/map";

  static const MethodChannel _channel = const MethodChannel(channelName);

  static Future<String> get platformVersion async {
    return _channel.invokeMethod('getPlatformVersion');
  }
}
