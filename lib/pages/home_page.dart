import 'package:flutter/material.dart';
import 'package:balon_movie/config/custom_icon.dart';
import 'package:balon_movie/widget/home/home_swiper.dart';
import 'package:balon_movie/widget/home/home_nav.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/home/bg_login.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0, //appbar的阴影
          backgroundColor: Colors.transparent,
          leading: Container(
            width: 45,
            height: 45,
            child: Image.asset(
              'assets/images/dragon.png',
              fit: BoxFit.fill,
              height: 45,
              width: 45,
            ),
          ),
          title: Text("暴龙视频"),
          actions: [
            IconButton(
                icon: Icon(
                  CustomIcon.download,
                  color: Colors.white70,
                ),
                onPressed: null),
            IconButton(
              icon: Icon(CustomIcon.history, color: Colors.white70),
              onPressed: null,
            )
          ],
        ),
        body: Column(
          children: [HomeSwiper(), HomeNav()],
        ),
      ),
    );
  }
}
