import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/detail_page.dart';
import '../pages/search_page.dart';

//详情页Handler
Handler detailsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return DetailPage();
  },
);

//搜索页Handler
Handler searchHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SearchPage();
  },
);
