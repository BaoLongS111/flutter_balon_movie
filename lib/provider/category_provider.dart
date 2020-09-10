import 'package:balon_movie/model/category_model.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryModel categoryModel = CategoryModel();
  // get categoryModel => _categoryModel;

  void getCategoryData() {
    print("1111111111111111");
    notifyListeners();
  }
}
