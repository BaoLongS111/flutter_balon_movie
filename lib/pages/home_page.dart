import 'dart:async';
import 'package:flutter/material.dart';
import 'package:balon_movie/common/loading/loading_indicator.dart';
import 'package:balon_movie/common/utils/screen_adaper.dart';
import 'package:balon_movie/dao/home_dao.dart';
import 'package:balon_movie/model/home_model.dart';
import 'package:balon_movie/widget/home/home_swiper.dart';
import 'package:balon_movie/widget/home/home_nav.dart';
import 'package:balon_movie/widget/home/home_recommend.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  // Future<HomeModel> _future; //keepAlive
  bool isFirstLoad = true; //是否第一次加载，第一次显示loadingView，否则不显示
  //首页数据
  HomeModel homeModel;
  //视频数据
  // List<List> videoList = [];
  //上次刷新时间
  DateTime lastRefresh;
  //类型列表
  List type = [
    "国产情色",
    "精品推荐",
    "无码专区",
    "熟女人妻",
    "卡通动画",
    "韩国伦理",
    "中文字幕",
    "亚洲有码",
    "欧美性爱"
  ];

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      HomeDao.getHomeData().then((value) {
        setState(() {
          homeModel = value;
          // videoList[0] = homeModel.guochan;
          // videoList[1] = homeModel.jingpin;
          // videoList[2] = homeModel.wuma;
          // videoList[3] = homeModel.shunv;
          // videoList[4] = homeModel.katong;
          // videoList[5] = homeModel.lunli;
          // videoList[6] = homeModel.zhongwen;
          // videoList[7] = homeModel.yazhou;
          // videoList[8] = homeModel.oumei;
          isFirstLoad = false;
        });
      });
    });
  }

  @override
  void initState() {
    _handleRefresh();
    // _future = HomeDao.getHomeData(); //配合keepAlive使用
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdaper.init(context); //初始化屏幕比例
    super.build(context); //配合keepAlive使用
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/home/bg_login.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _appBar,
          body: FutureBuilder<HomeModel>(
              future: HomeDao.getHomeData(),
              builder:
                  (BuildContext context, AsyncSnapshot<HomeModel> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return isFirstLoad ? _loading() : _listView();
                    break;
                  case ConnectionState.done: //如果执行完毕
                    if (snapshot.hasError) //若执行出现异常
                      return Center(
                        child: Text("数据请求失败，请重新启动！"),
                      );
                    else //若执行正常完成
                      return homeModel != null ? _listView() : _loading();
                    //这里又做了一层的数据请求判断，因为是异步的
                    break;
                  default:
                    return null;
                    break;
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
            height: ScreenAdaper.setWidth(120),
            width: ScreenAdaper.setWidth(120),
          ),
          onPressed: null),
      title: Container(
        height: ScreenAdaper.setHeight(80),
        padding: EdgeInsets.fromLTRB(
            ScreenAdaper.setHeight(30), 0, ScreenAdaper.setHeight(30), 0),
        decoration: BoxDecoration(
            color: Color(0x33bdc3c7), borderRadius: BorderRadius.circular(15)),
        child: TextField(
          autofocus: false,
          minLines: 1,
          enableInteractiveSelection: false,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            prefixIcon: IconButton(
                icon: Image.asset(
                  "assets/images/global/icon_search.png",
                  fit: BoxFit.fill,
                ),
                onPressed: null),
            contentPadding: EdgeInsets.all(0),

            //enableBorder 和focusedBorder是为了hintText和icon居中对齐
            enabledBorder: OutlineInputBorder(
              /*边角*/
              borderRadius: BorderRadius.circular(
                ScreenAdaper.setWidth(30),
              ),
              borderSide: BorderSide(
                color: Colors.transparent, //边线颜色为透明
                width: 1, //边线宽度为2
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent, //边框颜色为透明
                width: 1, //宽度为5
              ),
              borderRadius: BorderRadius.circular(
                ScreenAdaper.setWidth(30),
              ),
            ),
            border: InputBorder.none,
            hintText: "小泽玛利亚",
            hintStyle: TextStyle(
              fontSize: ScreenAdaper.setSp(38),
              color: Colors.white70,
              textBaseline: TextBaseline.alphabetic,
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
            icon: Image.asset(
              "assets/images/home/icon_download.png",
              fit: BoxFit.fill,
            ),
            onPressed: null),
        IconButton(
          icon: Image.asset(
            "assets/images/home/icon_look_record.png",
            fit: BoxFit.fill,
          ),
          onPressed: null,
        )
      ],
    );
  }

  Widget _listView() {
    return EasyRefresh(
      header: ClassicalHeader(
          bgColor: Colors.black87,
          textColor: Colors.white,
          showInfo: true,
          noMoreText: '没有更多数据',
          refreshText: "下拉刷新",
          refreshReadyText: "释放立即刷新",
          refreshingText: "正在刷新",
          refreshedText: "刷新成功",
          infoText: "上次更新：" +
              DateTime.now().hour.toString() +
              ":" +
              DateTime.now().minute.toString(),
          infoColor: Colors.white70),
      onRefresh: _handleRefresh,
      child: ListView(
        children: [
          HomeSwiper(casualList: this.homeModel.homeCasual),
          HomeNav(),
          HomeRecommend(list: this.homeModel.jingpin, title: "精品推荐"),
          HomeRecommend(list: this.homeModel.guochan, title: "国产情色"),
          Padding(
            padding: EdgeInsets.fromLTRB(
              ScreenAdaper.setHeight(20),
              ScreenAdaper.setHeight(8),
              ScreenAdaper.setHeight(20),
              ScreenAdaper.setHeight(20),
            ),
            child: Image.asset("assets/images/home/banner_look.png"),
          ),
          HomeRecommend(list: this.homeModel.wuma, title: "无码专区"),
          HomeRecommend(list: this.homeModel.yazhou, title: "亚洲有码"),
          HomeRecommend(list: this.homeModel.zhongwen, title: "中文字幕"),
          Padding(
            padding: EdgeInsets.fromLTRB(
              ScreenAdaper.setHeight(20),
              ScreenAdaper.setHeight(8),
              ScreenAdaper.setHeight(20),
              ScreenAdaper.setHeight(20),
            ),
            child: Image.asset("assets/images/home/box_banner.png"),
          ),
          HomeRecommend(list: this.homeModel.lunli, title: "经典伦理"),
          HomeRecommend(list: this.homeModel.katong, title: "成人动漫"),
          HomeRecommend(list: this.homeModel.shunv, title: "熟女人妻"),
          HomeRecommend(list: this.homeModel.oumei, title: "欧美性爱"),
        ],
      ),
    );
  }

  //加载组件
  Widget _loading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BallPulseSyncIndicator(
            ballColor: Colors.purpleAccent,
          ),
          Text(
            "加载中...",
            style: TextStyle(
              fontSize: ScreenAdaper.setSp(38),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
