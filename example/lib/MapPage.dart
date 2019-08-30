import 'package:amap/amap.dart';
import 'package:flutter/material.dart';

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
              print("xxx $point");
            }
          });
        },
      ),
    );
  }
}
