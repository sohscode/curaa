import 'dart:developer';
import 'package:curaa/core/networking/service/dio.dart';
import 'package:curaa/core/networking/service/end_points.dart';
import '../model/pharmacy_model.dart';
class HomeRepo {
  static Future getPharmacy() async {
    try {
      final response = await DioHelper.getData(endPoint: EndPoints.pharmacies);
      if (response?.statusCode == 200||response?.statusCode == 201) {
        log(response!.data['data'].toString());
        List<PharmacyModel> pharmacies = List.from(response.data['data']??[] )
            .map((pharmacy) => PharmacyModel.fromJson(pharmacy))
            .toList();
        log(pharmacies.toString());
        return pharmacies;
      }
    }  catch (e) {
      log(e.toString());
      return [];
    }
  }
}
