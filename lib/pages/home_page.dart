import 'package:balon_movie/dao/home_dao.dart';
import 'package:balon_movie/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:balon_movie/config/custom_icon.dart';
import 'package:balon_movie/widget/home/home_swiper.dart';
import 'package:balon_movie/widget/home/home_nav.dart';
import 'package:balon_movie/widget/home/home_recommend.dart';

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

  Future<Null> _handleRefresh() async {
    await HomeDao.getHomeData().then((value) {
      setState(() {
        this.swiperList = value.homeCasual;
        this.guochanList = value.guochan;
        this.jingpinList = value.jingpin;
        this.wumaList = value.wuma;
        this.shunvList = value.shunv;
        this.katongList = value.katong;
        this.hanguoList = value.lunli;
        this.zhongwenList = value.zhongwen;
        this.yazhouList = value.yazhou;
        this.oumeiList = value.oumei;
      });
    }).catchError((e) {
      throw Exception(e.toString());
    });
    return null;
  }

  @override
  void initState() {
    _handleRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/home/bg_login.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _appBar,
          body: FutureBuilder<dynamic>(
              initialData: HomeDao.getHomeData(),
              future: HomeDao.getHomeData(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return new Text(
                        'Press button to start'); //如果_calculation未执行则提示：请点击开始
                  case ConnectionState.waiting:
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 7),
                        Text(
                          "加载中...",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    )); //如果_calculation正在执行则提示：加载中
                  case ConnectionState.done: //如果_calculation执行完毕
                    if (snapshot.hasError) //若_calculation执行出现异常
                      return new Text('Error: ${snapshot.error}');
                    else //若_calculation执行正常完成
                      return RefreshIndicator(
                        onRefresh: _handleRefresh, //下拉刷新
                        child: _listView,
                      );
                    break;
                  default:
                    return null;
                }
              }),
        ));
  }

  Widget get _appBar {
    return AppBar(
      elevation: 0, //appbar的阴影
      backgroundColor: Colors.transparent,
      leading: IconButton(
          icon: Image.asset(
            'assets/images/dragon.png',
            fit: BoxFit.fill,
            height: 45,
            width: 45,
          ),
          onPressed: null),
      title: Container(
          height: 30,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
              color: Color(0x33bdc3c7),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Icon(Icons.search, size: 20, color: Colors.white),
              Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 11),
                        border: InputBorder.none,
                        hintText: "小泽玛利亚",
                        hintStyle:
                            TextStyle(fontSize: 15, color: Colors.white70)),
                  ))
            ],
          )),
      actions: [
        IconButton(
            icon: Icon(
              CustomIcon.download,
              color: Colors.white,
            ),
            onPressed: null),
        IconButton(
          icon: Icon(
            CustomIcon.history,
            color: Colors.white,
          ),
          onPressed: null,
        )
      ],
    );
  }

  Widget get _listView {
    return ListView(
      children: [
        HomeSwiper(casualList: this.swiperList),
        HomeNav(),
        HomeRecommend(list: this.jingpinList, title: "精品推荐"),
        HomeRecommend(list: this.guochanList, title: "国产情色"),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
          child: Image.asset("assets/images/home/banner_look.png"),
        ),
        HomeRecommend(list: this.wumaList, title: "无码专区"),
        HomeRecommend(list: this.yazhouList, title: "亚洲有码"),
        HomeRecommend(list: this.zhongwenList, title: "中文字幕"),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
          child: Image.asset("assets/images/home/box_banner.png"),
        ),
        HomeRecommend(list: this.hanguoList, title: "经典伦理"),
        HomeRecommend(list: this.katongList, title: "成人动漫"),
        HomeRecommend(list: this.shunvList, title: "熟女人妻"),
        HomeRecommend(list: this.oumeiList, title: "欧美性爱"),
      ],
    );
  }
}
