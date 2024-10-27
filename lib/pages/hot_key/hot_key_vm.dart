import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wanandroid/repository/api.dart';
import 'package:wanandroid/repository/datas/common_website_data.dart';
import 'package:wanandroid/repository/datas/search_hot_key_data.dart';

class HotKeyVM with ChangeNotifier {
  List<CommonWebsiteData>? commonWebsiteList;
  List<SearchHotKeyData>? searchHotKeyList;

  Future initializeData() async {
    await getWebsiteList();
    await getHotKey();
    notifyListeners();
  }

  // 获取常用网站列表
  Future getWebsiteList() async {
    commonWebsiteList = await Api.instance.getWebsiteList();
    notifyListeners();
  }

  // 获取搜索热词列表
  Future getHotKey() async {
    searchHotKeyList = await Api.instance.getHotKey();
    notifyListeners();
  }
}
