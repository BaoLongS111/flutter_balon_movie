import 'package:balon_movie/dao/home_dao.dart';
import 'package:balon_movie/model/home_casual.dart';
import 'package:balon_movie/model/home_model.dart';
import 'package:balon_movie/model/home_recommend_model.dart';
import 'package:flutter/material.dart';
import 'package:balon_movie/config/custom_icon.dart';
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

  Future<HomeModel> _future; //keepAlive
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
    await HomeDao.getHomeData().then((value) {
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
  }

  @override
  void initState() {
    _handleRefresh();
    _future = HomeDao.getHomeData(); //配合keepAlive使用
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
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
              future: _future,
              builder:
                  (BuildContext context, AsyncSnapshot<HomeModel> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    if (isFirstLoad) {
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(height: 7),
                          Text(
                            "加载中...",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )
                        ],
                      ));
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
            infoColor: Colors.white70),
        onRefresh: _handleRefresh,
        child: ListView(
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
        ));
  }
}
