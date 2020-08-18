import 'package:balon_movie/dao/home_dao.dart';
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
  List toupaiList = [];
  List jingpinList = [];
  List shaonvList = [];
  List wanghongList = [];
  List wumaList = [];
  List yazhouList = [];
  List zhongwenList = [];
  List siwaList = [];
  List nvtongList = [];
  List hanguoList = [];
  List katongList = [];
  List shunvList = [];
  List juruList = [];
  List oumeiList = [];
  List qiangjianList = [];
  List zhifuList = [];

  loadData() {
    HomeDao.getHomeToupai().then((value) {
      setState(() {
        this.toupaiList = value;
      });
    }).catchError((e) {
      throw Exception(e.toString());
    });

    HomeDao.getHomeJingPin().then((value) {
      setState(() {
        this.jingpinList = value;
      });
    }).catchError((e) {
      throw Exception(e.toString());
    });

    HomeDao.getHomeShaoNv().then((value) {
      setState(() {
        this.shaonvList = value;
      });
    }).catchError((e) {
      throw Exception(e.toString());
    });

    HomeDao.getHomeWangHong().then((value) {
      setState(() {
        this.wanghongList = value;
      });
    }).catchError((e) {
      throw Exception(e.toString());
    });

    HomeDao.getHomeWuMa().then((value) {
      setState(() {
        this.wumaList = value;
      });
    }).catchError((e) {
      throw Exception(e.toString());
    });

    HomeDao.getHomeYaZhou().then((value) {
      setState(() {
        this.yazhouList = value;
      });
    }).catchError((e) {
      throw Exception(e.toString());
    });

    HomeDao.getHomeZhongWen().then((value) {
      setState(() {
        this.zhongwenList = value;
      });
    }).catchError((e) {
      throw Exception(e.toString());
    });

    HomeDao.getHomeSiWa().then((value) {
      setState(() {
        this.siwaList = value;
      });
    }).catchError((e) {
      throw Exception(e.toString());
    });

    HomeDao.getHomeNvTong().then((value) {
      setState(() {
        this.nvtongList = value;
      });
    }).catchError((e) {
      throw Exception(e.toString());
    });

    HomeDao.getHomeHanGuo().then((value) {
      setState(() {
        this.hanguoList = value;
      });
    }).catchError((e) {
      throw Exception(e.toString());
    });

    HomeDao.getHomeKaTong().then((value) {
      setState(() {
        this.katongList = value;
      });
    }).catchError((e) {
      throw Exception(e.toString());
    });

    HomeDao.getHomeShuNv().then((value) {
      setState(() {
        this.shunvList = value;
      });
    }).catchError((e) {
      throw Exception(e.toString());
    });

    HomeDao.getHomeJuRu().then((value) {
      setState(() {
        this.juruList = value;
      });
    }).catchError((e) {
      throw Exception(e.toString());
    });

    HomeDao.getHomeOuMei().then((value) {
      setState(() {
        this.oumeiList = value;
      });
    }).catchError((e) {
      throw Exception(e.toString());
    });

    HomeDao.getHomeQiangJian().then((value) {
      setState(() {
        this.qiangjianList = value;
      });
    }).catchError((e) {
      throw Exception(e.toString());
    });

    HomeDao.getHomeZhiFu().then((value) {
      setState(() {
        this.zhifuList = value;
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
              icon: Icon(CustomIcon.history, color: Colors.white70),
              onPressed: null,
            )
          ],
        ),
        body: ListView(
          children: [
            HomeSwiper(),
            HomeNav(),
            HomeRecommend(list: this.jingpinList, title: "精品推荐"),
            HomeRecommend(list: this.toupaiList, title: "偷拍自拍"),
            Expanded(
                child: Padding(
              padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
              child: Image.asset("assets/images/home/banner_look.png"),
            )),
            HomeRecommend(list: this.shaonvList, title: "少女萝莉"),
            HomeRecommend(list: this.wanghongList, title: "网红主播"),
            HomeRecommend(list: this.wumaList, title: "无码专区"),
            HomeRecommend(list: this.yazhouList, title: "亚洲有码"),
            HomeRecommend(list: this.zhongwenList, title: "中文字幕"),
            Expanded(
                child: Padding(
              padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
              child: Image.asset("assets/images/home/box_banner.png"),
            )),
            HomeRecommend(list: this.siwaList, title: "丝袜长腿"),
            HomeRecommend(list: this.nvtongList, title: "女同性恋"),
            HomeRecommend(list: this.hanguoList, title: "韩国伦理"),
            HomeRecommend(list: this.katongList, title: "卡通动画"),
            HomeRecommend(list: this.shunvList, title: "熟女人妻"),
            HomeRecommend(list: this.juruList, title: "巨乳美乳"),
            HomeRecommend(list: this.oumeiList, title: "欧美性爱"),
            HomeRecommend(list: this.qiangjianList, title: "强奸乱伦"),
            HomeRecommend(list: this.zhifuList, title: "制服诱惑"),
          ],
        ),
      ),
    );
  }
}
