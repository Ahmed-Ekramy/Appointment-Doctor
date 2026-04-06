import 'package:dio/dio.dart';

import '../utils/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ${CacheHelper.getData(key: 'token')}';
    super.onRequest(options, handler);

  }
}
