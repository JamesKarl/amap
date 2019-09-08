import 'dart:collection';

import 'package:amap/amap.dart';
import 'package:amap_example/repository/apis.dart';
import 'package:amap_example/repository/request_result.dart';
import 'package:flutter/material.dart';

class TransportMapSection extends StatefulWidget {
  @override
  _TransportMapSectionState createState() => new _TransportMapSectionState();
}

class _TransportMapSectionState extends State<TransportMapSection> {
  Future<ApiResult> _future;

  @override
  void initState() {
    _future = bussApis.fetchRegionList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MapView(),
      ],
    );
  }
}
