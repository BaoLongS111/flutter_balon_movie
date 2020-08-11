import 'package:balon_movie/pages/category_page.dart';
import 'package:balon_movie/pages/home_page.dart';
import 'package:balon_movie/pages/hot_page.dart';
import 'package:balon_movie/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:balon_movie/config/custom_icon.dart';

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
        children: [HomePage(), CategoryPage(), HotPage(), ProfilePage()],
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            //设置背景色`BottomNavigationBar`
            canvasColor: Colors.black87,
            //设置高亮文字颜色
            primaryColor: Colors.yellow,
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
                icon: Icon(
                  CustomIcon.home,
                ),
                activeIcon: Icon(CustomIcon.home_select,
                    size: _currentIndex != 0
                        ? _defaultIconSize
                        : _activeIconSize),
                title: Text("首页")),
            BottomNavigationBarItem(
                icon: Icon(CustomIcon.category),
                activeIcon: Icon(CustomIcon.category_select,
                    size: _currentIndex != 1
                        ? _defaultIconSize
                        : _activeIconSize),
                title: Text(
                  "频道",
                )),
            BottomNavigationBarItem(
                icon: Icon(CustomIcon.hot),
                activeIcon: Icon(CustomIcon.hot_select,
                    size: _currentIndex != 2
                        ? _defaultIconSize
                        : _activeIconSize),
                title: Text(
                  "热点",
                )),
            BottomNavigationBarItem(
                icon: Icon(CustomIcon.profile),
                activeIcon: Icon(CustomIcon.profile_select,
                    size: _currentIndex != 3
                        ? _defaultIconSize
                        : _activeIconSize),
                title: Text(
                  "我的",
                )),
          ],
        ),
      ),
    );
  }
}
