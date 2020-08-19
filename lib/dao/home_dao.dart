import 'dart:async';
import 'package:balon_movie/model/home_recommend.dart';
import 'package:dio/dio.dart';
import 'package:balon_movie/model/home_casual.dart';

const HOME_DATA = "http://212.64.93.42:3000/api/home_data";

class HomeDao {
  static Future<List> getHomeData() async {
    final Response response = await Dio().get(HOME_DATA);
    if (response.statusCode == 200) {
      List allData = [];
      var casualListJson = response.data["casual"] as List; //轮播图
      List<HomeCasual> casualList =
          casualListJson.map((i) => HomeCasual.fromJson(i)).toList();
      allData.add(casualList);
      var guochanListJson = response.data["guochan"] as List; //国产
      List<HomeRecommend> guochanList =
          guochanListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      allData.add(guochanList);
      var jingpinListJson = response.data["jingpin"] as List; //精品
      List<HomeRecommend> jingpinList =
          jingpinListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      allData.add(jingpinList);
      var wumaListJson = response.data["wuma"] as List; //无码
      List<HomeRecommend> wumaList =
          wumaListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      allData.add(wumaList);
      var shunvListJson = response.data["shunv"] as List; //熟女
      List<HomeRecommend> shunvList =
          shunvListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      allData.add(shunvList);
      var katongListJson = response.data["katong"] as List; //卡通
      List<HomeRecommend> katongList =
          katongListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      allData.add(katongList);
      var lunliListJson = response.data["lunli"] as List; //伦理
      List<HomeRecommend> lunliList =
          lunliListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      allData.add(lunliList);
      var zhongwenListJson = response.data["zhongwen"] as List; //中文
      List<HomeRecommend> zhongwenList =
          zhongwenListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      allData.add(zhongwenList);
      var yazhouListJson = response.data["yazhou"] as List; //亚洲
      List<HomeRecommend> yazhouList =
          yazhouListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      allData.add(yazhouList);
      var oumeiListJson = response.data["oumei"] as List; //欧美
      List<HomeRecommend> oumeiList =
          oumeiListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      allData.add(oumeiList);
      return allData;
    } else {
      throw Exception("Failed load home_page.");
    }
  }
}
