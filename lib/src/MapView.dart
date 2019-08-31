import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../amap.dart';
import 'MapViewController.dart';

class MapView extends StatefulWidget {
  final MapViewController controller;

  const MapView({Key key, this.controller}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  BasicMessageChannel _basicMessageChannel;

  @override
  void dispose() {
    widget.controller?.bindMessageChannel(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: AMap.mapViewType,
        onPlatformViewCreated: _initMessageChannel,
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: AMap.mapViewType,
        onPlatformViewCreated: _initMessageChannel,
      );
    } else {
      return Text(
        '$defaultTargetPlatform 暂时不支持地图',
      );
    }
  }

  void _initMessageChannel(int id) {
    _basicMessageChannel =
        BasicMessageChannel("${AMap.mapViewType}/map$id", StringCodec());
    print("message channel created with id: $id");
    widget.controller?.bindMessageChannel(_basicMessageChannel);
  }
}
