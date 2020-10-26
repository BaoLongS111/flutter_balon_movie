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
  //控制器
  PageController _controller;
  List _pages = [];
  int _currentIndex = 0;

  @override
  void initState() {
    _controller = PageController(initialPage: 0, keepPage: true);
    _pages.add(HomePage());
    _pages.add(CategoryPage());
    _pages.add(VideoPage());
    _pages.add(HotPage());
    _pages.add(ProfilePage());
    super.initState();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) => _pages[index],
        itemCount: _pages.length,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            //设置背景色`BottomNavigationBar
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
                width: 24,
                height: 24,
              ),
              activeIcon: Image.asset(
                "assets/images/tabbar/icon_shouye_sel.png",
                fit: BoxFit.fill,
                width: 24,
                height: 24,
              ),
              label: "首页",
            ),
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
              label: "分类",
            ),
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
              label: "小视频",
            ),
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
              label: "热点",
            ),
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
              label: "我的",
            ),
          ],
        ),
      ),
    );
  }
}
