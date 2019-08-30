import 'package:flutter/material.dart';

import 'MapView.dart';
import 'MapViewController.dart';
import 'bean/MarkerData.dart';

class MapPage extends StatelessWidget {
  final MapViewController mapViewController = MapViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MAP"),
        centerTitle: true,
      ),
      body: MapView(controller: mapViewController),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          mapViewController.getCenterPoint().then((point) {
            if (point != null) {
              mapViewController.addMarker(
                  point, MarkerData("point", title: "SSSSSSS"));
            }
          });
        },
      ),
    );
  }
}
