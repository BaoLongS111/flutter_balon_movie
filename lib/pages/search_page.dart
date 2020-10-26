import 'package:balon_movie/dao/category_dao.dart';
import 'package:balon_movie/model/home_recommend_model.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:balon_movie/common/utils/screen_adaper.dart';
import 'package:balon_movie/widget/search/search_tag.dart';
import 'package:balon_movie/widget/category/type_recommend.dart';
import 'package:balon_movie/common/components/title_head.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<HomeRecommendModel> data = []; //视频数据
  //当前页码
  int _page = 1;
  int _pageSize = 20;

  Future<Null> _loadMoreData() async {
    await CategoryDao.loadMoreCategoryData(page: _page, pageSize: _pageSize)
        .then((value) {
      setState(() {
        data.addAll(value);
        _page += 1;
      });
    });
  }

  @override
  void initState() {
    _loadMoreData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        automaticallyImplyLeading: false, //去掉跳转页面自带的返回按钮
        backgroundColor: Colors.black87,
        title: Container(
          height: ScreenAdaper.setHeight(80),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0x33bdc3c7),
              borderRadius: BorderRadius.circular(15)),
          child: TextField(
            autofocus: false, //自动获取焦点
            minLines: 1, //允许最大行数
            style: TextStyle(
              //输入内容样式
              color: Colors.white,
              fontSize: ScreenAdaper.setSp(38),
            ),
            enableInteractiveSelection: false, //是否允许复制粘贴
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                  icon: Image.asset(
                    "assets/images/global/icon_search.png",
                    color: Colors.pink,
                  ),
                  onPressed: null),
              contentPadding: EdgeInsets.all(0), //解决文本和icon不对齐
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
              hintText: "输入关键字查找片源",
              hintStyle: TextStyle(
                fontSize: ScreenAdaper.setSp(38),
                color: Colors.white70,
                textBaseline: TextBaseline.alphabetic,
              ),
            ),
          ),
        ),
        actions: [
          Container(
            alignment: Alignment.center,
            width: ScreenAdaper.setWidth(140),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "取消",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: EasyRefresh(
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
            SearchTag(),
            TitleHead(
              title: "热片推荐",
              isShowMore: false,
            ),
            SizedBox(
              height: ScreenAdaper.setHeight(20),
            ),
            TypeRecommend(list: data),
          ],
        ),
      ),
    );
  }
}
