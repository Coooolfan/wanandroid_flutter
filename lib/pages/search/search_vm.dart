import 'package:flutter/material.dart';
import 'package:wanandroid/repository/api.dart';
import 'package:wanandroid/repository/datas/search_data.dart';

class SearchVm with ChangeNotifier {
  List<SearchDateItem>? searchList = [];

  Future search(String key) async {
    searchList = await Api.instance.search(key);
    notifyListeners();
  }
}
