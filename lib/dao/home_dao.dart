import 'dart:async';
import 'package:dio/dio.dart';
import 'package:balon_movie/model/home_casual.dart';

const HOME_CASUAL = "http://212.64.93.42:3000/api/homecasual";

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
}
