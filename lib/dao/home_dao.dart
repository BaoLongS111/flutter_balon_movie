import 'dart:async';
import 'package:balon_movie/model/home_recommend.dart';
import 'package:dio/dio.dart';
import 'package:balon_movie/model/home_casual.dart';

const HOME_CASUAL = "http://212.64.93.42:3000/api/homecasual";
const HOME_TOUPAI = "http://212.64.93.42:3000/api/home_toupaizipai";
const HOME_JINGPIN = "http://212.64.93.42:3000/api/home_jingpintuijian";
const HOME_SHAONV = "http://212.64.93.42:3000/api/home_shaonvluoli";
const HOME_WANGHONG = "http://212.64.93.42:3000/api/home_wanghongzhubo";
const HOME_WUMA = "http://212.64.93.42:3000/api/home_wumazhuanqu";
const HOME_YAZHOU = "http://212.64.93.42:3000/api/home_yazhouyouma";
const HOME_ZHONGWEN = "http://212.64.93.42:3000/api/home_zhongwenzimu";
const HOME_SIWA = "http://212.64.93.42:3000/api/home_siwachangtui";
const HOME_NVTONG = "http://212.64.93.42:3000/api/home_nvtongxinglian";
const HOME_HANGUO = "http://212.64.93.42:3000/api/home_hanguolunli";
const HOME_KATONG = "http://212.64.93.42:3000/api/home_katongdonghua";
const HOME_SHUNV = "http://212.64.93.42:3000/api/home_shunvrenqi";
const HOME_JURU = "http://212.64.93.42:3000/api/home_jurumeiru";
const HOME_OUMEI = "http://212.64.93.42:3000/api/home_oumeixingai";
const HOME_QIANGJIAN = "http://212.64.93.42:3000/api/home_qiangjianluanlun";
const HOME_ZHIFU = "http://212.64.93.42:3000/api/home_zhifuyouhuo";

class HomeDao {
  static Future<List> getHomeCasual() async {
    final Response response = await Dio().get(HOME_CASUAL);
    if (response.statusCode == 200) {
      var casualListJson = response.data["message"] as List;
      List<HomeCasual> casualList =
          casualListJson.map((i) => HomeCasual.fromJson(i)).toList();
      return casualList;
    } else {
      throw Exception("Failed load home_page.json");
    }
  }

  static Future<List> getHomeToupai() async {
    final Response response = await Dio().get(HOME_TOUPAI);
    if (response.statusCode == 200) {
      var recommendListJson = response.data["message"] as List;
      List<HomeRecommend> recommendList =
          recommendListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      return recommendList;
    } else {
      throw Exception("Failed load home_toupaizipai");
    }
  }

  static Future<List> getHomeJingPin() async {
    final Response response = await Dio().get(HOME_JINGPIN);
    if (response.statusCode == 200) {
      var recommendListJson = response.data["message"] as List;
      List<HomeRecommend> recommendList =
          recommendListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      return recommendList;
    } else {
      throw Exception("Failed load HOME_JINGPIN");
    }
  }

  static Future<List> getHomeShaoNv() async {
    final Response response = await Dio().get(HOME_SHAONV);
    if (response.statusCode == 200) {
      var recommendListJson = response.data["message"] as List;
      List<HomeRecommend> recommendList =
          recommendListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      return recommendList;
    } else {
      throw Exception("Failed load HOME_SHAONV");
    }
  }

  static Future<List> getHomeWangHong() async {
    final Response response = await Dio().get(HOME_WANGHONG);
    if (response.statusCode == 200) {
      var recommendListJson = response.data["message"] as List;
      List<HomeRecommend> recommendList =
          recommendListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      return recommendList;
    } else {
      throw Exception("Failed load HOME_WANGHONG");
    }
  }

  static Future<List> getHomeWuMa() async {
    final Response response = await Dio().get(HOME_WUMA);
    if (response.statusCode == 200) {
      var recommendListJson = response.data["message"] as List;
      List<HomeRecommend> recommendList =
          recommendListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      return recommendList;
    } else {
      throw Exception("Failed load HOME_WUMA");
    }
  }

