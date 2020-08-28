import 'package:balon_movie/widget/category/horizontal_list.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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

  List area = ["全部地区", "国产", "日本", "台湾", "韩国"];

  @override
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
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),
      body: Container(
          height: 800,
          decoration: BoxDecoration(color: Colors.black87),
          child: ListView(
            children: [HorizontalList(list: type), HorizontalList(list: area)],
          )),
    );
  }
}
