import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wanandroid/repository/api.dart';
import 'package:wanandroid/repository/datas/knowledge_data.dart';
import 'package:wanandroid/repository/datas/knowledge_detail_data.dart';

class KnowledgeDetailTabVm with ChangeNotifier {
  List<Tab> tabs = [];
  List<KnowledgeDetailItem>? knowledgeDetailList = [];
  int _pageCount = 0;
  void initTabs(List<KnowledgeData>? tabList) {
    for (var i = 0; i < tabList!.length; i++) {
      tabs.add(Tab(text: tabList[i].name));
    }
    notifyListeners();
  }

  Future getKnowledgeDetailList(String? cid, bool loadMore) async {
    if (loadMore) {
      _pageCount++;
    } else {
      _pageCount = 0;
      knowledgeDetailList?.clear();
    }
    var list = await Api.instance
        .getKnowledgeDetail(_pageCount.toString(), cid ?? "0");
    if (list.isNotEmpty == true) {
      knowledgeDetailList?.addAll((list));
      try {
        notifyListeners();
      } catch (e) {
        print(e);
      }
    } else {
      if (loadMore && _pageCount > 0) {
        _pageCount--;
      }
    }
  }
}
