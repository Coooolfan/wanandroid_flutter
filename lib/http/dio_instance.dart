import 'package:dio/dio.dart';
import 'package:wanandroid/http/cookie_interceptor.dart';
import 'package:wanandroid/http/http_method.dart';
import 'package:wanandroid/http/print_log_interceptor.dart';
import 'package:wanandroid/http/resp_interceptor.dart';

class DioInstance {
  static DioInstance? _instance;

  DioInstance._();

  static DioInstance instance() {
    return _instance ??= DioInstance._();
  }

  final Dio _dio = Dio();
  void initDio({
    required String baseUrl,
    String? httpMethod = HttpMethod.GET,
    Duration? connectTimeout = const Duration(milliseconds: 3000),
    Duration? receiveTimeout = const Duration(milliseconds: 3000),
    Duration? sendTimeout = const Duration(milliseconds: 3000),
    ResponseType? responseType = ResponseType.json,
    String? contentType = Headers.jsonContentType,
  }) {
    _dio.options = BaseOptions(
      method: httpMethod,
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      responseType: responseType,
      contentType: contentType,
    );
    // 拦截器
    _dio.interceptors.add(CookieInterceptor());
    _dio.interceptors.add(PrintLogInterceptor());
    _dio.interceptors.add(RespInterceptor());
  }

  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.get(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
    } catch (e) {
      print("error: $e \n path: $path");
      Response response = Response(
        requestOptions: RequestOptions(path: path),
        data: null,
      );

      return response;
    }
  }

  Future<Response> post({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
    } catch (e) {
      print("error: $e \n path: $path");
      Response response = Response(
        requestOptions: RequestOptions(path: path),
        data: null,
      );

      // 手动调用拦截器
      for (var interceptor in _dio.interceptors) {
        interceptor.onResponse(response, ResponseInterceptorHandler());
      }

      return response;
    }
  }
}
