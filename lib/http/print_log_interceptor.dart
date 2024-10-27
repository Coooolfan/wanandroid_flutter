import 'dart:io';

import 'package:dio/dio.dart';

class PrintLogInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("请求url: ${options.uri}");
    print("请求头: ${options.headers}");
    print("请求头 Cookie: ${options.headers[HttpHeaders.setCookieHeader]}");
    print("请求参数: ${options.queryParameters}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("响应头Cookie: ${response.headers[HttpHeaders.setCookieHeader]}");
    print("响应数据: ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("请求异常: ${err.error}");
    super.onError(err, handler);
  }
}
