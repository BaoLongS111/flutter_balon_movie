import 'package:dio/dio.dart';

class CategoryDao {
  static Future<dynamic> switchCategoryData(
      {String type,
      String area,
      String hd,
      String size,
      String ma,
      String language,
      String paixu}) async {
    String sql;
    if (type != "全部类型") {
      // sql = "select ${type} from mac_vod where area"
    }
  }
}
