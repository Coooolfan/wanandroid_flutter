import 'package:flutter/material.dart';
import 'package:wanandroid/app.dart';
import 'package:wanandroid/http/dio_instance.dart';

void main() {
  DioInstance.instance().initDio(baseUrl: "https://www.wanandroid.com/");
  runApp(const MyApp());
}
