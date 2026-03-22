import 'package:dio/dio.dart';

class DioClient {
  Dio dio = Dio(
    BaseOptions(baseUrl: '', 
    headers: {"Content-Type": 'application/json'}),
  );

  
}
