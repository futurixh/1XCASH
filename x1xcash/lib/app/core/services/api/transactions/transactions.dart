import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:x1xcash/app/core/models/transaction.model.dart';
import 'package:x1xcash/app/core/services/api/api.service.dart';
import 'package:x1xcash/app/core/services/api/requests/endpoints.dart';
import '../auth/auth.dart';
import '../requests/dio.dart';

extension Transactions on ApiService {
  Future<List<Transaction>?> getTransactions() async {}

  Future<dynamic> makeDeposit(String xbetId, String amount) async {
    String token = await getBearerToken();

    try {
      final response = await dio.post(
        Endpoints.make1xbetTransaction,
        data: {
          "amount": amount,
          "type": "credit",
          "id_1xbet": xbetId,
        },
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );
      return response.data;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<dynamic> makeWithdrawal(String xbetId, String amount) async {
    String token = await getBearerToken();

    try {
      final response = await dio.post(
        Endpoints.make1xbetTransaction,
        data: {
          "amount": amount,
          "type": "debit",
          "id_1xbet": xbetId,
        },
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );
      return response.data;
    } catch (e) {
      log(e.toString());
    }
  }
}
