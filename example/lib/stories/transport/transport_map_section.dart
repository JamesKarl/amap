import 'dart:collection';

import 'package:amap/amap.dart';
import 'package:flutter/material.dart';

class TransportMapSection extends StatefulWidget {
  @override
  _TransportMapSectionState createState() => new _TransportMapSectionState();
}

class _TransportMapSectionState extends State<TransportMapSection> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        MapView(),
      ],
    );
  }
}
