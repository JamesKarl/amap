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
    mapViewController.addMarker(
      MapPoint(latitude: event.latitude, longitude: event.longitude),
      MarkerData("23", title: "hello, world"),
    );
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
  void onMarkerClicked() {
    // TODO: implement onMarkerClicked
  }
}
