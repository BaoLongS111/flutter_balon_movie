import 'package:balon_movie/dao/home_dao.dart';
import 'package:flutter/material.dart';
import 'package:balon_movie/config/custom_icon.dart';
import 'package:balon_movie/widget/home/home_swiper.dart';
import 'package:balon_movie/widget/home/home_nav.dart';
import 'package:balon_movie/widget/home/home_recommend.dart';
import 'package:balon_movie/widget/home/loading_container.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List swiperList = [];
  List guochanList = [];
  List jingpinList = [];
  List wumaList = [];
  List yazhouList = [];
  List zhongwenList = [];
  List hanguoList = [];
  List katongList = [];
  List shunvList = [];
  List oumeiList = [];

  loadData() async {
    await HomeDao.getHomeData().then((value) {
      setState(() {
        this.swiperList = value[0];
        this.guochanList = value[1];
        this.jingpinList = value[2];
        this.wumaList = value[3];
        this.shunvList = value[4];
        this.katongList = value[5];
        this.hanguoList = value[6];
        this.zhongwenList = value[7];
        this.yazhouList = value[8];
        this.oumeiList = value[9];
      });
    }).catchError((e) {
      throw Exception(e.toString());
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HomeDao.getHomeData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
                leading: Image.asset(
                  'assets/images/dragon.png',
                  fit: BoxFit.fill,
                  height: 45,
                  width: 45,
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
                    icon: Icon(
                      CustomIcon.history,
                      color: Colors.white70,
                    ),
                    onPressed: null,
                  )
                ],
              ),
              body: ListView(
                children: [
                  HomeSwiper(casualList: this.swiperList),
                  HomeNav(),
                  HomeRecommend(list: this.jingpinList, title: "精品推荐"),
                  HomeRecommend(list: this.guochanList, title: "国产情色"),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                    child: Image.asset("assets/images/home/banner_look.png"),
                  )),
                  HomeRecommend(list: this.wumaList, title: "无码专区"),
                  HomeRecommend(list: this.yazhouList, title: "亚洲有码"),
                  HomeRecommend(list: this.zhongwenList, title: "中文字幕"),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                    child: Image.asset("assets/images/home/box_banner.png"),
                  )),
                  HomeRecommend(list: this.hanguoList, title: "经典伦理"),
                  HomeRecommend(list: this.katongList, title: "成人动漫"),
                  HomeRecommend(list: this.shunvList, title: "熟女人妻"),
                  HomeRecommend(list: this.oumeiList, title: "欧美性爱"),
                ],
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
