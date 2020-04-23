import 'package:amap_example/MapPage.dart';
import 'package:amap_example/stories/transport/transport_main_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('高德地图Flutter Plugin'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              shape: StadiumBorder(),
              color: Colors.purple,
              textColor: Colors.white,
              child: Text("高德地图"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (c) => MapPage()));
              },
            ),
            RaisedButton(
              child: Text("代办派车"),
              shape: StadiumBorder(),
              color: Colors.amber,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context)
                    .push(
                    MaterialPageRoute(builder: (c) => TransportMainPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
