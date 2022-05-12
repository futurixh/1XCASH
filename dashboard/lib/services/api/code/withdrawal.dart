import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_web_seo/services/api/api.service.dart';
import 'package:flutter_web_seo/services/api/auth/auth.dart';
import 'package:flutter_web_seo/services/api/requests/dio.dart';
import 'package:dio/dio.dart';

import '../../../models/withdrawal-code.model.dart';
import '../requests/endpoints.dart';

extension WithdrawalCodes on ApiService {
  Future<List<WithdrawalCode>> getWithdrawalCodes() async {
    List<WithdrawalCode> withdrawalCodes = [];
    String token = await getBearerToken();

    try {
      final response = await dio.get(
        Endpoints.getWithdrawalCode,
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );

      final rawTransactions = response.data['withdrawalCodes'];
      for (var i = 0; i < rawTransactions.length; i++) {
        withdrawalCodes.add(WithdrawalCode.fromJson(rawTransactions[i]));
      }
      EasyLoading.showSuccess("Succès", duration: const Duration(seconds: 3));
      return withdrawalCodes;
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
    return withdrawalCodes;
  }
}