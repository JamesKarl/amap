import 'package:amap/amap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dummy_data.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> implements MapEventListener {
  MapViewController mapViewController;
  bool mapLoaded = false;
  DateTime initAtTime;
  MapCreationParams creationParams;

  @override
  void initState() {
    creationParams = MapCreationParams(
      cameraPosition: CameraPosition(
        target: LatLng(30.506097, 114.379612),
        zoom: 15,
      ),
    );
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
          MapView(
            controller: mapViewController,
            creationParams: creationParams,
          ),
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
                  mapViewController.zoomIn();
                },
              ),
              IconButton(
                icon: Icon(Icons.zoom_out),
                onPressed: () {
                  mapViewController.zoomOut();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          mapViewController.getCenter().then((point) {
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
    //mapViewController.addMarker(DummyData.createMarkerData(event));
    final points = DummyData.createPoints(event.latitude, event.longitude, 10);

    //add center marker
    mapViewController.addMarker(MarkerOptions(title: "You clicked here"));
    //add markers
    final markers = DummyData.createMarkerListData(points);
    mapViewController.addMarkers(markers);

    //add circle
    points.forEach((p) {
      mapViewController
          .addCircle(DummyData.createCircle(p.latitude, p.longitude));
    });

    //add center circle
    final touchedCircle =
        DummyData.createCircle(event.latitude, event.longitude);
    touchedCircle
      ..fillColor = null
      ..radius = 30
      ..strokeDottedLineType = MapConstants.DOTTED_LINE_TYPE_CIRCLE;
    mapViewController.addCircle(touchedCircle);

    final polyline = DummyData.createPolyline(points);
    mapViewController.addPolyline(polyline);
  }

  @override
  void onMapLoaded() {
//    mapViewController.newLatLngZoom(LatLng(30.506097, 114.379612), 15);
//    mapViewController.setLogoPosition(LogoPosition.BOTTOM_CENTER);
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

  @override
  void onCameraChange(CameraPosition cameraPosition) {
    // TODO: implement onCameraChange
  }

  @override
  void onCameraChangeFinish(CameraPosition cameraPosition) {
    // TODO: implement onCameraChangeFinish
    print("onCameraChangeFinish: $cameraPosition");
  }
}
