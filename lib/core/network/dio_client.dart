import 'package:dio/dio.dart';

class DioClient {
  Dio _dio = Dio(
    BaseOptions(baseUrl: '', headers: {"Content-Type": 'application/json'}),
  );

  
}
