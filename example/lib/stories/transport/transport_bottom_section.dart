import 'package:amap_example/repository/apis.dart';
import 'package:amap_example/repository/request_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'region_navigation_widget.dart';
import 'transport_model.dart';

class TransportBottomSection extends StatefulWidget {
  @override
  _TransportBottomSectionState createState() => _TransportBottomSectionState();
}

class _TransportBottomSectionState extends State<TransportBottomSection>
    with SingleTickerProviderStateMixin {
  Future<ApiResult> _future;

  double contentHeightMax;
  double contentHeightMin = 92;
  double contentHeight;

  bool get expanded => contentHeight > contentHeightMax * 0.6;

  @override
  void initState() {
    _future = bussApis.fetchRegionList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (contentHeightMax == null) {
      contentHeightMax = MediaQuery
          .of(context)
          .size
          .height * 0.4;
      contentHeight = contentHeightMax;
    }
    return GestureDetector(
      child: Container(
        height: contentHeight,
        child: buildBottomSheetContent(context),
        color: Color(0xfff7f7f7),
      ),
      onVerticalDragUpdate: (details) {
        setState(() {
          contentHeight -= details.delta.dy;
          if (contentHeight < contentHeightMin) {
            contentHeight = contentHeightMin;
          } else if (contentHeight > contentHeightMax) {
            contentHeight = contentHeightMax;
          }
        });
      },
      onVerticalDragEnd: (details) {
        setState(() {
          if (!expanded) {
            contentHeight = contentHeightMin;
          } else {
            contentHeight = contentHeightMax;
          }
        });
      },
    );
  }

  Column buildBottomSheetContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        buildTopArrowSection(context),
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
        Expanded(
          child: FutureBuilder(
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
          ),
        )
      ],
    );
  }

  Widget buildTopArrowSection(BuildContext context) {
    final model = Provider.of<TransportModel>(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          contentHeight = expanded ? contentHeightMin : contentHeightMax;
        });
      },
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 28,
              color: Colors.white,
              child: Icon(
                expanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                color: Color(0xffbfbfbf),
              ),
            ),
          )
        ],
      ),
    );
  }
}
