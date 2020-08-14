import 'package:flutter/material.dart';
import 'package:balon_movie/config/custom_icon.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        leading: Icon(CustomIcon.category),
        title: Text("暴龙视频"),
      ),
      body: Center(
        child: Text("首页"),
      ),
    );
  }
}
