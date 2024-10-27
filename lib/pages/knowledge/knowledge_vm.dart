import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wanandroid/repository/api.dart';
import 'package:wanandroid/repository/datas/knowledge_data.dart';

class KnowledgeVm with ChangeNotifier {
  List<KnowledgeData>? knowledgeList;

  // 获取体系数据
  Future getWebsiteList() async {
    knowledgeList = await Api.instance.getKnowledge();
    notifyListeners();
  }
}
