import 'package:dio/dio.dart';

import '../../../../core/networking/service/dio.dart';
import '../../../../core/networking/service/end_points.dart';
import '../../../../core/utils/app_functions/app_functions.dart';
class AuthRepo {
  static Future login({required String email, required String password}) async {
    try {
      final response = await DioHelper.postData(
        endPoint: EndPoints.login,
        data: {"email": email, "password": password},);
      if (response?.statusCode == 200) {
        AppFunctions.saveUserToken(token: response?.data['access_token']);
        return response?.data;
      } else {
        return "Login failed with status code: ${response?.statusCode}";
      }
    } on Exception catch (e) {
      return e.toString();
    }
  }
}
