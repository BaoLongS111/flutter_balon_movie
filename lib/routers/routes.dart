import 'package:flutter/material.dart' hide Router;
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  static String root = '/'; //首页
  static String detailPage = '/detail'; //详情页
  static String searchPage = '/search'; //搜索页
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Text("路由未找到!"),
          ),
        );
      },
    );

    //路由声明
    router.define(detailPage, handler: detailsHandler);
    router.define(searchPage, handler: searchHandler);
  }
}
