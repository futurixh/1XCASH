import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_seo/services/api/auth/auth.dart';
import 'package:flutter_web_seo/services/api/requests/dio.dart';

import '../../../models/transaction.model.dart';
import '../api.service.dart';
import '../requests/endpoints.dart';

extension Transactions on ApiService {

  Future<List<Transaction>> getTransactions() async {
    List<Transaction> transactions = [];
    String token = await getBearerToken();

    try {
      final response = await dio.get(
        Endpoints.getTransactions,
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
    } on DioError catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          print(e.response!.data);
          print(e.response!.headers);
          print(e.response!.requestOptions);
        }
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
    return transactions;
  }

}