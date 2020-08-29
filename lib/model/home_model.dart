import 'package:balon_movie/model/home_casual.dart';
import 'package:balon_movie/model/home_recommend_model.dart';

class HomeModel {
  final List<HomeCasual> homeCasual;
  final List<HomeRecommendModel> guochan;
  final List<HomeRecommendModel> jingpin;
  final List<HomeRecommendModel> wuma;
  final List<HomeRecommendModel> shunv;
  final List<HomeRecommendModel> katong;
  final List<HomeRecommendModel> lunli;
  final List<HomeRecommendModel> zhongwen;
  final List<HomeRecommendModel> yazhou;
  final List<HomeRecommendModel> oumei;

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
    List<HomeCasual> casualList =
        casualListJson.map<HomeCasual>((i) => HomeCasual.fromJson(i)).toList();
    var guochanListJson = json["guochan"] as List; //国产
    List<HomeRecommendModel> guochanList = guochanListJson
        .map<HomeRecommendModel>((i) => HomeRecommendModel.fromJson(i))
        .toList();
    var jingpinListJson = json["jingpin"] as List; //精品
    List<HomeRecommendModel> jingpinList = jingpinListJson
        .map<HomeRecommendModel>((i) => HomeRecommendModel.fromJson(i))
        .toList();
    var wumaListJson = json["wuma"] as List; //无码
    List<HomeRecommendModel> wumaList = wumaListJson
        .map<HomeRecommendModel>((i) => HomeRecommendModel.fromJson(i))
        .toList();
    var shunvListJson = json["shunv"] as List; //熟女
    List<HomeRecommendModel> shunvList = shunvListJson
        .map<HomeRecommendModel>((i) => HomeRecommendModel.fromJson(i))
        .toList();
    var katongListJson = json["katong"] as List; //卡通
    List<HomeRecommendModel> katongList = katongListJson
        .map<HomeRecommendModel>((i) => HomeRecommendModel.fromJson(i))
        .toList();
    var lunliListJson = json["lunli"] as List; //伦理
    List<HomeRecommendModel> lunliList = lunliListJson
        .map<HomeRecommendModel>((i) => HomeRecommendModel.fromJson(i))
        .toList();
    var zhongwenListJson = json["zhongwen"] as List; //中文
    List<HomeRecommendModel> zhongwenList = zhongwenListJson
        .map<HomeRecommendModel>((i) => HomeRecommendModel.fromJson(i))
        .toList();
    var yazhouListJson = json["yazhou"] as List; //亚洲
    List<HomeRecommendModel> yazhouList = yazhouListJson
        .map<HomeRecommendModel>((i) => HomeRecommendModel.fromJson(i))
        .toList();
    var oumeiListJson = json["oumei"] as List; //欧美
    List<HomeRecommendModel> oumeiList = oumeiListJson
        .map<HomeRecommendModel>((i) => HomeRecommendModel.fromJson(i))
        .toList();

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
