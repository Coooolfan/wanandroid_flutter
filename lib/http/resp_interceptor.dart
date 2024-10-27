import 'package:dio/dio.dart';
import 'package:oktoast/oktoast.dart';
import 'package:wanandroid/http/base_model.dart';

class RespInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      try {
        var resp = BaseModel.fromJson(response.data);
        if (resp.errorCode == 0) {
          if (resp.data == null) {
            response.data = resp.data;
            handler.next(
                Response(requestOptions: response.requestOptions, data: true));
          } else {
            handler.next(Response(
                requestOptions: response.requestOptions, data: resp.data));
          }
        } else if (resp.errorCode == -1001) {
          showToast("登录失效，请重新登录");
          handler.next(Response(
              requestOptions: response.requestOptions, data: resp.data));
        } else if (resp.errorCode == -1) {
          showToast(resp.errorMsg ?? "未知错误");
          handler.next(
              Response(requestOptions: response.requestOptions, data: false));
        } else {
          showToast(resp.errorMsg ?? "未知错误");
          handler.next(Response(
              requestOptions: response.requestOptions, data: resp.data));
        }
      } catch (e) {
        // handler.reject(DioException(
        //     requestOptions: response.requestOptions, message: "$e"));
        showToast("$e");
      }
    } else {
      showToast("请求失败");
      // handler.reject(DioException(requestOptions: response.requestOptions));
    }
  }
}
