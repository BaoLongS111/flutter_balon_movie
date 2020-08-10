import 'package:flutter/material.dart';

class HotPage extends StatefulWidget {
  HotPage({Key key}) : super(key: key);

  @override
  _HotPageState createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("暴龙视频"),
      ),
      body: Center(
        child: Text("热点"),
      ),
    );
  }
}
