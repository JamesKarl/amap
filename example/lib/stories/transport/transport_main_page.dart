import 'package:amap_example/stories/transport/transport_bottom_section.dart';
import 'package:amap_example/stories/transport/transport_introduction_section.dart';
import 'package:amap_example/stories/transport/transport_map_section.dart';
import 'package:amap_example/stories/transport/transport_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransportMainPage extends StatefulWidget {
  @override
  _TransportMainPageState createState() => new _TransportMainPageState();
}

class _TransportMainPageState extends State<TransportMainPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  TransportModel model;
  final tabs = ["代办派车", "业务介绍"];

  bool showBottomSheet = true;

  @override
  void initState() {
    model = TransportModel();
    tabController = TabController(vsync: this, length: tabs.length);
    tabController.addListener(() {
      setState(() {
        showBottomSheet = tabController.index == 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: model,
      child: Scaffold(
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomAppBar(),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(child: TransportMapSection()),
                SizedBox(height: 90),
              ],
            ),
            if (showBottomSheet == false)
              Container(
                child: TransportIntroductionSection(),
                color: Colors.white,
              ),
          ],
        ),
        bottomSheet: showBottomSheet ? TransportBottomSection() : Offstage(),
      ),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.phone_android,
                    color: const Color(0xffFA8C16),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "联系我们",
                    style:
                        TextStyle(color: const Color(0xffFA8C16), fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color(0xffFA8C16),
              height: 48,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "我要用车",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: SizedBox(
        width: 220,
        child: TabBar(
            controller: tabController,
            indicatorColor: const Color(0xffFA8C16),
            labelColor: const Color(0xffFA8C16),
            labelStyle: TextStyle(fontSize: 18),
            unselectedLabelColor: Colors.white,
            tabs: tabs.map((t) => Tab(text: t)).toList()),
      ),
      centerTitle: true,
    );
  }
}
