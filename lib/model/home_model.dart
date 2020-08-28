import 'package:balon_movie/model/home_casual.dart';
import 'package:balon_movie/model/home_recommend_model.dart';

class HomeModel {
  final List homeCasual;
  final List guochan;
  final List jingpin;
  final List wuma;
  final List shunv;
  final List katong;
  final List lunli;
  final List zhongwen;
  final List yazhou;
  final List oumei;

  HomeModel(
      {this.homeCasual,
      this.guochan,
      this.jingpin,
      this.wuma,
      this.shunv,
      this.katong,
      this.lunli,
      this.zhongwen,
      this.yazhou,
      this.oumei});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    var casualListJson = json["casual"] as List; //轮播图
    List casualList =
        casualListJson.map((i) => HomeCasual.fromJson(i)).toList();
    var guochanListJson = json["guochan"] as List; //国产
    List guochanList =
        guochanListJson.map((i) => HomeRecommendModel.fromJson(i)).toList();
    var jingpinListJson = json["jingpin"] as List; //精品
    List jingpinList =
        jingpinListJson.map((i) => HomeRecommendModel.fromJson(i)).toList();
    var wumaListJson = json["wuma"] as List; //无码
    List wumaList =
        wumaListJson.map((i) => HomeRecommendModel.fromJson(i)).toList();
    var shunvListJson = json["shunv"] as List; //熟女
    List shunvList =
        shunvListJson.map((i) => HomeRecommendModel.fromJson(i)).toList();
    var katongListJson = json["katong"] as List; //卡通
    List katongList =
        katongListJson.map((i) => HomeRecommendModel.fromJson(i)).toList();
    var lunliListJson = json["lunli"] as List; //伦理
    List lunliList =
        lunliListJson.map((i) => HomeRecommendModel.fromJson(i)).toList();
    var zhongwenListJson = json["zhongwen"] as List; //中文
    List zhongwenList =
        zhongwenListJson.map((i) => HomeRecommendModel.fromJson(i)).toList();
    var yazhouListJson = json["yazhou"] as List; //亚洲
    List yazhouList =
        yazhouListJson.map((i) => HomeRecommendModel.fromJson(i)).toList();
    var oumeiListJson = json["oumei"] as List; //欧美
    List oumeiList =
        oumeiListJson.map((i) => HomeRecommendModel.fromJson(i)).toList();

    return HomeModel(
      homeCasual: casualList,
      guochan: guochanList,
      jingpin: jingpinList,
      wuma: wumaList,
      shunv: shunvList,
      katong: katongList,
      lunli: lunliList,
      zhongwen: zhongwenList,
      yazhou: yazhouList,
      oumei: oumeiList,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["casual"] = this.homeCasual;
    data["guochan"] = this.guochan;
    data["jingpin"] = this.jingpin;
    data["wuma"] = this.wuma;
    data["shunv"] = this.shunv;
    data["katong"] = this.katong;
    data["lunli"] = this.lunli;
    data["zhongwen"] = this.zhongwen;
    data["yazhou"] = this.yazhou;
    data["oumei"] = this.oumei;
    return data;
  }
}
