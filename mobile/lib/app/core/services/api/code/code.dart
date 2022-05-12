import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:x1xcash/app/core/models/code.model.dart';
import 'package:x1xcash/app/core/services/api/api.service.dart';
import 'package:x1xcash/app/core/services/api/requests/endpoints.dart';
import '../requests/dio.dart';

extension CodeGenerator on ApiService {
  Future<Code?> generateDepositCode({required int amount}) async {
    String token = await getBearerToken();

    try {
      final response = await dio.post(
        Endpoints.generateCodeDeposit,
        data: {
          "amount": amount,
        },
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );

      log(response.data.toString());
      return Code.fromJson(response.data['depositCode']);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Code?> generateWithdrawalCode({required int amount}) async {
    String token = await getBearerToken();

    try {
      final response = await dio.post(
        Endpoints.generateCodeWithdrawal,
        data: {
          "amount": amount,
        },
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );
      return Code.fromJson(response.data['withdrawalCode']);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
