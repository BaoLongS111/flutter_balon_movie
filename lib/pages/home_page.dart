import 'dart:async';
import 'package:balon_movie/common/loading/loading_indicator.dart';
import 'package:balon_movie/common/utils/screen_adaper.dart';
import 'package:balon_movie/dao/home_dao.dart';
import 'package:balon_movie/model/home_casual.dart';
import 'package:balon_movie/model/home_model.dart';
import 'package:balon_movie/model/home_recommend_model.dart';
import 'package:flutter/material.dart';
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
  List<HomeCasual> swiperList = [];
  List<HomeRecommendModel> guochanList = [];
  List<HomeRecommendModel> jingpinList = [];
  List<HomeRecommendModel> wumaList = [];
  List<HomeRecommendModel> yazhouList = [];
  List<HomeRecommendModel> zhongwenList = [];
  List<HomeRecommendModel> hanguoList = [];
  List<HomeRecommendModel> katongList = [];
  List<HomeRecommendModel> shunvList = [];
  List<HomeRecommendModel> oumeiList = [];

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      HomeDao.getHomeData().then((value) {
        setState(() {
          var data = value;
          isFirstLoad = false;
          this.swiperList = data.homeCasual;
          this.guochanList = data.guochan;
          this.jingpinList = data.jingpin;
          this.wumaList = data.wuma;
          this.shunvList = data.shunv;
          this.katongList = data.katong;
          this.hanguoList = data.lunli;
          this.zhongwenList = data.zhongwen;
          this.yazhouList = data.yazhou;
          this.oumeiList = data.oumei;
        });
      });
    });
  }

  //上次刷新时间
  DateTime lastRefresh;
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
                    if (isFirstLoad) {
                      return Center(
                        child: BallPulseSyncIndicator(
                          ballColor: Colors.purpleAccent,
                        ),
                      );
                    } else {
                      return _listView;
                    }
                    break;
                  case ConnectionState.done: //如果执行完毕
                    if (snapshot.hasError) //若执行出现异常
                      return new Text('Error: ${snapshot.error}');
                    else //若执行正常完成
                      return _listView;
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
              fontSize: ScreenAdaper.setSp(38, allowFontScalingSelf: false),
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

  Widget get _listView {
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeSwiper(casualList: this.swiperList),
            HomeNav(),
            HomeRecommend(list: this.jingpinList, title: "精品推荐"),
            HomeRecommend(list: this.guochanList, title: "国产情色"),
            Padding(
              padding: EdgeInsets.fromLTRB(
                ScreenAdaper.setHeight(20),
                ScreenAdaper.setHeight(8),
                ScreenAdaper.setHeight(20),
                ScreenAdaper.setHeight(20),
              ),
              child: Image.asset("assets/images/home/banner_look.png"),
            ),
            HomeRecommend(list: this.wumaList, title: "无码专区"),
            HomeRecommend(list: this.yazhouList, title: "亚洲有码"),
            HomeRecommend(list: this.zhongwenList, title: "中文字幕"),
            Padding(
              padding: EdgeInsets.fromLTRB(
                ScreenAdaper.setHeight(20),
                ScreenAdaper.setHeight(8),
                ScreenAdaper.setHeight(20),
                ScreenAdaper.setHeight(20),
              ),
              child: Image.asset("assets/images/home/box_banner.png"),
            ),
            HomeRecommend(list: this.hanguoList, title: "经典伦理"),
            HomeRecommend(list: this.katongList, title: "成人动漫"),
            HomeRecommend(list: this.shunvList, title: "熟女人妻"),
            HomeRecommend(list: this.oumeiList, title: "欧美性爱"),
          ],
        ),
      ),
    );
  }
}
