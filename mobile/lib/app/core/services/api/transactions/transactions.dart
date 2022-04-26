import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:x1xcash/app/core/models/transaction.model.dart';
import 'package:x1xcash/app/core/services/api/api.service.dart';
import 'package:x1xcash/app/core/services/api/requests/endpoints.dart';
import '../auth/auth.dart';
import '../requests/dio.dart';

extension Transactions on ApiService {
  Future<List<Transaction>> getTransactions() async {
    List<Transaction> transactions = [];
    String token = await getBearerToken();

    try {
      final response = await dio.get(
        Endpoints.transaction,
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );

      final rawTransactions = response.data['transactions'];
      for (var i = 0; i < rawTransactions.length; i++) {
        transactions.add(Transaction.fromJson(rawTransactions[i]));
      }
      return transactions;
    } catch (e) {
      log(e.toString());
    }
    return transactions;
  }

  Future<dynamic> makeDeposit(String xbetId, String amount) async {
    String token = await getBearerToken();

    try {
      final response = await dio.post(
        Endpoints.make1xbetTransaction,
        data: {
          "amount": int.parse(amount),
          "type": "deposit",
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

  Future<dynamic> makeWithdrawal(
      String xbetId, String amount, String clientPhone) async {
    String token = await getBearerToken();

    try {
      final response = await dio.post(
        Endpoints.make1xbetTransaction,
        data: {
          "amount": int.parse(amount),
          "type": "withdrawal",
          "id_1xbet": xbetId,
          "client_telephone": clientPhone,
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
