import 'package:flutter/material.dart';

class HomeCasual {
  final String id;
  final String image;
  final String url;

  HomeCasual({this.id, this.image, this.url});

  factory HomeCasual.fromJson(Map<String, dynamic> json) {
    return HomeCasual(id: json['id'], image: json['image'], url: json['url']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['url'] = this.url;
    return data;
  }
}
