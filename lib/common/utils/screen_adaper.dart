import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 直接通过`类名称`访问里面的方法，方法为 静态方法
class ScreenAdaper {
  static init(context) {
    /// 设计稿 --- 宽/高
    //fill in the screen size of the device in the design

//default value : width : 1080px , height:1920px , allowFontScaling:false
    // ScreenUtil.init(context);

//If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    // ScreenUtil.init(context, width: 750, height: 1334);

//If you want to set the font size is scaled according to the system's "font size" assist option
    ScreenUtil.init(context, width: 1080, height: 1920);
  }

  static setSp(double value, {bool allowFontScalingSelf = true}) {
    return ScreenUtil()
        .setSp(value, allowFontScalingSelf: allowFontScalingSelf);

    /// 获取 计算后的字体
  }

  static setHeight(double value) {
    return ScreenUtil().setHeight(value);

    /// 获取 计算后的高度
  }

  static setWidth(double value) {
    return ScreenUtil().setWidth(value);

    /// 获取 计算后的宽度
  }

  static screenHeight() {
    return ScreenUtil.screenHeight;

    /// 获取 计算后的屏幕高度
  }

  static screenWidth() {
    return ScreenUtil.screenWidth;

    /// 获取 计算后的屏幕宽度
  }
}
