import 'package:balon_movie/pages/category_page.dart';
import 'package:balon_movie/pages/home_page.dart';
import 'package:balon_movie/pages/hot_page.dart';
import 'package:balon_movie/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:balon_movie/pages/video_page.dart';

class TabNavigator extends StatefulWidget {
  TabNavigator({Key key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  //选中图标大小
  double _defaultIconSize = 24.0;
  double _activeIconSize = 28.0;
  //控制器
  final PageController _controller = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          HomePage(),
          CategoryPage(),
          VideoPage(
              // url: "https://video.jializyw.com:8800/20200726/jta5mLhR/index.m3u8",
              ),
          HotPage(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            //设置背景色`BottomNavigationBar`
            canvasColor: Colors.black87,
            //设置高亮文字颜色
            primaryColor: Colors.red,
            //设置一般文字颜色
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.grey))),
        child: BottomNavigationBar(
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/tabbar/icon_shouye.png",
                  fit: BoxFit.fill,
                  width: 22,
                  height: 22,
                ),
                activeIcon: Image.asset(
                  "assets/images/tabbar/icon_shouye_sel.png",
                  fit: BoxFit.fill,
                  width: 24,
                  height: 24,
                ),
                title: Text("首页")),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/tabbar/icon_fenlei.png",
                  fit: BoxFit.fill,
                  width: 22,
                  height: 22,
                ),
                activeIcon: Image.asset(
                  "assets/images/tabbar/icon_fenlei_sel.png",
                  fit: BoxFit.fill,
                  width: 24,
                  height: 24,
                ),
                title: Text(
                  "分类",
                )),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/tabbar/icon_short_video.png",
                  fit: BoxFit.fill,
                  width: 22,
                  height: 22,
                ),
                activeIcon: Image.asset(
                  "assets/images/tabbar/icon_short_video_sel.png",
                  fit: BoxFit.fill,
                  width: 24,
                  height: 24,
                ),
                title: Text(
                  "小视频",
                )),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/tabbar/icon_redian.png",
                  fit: BoxFit.fill,
                  width: 22,
                  height: 22,
                ),
                activeIcon: Image.asset(
                  "assets/images/tabbar/icon_redian_sel.png",
                  fit: BoxFit.fill,
                  width: 24,
                  height: 24,
                ),
                title: Text(
                  "热点",
                )),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/tabbar/icon_wode.png",
                  fit: BoxFit.fill,
                  width: 22,
                  height: 22,
                ),
                activeIcon: Image.asset(
                  "assets/images/tabbar/icon_wode_sel.png",
                  fit: BoxFit.fill,
                  width: 24,
                  height: 24,
                ),
                title: Text(
                  "我的",
                )),
          ],
        ),
      ),
    );
  }
}
