import 'package:amap_example/repository/apis.dart';
import 'package:amap_example/repository/request_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'region_navigation_widget.dart';

class TransportBottomSection extends StatefulWidget {
  @override
  _TransportBottomSectionState createState() => _TransportBottomSectionState();
}

class _TransportBottomSectionState extends State<TransportBottomSection> {
  Future<ApiResult> _future;

  @override
  void initState() {
    _future = bussApis.fetchRegionList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: const Color(0xfff7f7f7),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 28,
                    color: Colors.white,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xffbfbfbf),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 12),
            Text(
              "41条精品运力池线路，保障充足运力",
              style: TextStyle(
                color: Color(0xffFA8C16),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "专业坑口代发、代客叫车，省钱又省心",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 14,
              ),
            ),
            SizedBox(height: 12),
            FutureBuilder(
              future: _future,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error?.toString()}");
                } else if (snapshot.hasData) {
                  final data = snapshot.data as ApiResult;
                  if (data.success()) {
                    return RegionNavigationWidget(regions: data.data);
                  } else {
                    return Text("${data.message()}");
                  }
                } else {
                  return CupertinoActivityIndicator();
                }
              },
            )
          ],
        );
      },
      onClosing: () {},
    );
  }
}
