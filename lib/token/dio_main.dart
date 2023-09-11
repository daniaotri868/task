import 'package:dio/dio.dart';
import 'package:new_task/commen/constants/route.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DioFactory {
  final Dio _dio = Dio(
      BaseOptions(
    baseUrl: EndPoints.baseUrl,
        responseType: ResponseType.plain,
    receiveTimeout: const Duration(seconds: 30),
    connectTimeout: const Duration(seconds: 30),));
  DioFactory._() {
    _dio.interceptors.addAll(<Interceptor>{
      InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        final prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString('token');
        // options.headers['content-Type']='application/json';
        // options.headers['Connection']='keep-alive';
        // options.headers['Authorization'] = 'Bearer ${CachHelper.sharedPreferences.getString('token')}';
        return handler.next(options);}),
      LogInterceptor(
        responseBody: true,
      )
    });
  }
  static DioFactory instance = DioFactory._();
  Dio get() {
    return _dio;
  }
}
