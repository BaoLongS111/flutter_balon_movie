import 'package:flutter/material.dart';
import 'package:balon_movie/config/custom_icon.dart';
import 'package:balon_movie/widget/home/home_swiper.dart';

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
        leading: Image.asset('assets/images/dragon.png'),
        title: Text("暴龙视频"),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
              icon: Icon(
                CustomIcon.download,
                color: Colors.white,
              ),
              onPressed: null),
          IconButton(
            icon: Icon(CustomIcon.history, color: Colors.white),
            onPressed: null,
          )
        ],
      ),
      body: Column(
        children: [
          HomeSwiper(),
        ],
      ),
    );
  }
}
