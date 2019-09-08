import 'package:amap_example/repository/transport/bean/RegionItemBean.dart';
import 'package:flutter/material.dart';

class RegionNavigationWidget extends StatefulWidget {
  final List<RegionBean> regions;

  const RegionNavigationWidget({Key key, this.regions}) : super(key: key);

  @override
  _RegionNavigationWidgetState createState() =>
      new _RegionNavigationWidgetState();
}

class _RegionNavigationWidgetState extends State<RegionNavigationWidget> {
  List<RegionBean> get regions => widget.regions;

  RegionBean currentRegion;
  FlowBean currentFlow;

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
  void initState() {
    currentRegion = regions.first;
    currentFlow = currentRegion?.flowList?.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 240),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ListView(
              shrinkWrap: true,
              children: regions.map((region) {
                return Container(
                  height: 30,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  color: region == currentRegion
                      ? Colors.white
                      : Colors.transparent,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${region.name} (${region.flowCount})",
                      style: _style1,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  height: 30,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 8),
                        Text(
                          "共${currentRegion.coalpitCount}个煤矿、${currentRegion.flowCount}条线路",
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
                ),
                for (var flow in currentRegion.flowList)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${flow.name} - ${flow.flowStationList.join(" - ")}",
                        style: flow == currentFlow ? _style4 : _style1,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
