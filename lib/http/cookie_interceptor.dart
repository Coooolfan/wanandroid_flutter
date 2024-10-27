import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wanandroid/utils/constants.dart';
import 'package:wanandroid/utils/sp_utils.dart';

class CookieInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    SpUtils.getStringList(Constants.SP_COOKIE_LIST).then((cookies) {
      options.headers[HttpHeaders.cookieHeader] = cookies;
      handler.next(options);
    });
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.requestOptions.path.contains("login")) {
      dynamic list = response.headers[HttpHeaders.setCookieHeader];
      List<String> cookies = [];
      if (list != null) {
        for (var item in list) {
          cookies.add(item ?? "");
        }
      }
      // Save cookies
      SpUtils.saveStringList(Constants.SP_COOKIE_LIST, cookies);
    }
    super.onResponse(response, handler);
  }
}