  static Future<List> getHomeYaZhou() async {
    final Response response = await Dio().get(HOME_YAZHOU);
    if (response.statusCode == 200) {
      var recommendListJson = response.data["message"] as List;
      List<HomeRecommend> recommendList =
          recommendListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      return recommendList;
    } else {
      throw Exception("Failed load HOME_YAZHOU");
    }
  }

  static Future<List> getHomeZhongWen() async {
    final Response response = await Dio().get(HOME_ZHONGWEN);
    if (response.statusCode == 200) {
      var recommendListJson = response.data["message"] as List;
      List<HomeRecommend> recommendList =
          recommendListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      return recommendList;
    } else {
      throw Exception("Failed load HOME_ZHONGWEN");
    }
  }

  static Future<List> getHomeSiWa() async {
    final Response response = await Dio().get(HOME_SIWA);
    if (response.statusCode == 200) {
      var recommendListJson = response.data["message"] as List;
      List<HomeRecommend> recommendList =
          recommendListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      return recommendList;
    } else {
      throw Exception("Failed load HOME_SIWA");
    }
  }

  static Future<List> getHomeNvTong() async {
    final Response response = await Dio().get(HOME_NVTONG);
    if (response.statusCode == 200) {
      var recommendListJson = response.data["message"] as List;
      List<HomeRecommend> recommendList =
          recommendListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      return recommendList;
    } else {
      throw Exception("Failed load HOME_NVTONG");
    }
  }

  static Future<List> getHomeHanGuo() async {
    final Response response = await Dio().get(HOME_HANGUO);
    if (response.statusCode == 200) {
      var recommendListJson = response.data["message"] as List;
      List<HomeRecommend> recommendList =
          recommendListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      return recommendList;
    } else {
      throw Exception("Failed load HOME_HANGUO");
    }
  }

  static Future<List> getHomeKaTong() async {
    final Response response = await Dio().get(HOME_KATONG);
    if (response.statusCode == 200) {
      var recommendListJson = response.data["message"] as List;
      List<HomeRecommend> recommendList =
          recommendListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      return recommendList;
    } else {
      throw Exception("Failed load HOME_KATONG");
    }
  }

  static Future<List> getHomeShuNv() async {
    final Response response = await Dio().get(HOME_SHUNV);
    if (response.statusCode == 200) {
      var recommendListJson = response.data["message"] as List;
      List<HomeRecommend> recommendList =
          recommendListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      return recommendList;
    } else {
      throw Exception("Failed load HOME_SHUNV");
    }
  }

  static Future<List> getHomeJuRu() async {
    final Response response = await Dio().get(HOME_JURU);
    if (response.statusCode == 200) {
      var recommendListJson = response.data["message"] as List;
      List<HomeRecommend> recommendList =
          recommendListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      return recommendList;
    } else {
      throw Exception("Failed load HOME_JURU");
    }
  }

  static Future<List> getHomeOuMei() async {
    final Response response = await Dio().get(HOME_OUMEI);
    if (response.statusCode == 200) {
      var recommendListJson = response.data["message"] as List;
      List<HomeRecommend> recommendList =
          recommendListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      return recommendList;
    } else {
      throw Exception("Failed load HOME_OUMEI");
    }
  }

  static Future<List> getHomeQiangJian() async {
    final Response response = await Dio().get(HOME_QIANGJIAN);
    if (response.statusCode == 200) {
      var recommendListJson = response.data["message"] as List;
      List<HomeRecommend> recommendList =
          recommendListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      return recommendList;
    } else {
      throw Exception("Failed load HOME_QIANGJIAN");
    }
  }

  static Future<List> getHomeZhiFu() async {
    final Response response = await Dio().get(HOME_ZHIFU);
    if (response.statusCode == 200) {
      var recommendListJson = response.data["message"] as List;
      List<HomeRecommend> recommendList =
          recommendListJson.map((i) => HomeRecommend.fromJson(i)).toList();
      return recommendList;
    } else {
      throw Exception("Failed load HOME_ZHIFU");
    }
  }
}
