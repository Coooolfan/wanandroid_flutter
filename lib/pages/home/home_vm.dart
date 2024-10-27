import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid/repository/api.dart';
import 'package:wanandroid/repository/datas/home_banner_data.dart';
import 'package:wanandroid/repository/datas/home_list_data.dart';

class HomeViewModel with ChangeNotifier {
  int pageCount = 0;
  List<HomeBannerData?>? bannerList = [];
  List<HomeListItemData>? listData = [];
// 获取banner
  Future getBanner() async {
    List<HomeBannerData?>? bannerListData = await Api.instance.getBanner();
    bannerList = bannerListData ?? [];
    notifyListeners();
  }

// 获取首页文章列表
  Future getHomeList(bool loadMore) async {
    // Loading.showLoading();
    if (loadMore) {
      pageCount++;
    } else {
      pageCount = 0;
      listData?.clear();
    }
    List<HomeListItemData>? listDataData =
        await Api.instance.getHomeList("$pageCount");
    if (loadMore) {
      listData?.addAll(listDataData ?? []);
    } else {
      listData = listDataData ?? [];
    }
    // Loading.hideLoading();
    notifyListeners();
  }

  // 收藏文章
  Future collectArticle(String? id, int index) async {
    bool? resp = await Api.instance.collectArticle(id);
    if (resp ?? false) {
      listData?[index].collect = true;
      showToast("收藏成功");
    }
    notifyListeners();
  }

  // 取消收藏文章
  Future unCollectArticle(String? id, int index) async {
    bool? resp = await Api.instance.unCollectArticle(id);
    if (resp ?? false) {
      listData?[index].collect = false;
      showToast("取消收藏成功");
    }
    notifyListeners();
  }
}
