import 'package:balon_movie/dao/category_dao.dart';
import 'package:balon_movie/model/home_recommend_model.dart';
import 'package:balon_movie/widget/category/horizontal_list.dart';
import 'package:balon_movie/widget/category/type_recommend.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<HomeRecommendModel> data = [];
  //当前页码
  int _page = 1;
  int _pageSize = 20;
  //是否第一次加载
  bool isFirstLoad = true;

  List type = [
    "全部类型",
    "精品推荐",
    "国产情色",
    "少女萝莉",
    "网红主播",
    "无码专区",
    "亚洲有码",
    "中文字幕",
    "丝袜长腿",
    "女同性恋",
    "韩国伦理",
    "卡通动画",
    "熟女人妻",
    "巨乳美乳",
    "欧美性爱",
    "强奸乱伦",
    "制服诱惑"
  ];
  List area = ["全部地区", "国产", "日本", "台湾", "韩国", "香港", "欧美"];
  List hd = ["全部清晰度", "标清", "高清"];
  List size = ["全部规格", "长片", "短片"];
  List ma = ["全部", "有码", "无码"];
  List language = ["全部语言", "中文字幕", "国语对白", "其它"];
  List paixu = ["综合排序", "最多好评", "最多播放", "最高评分"];

  Future<Null> _loadMoreData() async {
    await Future.delayed(Duration(seconds: 1), () {
      CategoryDao.loadMoreCategoryData(page: _page, pageSize: _pageSize)
          .then((value) {
        setState(() {
          data.addAll(value);
          _page += 1;
        });
      });
    });
  }

  @override
  void initState() {
    _loadMoreData();
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text(
          "分类",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          IconButton(
              icon: IconButton(
                  icon: Image.asset(
                    "assets/images/global/icon_search.png",
                    fit: BoxFit.fill,
                  ),
                  onPressed: null),
              onPressed: null)
        ],
      ),
      body: Container(
        height: 2200,
        decoration: BoxDecoration(color: Colors.black87),
        child: EasyRefresh(
          onLoad: _loadMoreData,
          footer: ClassicalFooter(
              bgColor: Colors.black87,
              textColor: Colors.white,
              showInfo: false,
              loadText: "上拉加载更多",
              noMoreText: '我是有底线的TAT',
              loadingText: "全力加载中...",
              loadFailedText: "网络出了点小差...",
              loadedText: "加载完成"),
          child: ListView(
            children: [
              HorizontalList(
                list: type,
                type_text: "类型",
              ),
              HorizontalList(
                list: area,
                type_text: "地区",
              ),
              HorizontalList(
                list: hd,
                type_text: "清晰度",
              ),
              HorizontalList(
                list: size,
                type_text: "长度",
              ),
              HorizontalList(
                list: ma,
                type_text: "有码",
              ),
              HorizontalList(
                list: language,
                type_text: "语言",
              ),
              HorizontalList(
                list: paixu,
                type_text: "排序",
              ),
              TypeRecommend(list: data)
            ],
          ),
        ),
      ),
    );
  }
}
