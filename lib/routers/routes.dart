import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes {
  static String root = '/';
  static String detailPage = '/detail';
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

    router.define(detailPage, handler: detailsHandler);
  }
}
