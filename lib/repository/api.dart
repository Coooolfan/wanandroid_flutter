import 'package:dio/dio.dart';
import 'package:wanandroid/http/dio_instance.dart';
import 'package:wanandroid/repository/datas/common_website_data.dart';
import 'package:wanandroid/repository/datas/home_banner_data.dart';
import 'package:wanandroid/repository/datas/home_list_data.dart';
import 'package:wanandroid/repository/datas/knowledge_data.dart';
import 'package:wanandroid/repository/datas/knowledge_detail_data.dart';
import 'package:wanandroid/repository/datas/login_data.dart';
import 'package:wanandroid/repository/datas/search_data.dart';
import 'package:wanandroid/repository/datas/search_hot_key_data.dart';

class Api {
  static Api instance = Api._();
  Api._();
  // 获取banner
  Future<List<HomeBannerData?>?> getBanner() async {
    Response response = await DioInstance.instance().get(path: "banner/json");
    HomeBannerListData homeBannerListData =
        HomeBannerListData.fromJson(response.data);
    return homeBannerListData.bannerList;
  }

  // 获取首页文章列表
  Future<List<HomeListItemData>?> getHomeList(String pageCount) async {
    Response response =
        await DioInstance.instance().get(path: "article/list/$pageCount/json");
    HomeListData homeData = HomeListData.fromJson(response.data);
    return homeData.datas;
  }

  // 获取常用网站列表
  Future<List<CommonWebsiteData>?> getWebsiteList() async {
    Response response = await DioInstance.instance().get(path: "friend/json");
    CommonWebsiteListData commonWebsiteListData =
        CommonWebsiteListData.fromJson(response.data);
    return commonWebsiteListData.commonWebsiteList;
  }

  // 获取搜索热词列表
  Future<List<SearchHotKeyData>?> getHotKey() async {
    Response response = await DioInstance.instance().get(path: "hotkey/json");
    SearchHotKeyListData searchHotKeyListData =
        SearchHotKeyListData.fromJson(response.data);
    return searchHotKeyListData.searchHotKeyList;
  }

  // 获取体系数据
  Future<List<KnowledgeData>?> getKnowledge() async {
    Response response = await DioInstance.instance().get(path: "tree/json");
    KnowledgeListData knowledgeListData =
        KnowledgeListData.fromJson(response.data);
    return knowledgeListData.knowledgeList;
  }

  // 获取体系详情数据
  Future<List<KnowledgeDetailItem>> getKnowledgeDetail(
      String pageCount, String cid) async {
    Response response = await DioInstance.instance()
        .get(path: "article/list/$pageCount/json?cid=$cid");
    KnowledgeDetailData knowledgeDetailData =
        KnowledgeDetailData.fromJson(response.data);
    return knowledgeDetailData.knowledgeDetailItemList;
  }

  // 注册接口
  Future<bool> register(
      String account, String password, String rePassword) async {
    Response response = await DioInstance.instance().post(
        path: "user/register",
        queryParameters: {
          "username": account,
          "password": password,
          "repassword": rePassword
        });
    if (response.data is bool) {
      return response.data;
    } else {
      return true;
    }
  }

  // 登录
  Future<LoginData?> login(String account, String password) async {
    Response response = await DioInstance.instance().post(
        path: "user/login",
        queryParameters: {"username": account, "password": password});
    if (response.data is bool) {
      return null;
    }
    LoginData loginData = LoginData.fromJson(response.data);
    return loginData;
  }

  // 收藏文章
  Future<bool?> collectArticle(String? id) async {
    Response response =
        await DioInstance.instance().post(path: "lg/collect/$id/json");
    if (response.data is bool && response.data != null) {
      return response.data;
    }
    return false;
  }

  // 取消收藏文章
  Future<bool?> unCollectArticle(String? id) async {
    Response response = await DioInstance.instance()
        .post(path: "lg/uncollect_originId/$id/json");
    if (response.data is bool && response.data != null) {
      return response.data;
    }
    return false;
  }

  // 退出登录
  Future<bool?> logout() async {
    Response response =
        await DioInstance.instance().get(path: "user/logout/json");
    if (response.data is bool && response.data != null) {
      return response.data;
    }
    return false;
  }

  // 搜索
  Future<List<SearchDateItem>?> search(String keyword) async {
    Response response = await DioInstance.instance()
        .post(path: "article/query/0/json", queryParameters: {"k": keyword});
    SearchData searchData = SearchData.fromJson(response.data);
    return searchData.searchDateItemList;
  }
}
