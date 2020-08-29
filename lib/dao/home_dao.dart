import 'dart:async';
import 'package:balon_movie/model/home_model.dart';
import 'package:balon_movie/model/home_recommend_model.dart';
import 'package:dio/dio.dart';

const HOME_DATA = "http://212.64.93.42:3000/api/home_data";
const CATEGORY_DATA = "http://212.64.93.42:3000/api/category_data";

class HomeDao {
  static Future<HomeModel> getHomeData() async {
    final Response response = await Dio().get(HOME_DATA);
    if (response.statusCode == 200) {
      return HomeModel.fromJson(response.data['data']);
    } else {
      throw Exception("Failed load home_page.");
    }
  }

  static Future<List<HomeRecommendModel>> getCategoryData() async {
    final Response response = await Dio().get(CATEGORY_DATA);
    if (response.statusCode == 200) {
      var categoryListJson = response.data["data"] as List;
      var categoryList =
          categoryListJson.map((i) => HomeRecommendModel.fromJson(i)).toList();
      return categoryList;
    } else {
      throw Exception("Failed load category_page.");
    }
  }
}
