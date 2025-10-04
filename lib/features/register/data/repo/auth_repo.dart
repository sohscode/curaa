import 'dart:developer';
import '../../../../core/networking/service/dio.dart';
import '../../../../core/networking/service/end_points.dart';
import '../../../../core/utils/app_functions/app_functions.dart';
import '../model/create_account_model.dart';

class CreateAccountRepo{

  static Future createAccount({required CreateAccountModel user}) async {
    try {

      final response = await DioHelper.postData(
        endPoint: EndPoints.register,
        data: {
          "name": user.name,
          "email": user.email,
          "password": user.password,
        },
      );
      if (response?.statusCode == 200|| response?.statusCode == 201) {
       AppFunctions.saveUserToken(token: response?.data['access_token']);
        return response?.data ;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
