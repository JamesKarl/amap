import 'dart:collection';

import 'package:amap/amap.dart';
import 'package:amap_example/dummy_data.dart';
import 'package:amap_example/repository/transport/bean/RegionItemBean.dart';
import 'package:amap_example/stories/transport/transport_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransportMapSection extends StatefulWidget {
  @override
  _TransportMapSectionState createState() => _TransportMapSectionState();
}

class _TransportMapSectionState extends State<TransportMapSection>
    implements MapEventListener {
  MapViewController mapViewController;
  TransportModel model;

  ValueNotifier<RegionBean> currentRegion = ValueNotifier(null);
  ValueNotifier<FlowBean> currentFlow = ValueNotifier(null);

  @override
  void initState() {
    mapViewController = MapViewController(this);
    currentRegion.addListener(() {
      final region = currentRegion.value;
      print("region: $region");
      if (region != null) {
        onRegionUpdated(region);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    model = Provider.of<TransportModel>(context);
    return MapView(
      controller: mapViewController,
    );
  }

  @override
  void onCameraChange(CameraPosition cameraPosition) {
    // TODO: implement onCameraChange
  }

  @override
  void onCameraChangeFinish(CameraPosition cameraPosition) {
    // TODO: implement onCameraChangeFinish
  }

  @override
  void onInfoWindowClicked(MarkerOptions marker) {
    // TODO: implement onInfoWindowClicked
  }

  @override
  void onMapClicked(MapClickedEvent event) {
    // TODO: implement onMapClicked
  }

  @override
  void onMapLoaded() {
    print("onMapLoaded model  $model-> ${model?.currentRegion}");
    model?.addListener(() {
      currentRegion.value = model?.currentRegion;
      currentFlow.value = model?.currentFlow;
    });
  }

  @override
  void onMarkerClicked(MarkerOptions marker) {
    // TODO: implement onMarkerClicked
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

  void onRegionUpdated(RegionBean region) async {
    final regionCenter = LatLng(region.lat, region.lng);
    await mapViewController.clear();
    await mapViewController.newLatLngZoom(regionCenter, 11);
    await mapViewController.addCircle(
      CircleOptions(
        center: regionCenter,
        radius: 2000,
        fillColor: Color(0xffF8E0D0).value,
        strokeColor: Color(0xfffa8c16).value,
        strokeWidth: 8,
      ),
    );
    await mapViewController
        .addMarkers(DummyData.createMarkerListData(region.getAllPoints()));
    region.flowList?.forEach((flow) async {
      final points =
      flow.flowStationList.map((p) => LatLng(p.lat, p.lng)).toList();
      points.insert(0, regionCenter);
      final polyline = DummyData.createPolyline(points);
      await mapViewController.addPolyline(polyline);
    });
  }
}
