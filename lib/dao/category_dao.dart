import 'package:balon_movie/model/home_recommend_model.dart';
import 'package:dio/dio.dart';

const CATEGORY_PAGE = "http://212.64.93.42:3000/api/page";
const CATEGORY_RECOMMEND = "http://212.64.93.42:3000/api/recommend";

class CategoryDao {
  static Future<List<HomeRecommendModel>> loadMoreCategoryData(
      {int page, int pageSize}) async {
    final Response response = await Dio()
        .post(CATEGORY_PAGE, data: {"page": page, "pageSize": pageSize});
    if (response.statusCode == 200) {
      var categoryListJson = response.data["data"] as List;
      var categoryList =
          categoryListJson.map((i) => HomeRecommendModel.fromJson(i)).toList();
      return categoryList;
    } else {
      throw Exception("Failed load Category Data.");
    }
  }

  static Future<List<HomeRecommendModel>> getCategoryRecommend(
      {String tag}) async {
    final Response response =
        await Dio().post(CATEGORY_RECOMMEND, data: {"tag": tag});
    if (response.statusCode == 200) {
      var categoryListJson = response.data["data"] as List;
      var categoryList =
          categoryListJson.map((i) => HomeRecommendModel.fromJson(i)).toList();
      return categoryList;
    } else {
      throw Exception("Failed load CategoryRecommend Data.");
    }
  }
}
