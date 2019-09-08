import 'package:flutter/material.dart';

class TransportIntroductionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text("海量车源，实时调度"),
        Text("基于线下门店网络，根据客户需求快速调车"),
        Placeholder(fallbackHeight: 200),
      ],
    );
  }
}
