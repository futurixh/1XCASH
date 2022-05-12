import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_web_seo/models/deposit-code.model.dart';
import 'package:flutter_web_seo/services/api/api.service.dart';
import 'package:flutter_web_seo/services/api/auth/auth.dart';
import 'package:flutter_web_seo/services/api/requests/dio.dart';
import 'package:dio/dio.dart';

import '../requests/endpoints.dart';

extension DepositCodes on ApiService {
  Future<List<DepositCode>> getDepositCodes() async {
    List<DepositCode> depositCodes = [];
    String token = await getBearerToken();

    try {
      final response = await dio.get(
        Endpoints.getDepositCode,
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );

      final rawTransactions = response.data['depositCodes'];
      for (var i = 0; i < rawTransactions.length; i++) {
        depositCodes.add(DepositCode.fromJson(rawTransactions[i]));
      }
      EasyLoading.showSuccess("Succès", duration: const Duration(seconds: 3));
      return depositCodes;
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.data["message"] != null) {
          EasyLoading.showError(e.response!.data["message"], duration: const Duration(seconds: 3));
        }
        if (e.response!.data["errors"] != null) {
          EasyLoading.showError(e.response!.data["errors"].toString(), duration: const Duration(seconds: 3));
        }
        if (kDebugMode) {
          print(e.response!.data);
        }
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
    return depositCodes;
  }
}