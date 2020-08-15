import 'package:flutter/cupertino.dart';

class CustomIcon {
  static const IconData home = const IconData(
      //home为图标的名称
      0xe62d, //代表的是该图标的代码
      fontFamily: 'MyIcon', //就是我们刚才在pubspec.yaml中设置的字体名称，记得对应上就好
      matchTextDirection: true);
  static const IconData home_select =
      const IconData(0xe62e, fontFamily: 'MyIcon', matchTextDirection: true);
  static const IconData category =
      const IconData(0xe623, fontFamily: 'MyIcon', matchTextDirection: true);
  static const IconData category_select =
      const IconData(0xe624, fontFamily: 'MyIcon', matchTextDirection: true);
  static const IconData profile =
      const IconData(0xe62f, fontFamily: 'MyIcon', matchTextDirection: true);
  static const IconData profile_select =
      const IconData(0xe630, fontFamily: 'MyIcon', matchTextDirection: true);
  static const IconData hot =
      const IconData(0xe625, fontFamily: 'MyIcon', matchTextDirection: true);
  static const IconData hot_select =
      const IconData(0xe605, fontFamily: 'MyIcon', matchTextDirection: true);
  static const IconData download =
      const IconData(0xe607, fontFamily: 'home_page', matchTextDirection: true);
  static const IconData history =
      const IconData(0xe606, fontFamily: 'home_page', matchTextDirection: true);
}
