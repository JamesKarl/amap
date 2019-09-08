import 'package:flutter/material.dart';

class TransportIntroductionSection extends StatelessWidget {
  static const _styleTitle = TextStyle(
      fontSize: 20, color: Color(0xff666666), fontWeight: FontWeight.w600);

  static const _styleDescription = TextStyle(
    fontSize: 15,
    color: Color(0xff666666),
  );

  static const _styleNumber = TextStyle(
    fontSize: 26,
    color: Color(0xffFA8C16),
    fontWeight: FontWeight.bold,
  );
  static const _styleNote = TextStyle(
    fontSize: 13,
    color: Color(0xff666666),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "海量车源，实时调度",
              style: _styleTitle,
            ),
            SizedBox(height: 8),
            Text(
              "基于线下门店网络，根据客户需求快速调车",
              style: _styleDescription,
            ),
            SizedBox(height: 16),
            Image.asset("assets/icons/img_che.png"),
            SizedBox(height: 16),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "113596",
                        style: _styleNumber,
                      ),
                      SizedBox(height: 12),
                      Text(
                        "注册车辆",
                        style: _styleNote,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "26978",
                        style: _styleNumber,
                      ),
                      SizedBox(height: 12),
                      Text(
                        "活跃车辆",
                        style: _styleNote,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "11869",
                        style: _styleNumber,
                      ),
                      SizedBox(height: 12),
                      Text(
                        "可控运力",
                        style: _styleNote,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Divider(height: 24),
            Text(
              "线下品牌门店50余家",
              style: _styleTitle,
            ),
            SizedBox(height: 8),
            Text(
              "分布在内蒙、陕西、山西煤炭主产区",
              style: _styleDescription,
            ),
            SizedBox(height: 16),
            Image.asset("assets/icons/img_mendian.png"),
            SizedBox(
              height: 16,
            ),
            Divider(height: 24),
            Text(
              "联系我们 ",
              style: _styleTitle,
            ),
            SizedBox(height: 8),
            Text(
              "运力主管：魏凯 18586157120",
              style: _styleDescription,
            ),
          ],
        ),
      ),
    );
  }
}
