import 'package:dio/dio.dart';
import 'package:octafitpro/features/auth/data/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/network/dio_helper.dart';


class AuthService {
  Future<AuthModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await DioHelper.postData(
        url: 'login',
        data: {
          'email': email,
          'password': password,
        },
      );

      AuthModel loginModel = AuthModel.fromJson(response.data);

      /// حفظ التوكن
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('token', loginModel.token);

      return loginModel;
    } on DioException catch (e) {
      print(e.response?.data);
      return null;
    }
  }
}