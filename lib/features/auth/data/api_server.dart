import 'package:dio/dio.dart';

class AuthService {
  final Dio dio = Dio();

  final String baseUrl = "http://127.0.0.1:8000/api";

  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await dio.post(
      "$baseUrl/register",
      data: {"name": name, "email": email, "password": password},
    );

    return response.data;
  }
}
