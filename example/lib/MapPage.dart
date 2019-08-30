import 'package:amap/amap.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> implements MapEventListener {
  MapViewController mapViewController;

  @override
  void initState() {
    mapViewController = MapViewController(this);
    super.initState();
  }

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

  @override
  void onMapClicked(MapClickedEvent event) {
    // TODO: implement onMapClicked
  }

  @override
  void onMapLoaded() {
    // TODO: implement onMapLoaded
  }

  @override
  void onMarkerClicked() {
    // TODO: implement onMarkerClicked
  }
}
