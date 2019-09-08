import 'package:amap_example/repository/transport/bean/RegionItemBean.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'transport_model.dart';

class RegionNavigationWidget extends StatefulWidget {
  final List<RegionBean> regions;

  const RegionNavigationWidget({Key key, this.regions}) : super(key: key);

  @override
  _RegionNavigationWidgetState createState() =>
      new _RegionNavigationWidgetState();
}

class _RegionNavigationWidgetState extends State<RegionNavigationWidget> {
  List<RegionBean> get regions => widget.regions;

  static const _style1 = TextStyle(
    fontSize: 15,
    color: const Color(0xff252525),
  );
  static const _style2 = TextStyle(
    fontSize: 15,
    color: const Color(0xff999999),
  );
  static const _style3 = TextStyle(
    fontSize: 14,
    color: const Color(0xff666666),
  );
  static const _style4 = TextStyle(
    fontSize: 14,
    color: const Color(0xff1890FF),
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<TransportModel>(
      builder: (BuildContext context, TransportModel model, Widget child) {
        if (model.expanded == false) return Offstage();
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 240),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: buildLeftSection(model),
              ),
              Expanded(
                flex: 3,
                child: buildRightSection(model),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildRightSection(TransportModel model) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        buildRightSectionHeader(model),
        if (model.currentRegion?.flowList?.isNotEmpty == true)
          for (var flow in model.currentRegion?.flowList)
            buildRightListItem(flow, model),
      ],
    );
  }

  InkWell buildRightListItem(FlowBean flow, TransportModel model) {
    return InkWell(
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        color: Colors.white,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "${flow.name} - ${flow.flowStationList.join(" - ")}",
            style: flow == model.currentFlow ? _style4 : _style3,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          model.currentFlow = flow;
        });
      },
    );
  }

  Widget buildRightSectionHeader(TransportModel model) {
    return Container(
      color: Colors.white,
      height: 40,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            SizedBox(width: 8),
            Text(
              "共${model.currentRegion?.coalpitCount ?? "--"}个煤矿、${model.currentRegion?.flowCount ?? '--'}条线路",
              style: _style2,
            ),
            Spacer(),
            Icon(
              Icons.keyboard_arrow_right,
              color: Color(0xff999999),
            )
          ],
        ),
      ),
    );
  }

  Widget buildLeftSection(TransportModel model) {
    return ListView(
      shrinkWrap: true,
      children: regions.map((region) {
        return buildLeftListItem(region, model);
      }).toList(),
    );
  }

  InkWell buildLeftListItem(RegionBean region, TransportModel model) {
    return InkWell(
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 8),
        color:
            region == model.currentRegion ? Colors.white : Colors.transparent,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "${region.name} (${region.flowCount})",
            style: _style1,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          model.currentRegion = region;
        });
      },
    );
  }
}
