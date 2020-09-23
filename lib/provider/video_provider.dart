import 'package:balon_movie/model/home_recommend_model.dart';
import 'package:flutter/cupertino.dart';

class VideoProvider extends ChangeNotifier {
  HomeRecommendModel homeModel = HomeRecommendModel();

  void updateModel(HomeRecommendModel model) {
    this.homeModel = model;
    notifyListeners();
  }

  HomeRecommendModel getModel() {
    return this.homeModel != null ? this.homeModel : null;
  }
}
