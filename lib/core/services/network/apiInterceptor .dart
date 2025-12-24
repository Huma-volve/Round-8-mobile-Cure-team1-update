import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = Cachehelper.getToken();
    print('-9899999999999$token');
    if (token != null) {
      options.headers['Authorization'] =
          'Bearer 206|lV3C5fm4Tp5NwBunQcDcVGRN3CsB6Lov1uSPXwF4d4622b42';
    }
    options.headers['Accept'] = 'application/json';
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // clear token / logout
    }
    handler.next(err);
  }
}
