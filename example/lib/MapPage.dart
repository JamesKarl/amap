import 'dart:math';

import 'package:amap/amap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> implements MapEventListener {
  MapViewController mapViewController;
  bool mapLoaded = false;
  DateTime initAtTime;

  @override
  void initState() {
    mapViewController = MapViewController(this);
    initAtTime = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MAP"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          MapView(controller: mapViewController),
          if (mapLoaded == false)
            Container(
              color: Colors.white,
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 48,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.zoom_in),
                onPressed: () {
                  mapViewController.setCompassEnabled(true);
                },
              ),
              IconButton(
                icon: Icon(Icons.zoom_out),
                onPressed: () {
                  mapViewController.setCompassEnabled(false);
                },
              ),
            ],
          ),
        ),
      ),
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
    print(event);
    final option = MarkerOptions();
    option.position = LatLng(event.latitude, event.longitude);
    option.title = "Hello, world";
    option.snippet = "HaHA";
    option.rotateAngle = pi / 4;
    option..infoWindowEnable = true;
    option.draggable = true;
    option.flat = false;
    mapViewController.addMarker(option);
  }

  @override
  void onMapLoaded() {
    print(
        "load map consumed ${DateTime.now().millisecondsSinceEpoch - initAtTime.millisecondsSinceEpoch} ms");
    setState(() {
      mapLoaded = true;
    });
  }

  @override
  void onMarkerClicked(MarkerOptions marker) {
    // TODO: implement onMarkerClicked
  }

  @override
  void onInfoWindowClicked(MarkerOptions marker) {
    // TODO: implement onInfoWindowClicked
  }

  @override
  void onMarkerDragEnd(MarkerOptions marker) {
    // TODO: implement onMarkerDragEnd
  }

  @override
  void onMarkerDragStart(MarkerOptions marker) {
    // TODO: implement onMarkerDragStart
  }

  @override
  void onMarkerDragged(MarkerOptions marker) {
    // TODO: implement onMarkerDragged
  }
}
