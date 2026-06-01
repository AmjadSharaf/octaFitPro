import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://127.0.0.1:8000/api/',
        receiveDataWhenStatusError: true,

        headers: {'Accept': 'application/json'},
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio.options.headers['Authorization'] = 'Bearer $token';

    return await dio.post(url, data: data);
  }

  static Future<Response> getData({required String url, String? token}) async {
    dio.options.headers['Authorization'] = 'Bearer $token';

    return await dio.get(url);
  }
}
