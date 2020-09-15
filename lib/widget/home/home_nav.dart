import 'package:balon_movie/common/utils/screen_adaper.dart';
import 'package:balon_movie/pages/category_page.dart';
import 'package:flutter/material.dart';

class HomeNav extends StatefulWidget {
  HomeNav({Key key}) : super(key: key);

  @override
  _HomeNavState createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  final List navList = [
    {"type": "制服诱惑", "path": "assets/images/home/icon_ghgy.png"},
    {"type": "成人动漫", "path": "assets/images/home/icon_jsby.png"},
    {"type": "辣妹大奶", "path": "assets/images/home/icon_lmdn.png"},
    {"type": "人妻熟女", "path": "assets/images/home/icon_rqsn.png"},
    {"type": "偷拍自拍", "path": "assets/images/home/icon_snqj.png"},
    {"type": "无码视频", "path": "assets/images/home/icon_wmsp.png"},
    {"type": "角色扮演", "path": "assets/images/home/icon_zfyh.png"},
    {"type": "全部分类", "path": "assets/images/home/icon_qbfl.png"},
  ];

  Widget _gridViewItemUI(BuildContext context, item) {
    return GestureDetector(
      onTap: () {
        switch (item["type"]) {
          case "全部分类":
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => CategoryPage()));
            break;
        }
      },
      child: Column(
        children: [
          Image.asset(
            item["path"],
            fit: BoxFit.fill,
            width: ScreenAdaper.setWidth(120),
            height: ScreenAdaper.setWidth(120),
          ),
          Text(
            item["type"],
            style: TextStyle(
                color: Colors.white70, fontSize: ScreenAdaper.setSp(35)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenAdaper.setHeight(480),
      margin: EdgeInsets.only(top: ScreenAdaper.setWidth(20)),
      padding: EdgeInsets.fromLTRB(
        ScreenAdaper.setWidth(5),
        ScreenAdaper.setHeight(20),
        ScreenAdaper.setWidth(5),
        ScreenAdaper.setHeight(6),
      ),
      child: GridView.count(
          physics: NeverScrollableScrollPhysics(), //去除滚动
          crossAxisCount: 4,
          padding: EdgeInsets.all(ScreenAdaper.setHeight(2)),
          children: navList.map((i) => _gridViewItemUI(context, i)).toList()),
    );
  }
}
