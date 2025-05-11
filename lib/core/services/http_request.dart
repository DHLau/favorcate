import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'config.dart';

class DHHttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
    baseUrl: HttpConfig.BASE_URL,
    connectTimeout: Duration(milliseconds: HttpConfig.TIMEOUT),
  );
  static final Dio dio = Dio()..interceptors.add(_createDefaultInterceptor());

  // 创建默认拦截器
  static Interceptor _createDefaultInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        print('请求拦截');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('响应拦截');
        return handler.next(response);
      },
      onError: (error, handler) {
        print('错误拦截');
        if (error.response?.statusCode != null) {
          print('HTTP状态码: ${error.response?.statusCode}');
        }
        return handler.next(error);
      },
    );
  }

  static Future<T> request<T>(
    String url, {
    String method = "get",
    Map<String, dynamic>? params,
    Interceptor? interceptor,
  }) async {
    // 1. 创建个性化配置
    final options = Options(method: method);

    Interceptor defaultInterceptor = InterceptorsWrapper(
      onRequest: (option, handle) {
        print("请求拦截");
        handle.next(option);
      },
      onResponse: (response, handle) {
        print("响应拦截");
        handle.next(response);
      },
      onError: (error, handle) {
        print("错误拦截");
        handle.next(error);
      },
    );
    List<Interceptor> inters = [defaultInterceptor];
    if (interceptor != null) {
      inters.add(interceptor);
    }
    dio.interceptors.addAll(inters);

    try {
      Response response = await dio.request(
        url,
        queryParameters: params,
        options: options,
      );
      return response.data;
    } on DioException catch (e) {
      final errorData = e.response?.data ?? {'error': '未知网络错误'};
      return Future.error(errorData);
    }
  }
}
