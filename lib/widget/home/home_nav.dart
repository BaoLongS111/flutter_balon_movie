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
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Image.asset(
            item["path"],
            fit: BoxFit.fill,
            width: 45,
            height: 45,
          ),
          Text(
            item["type"],
            style: TextStyle(color: Colors.white70),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.fromLTRB(5, 12, 5, 12),
      child: GridView.count(
          crossAxisCount: 4,
          padding: EdgeInsets.all(3.0),
          children: navList.map((i) => _gridViewItemUI(context, i)).toList()),
    );
  }
}
