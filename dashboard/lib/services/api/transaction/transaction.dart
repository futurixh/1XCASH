import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
      EasyLoading.showSuccess("Succès", duration: const Duration(seconds: 3));
      return transactions;
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
    return transactions;
  }

  Future<String?> deleteTransaction(String id) async {
    String token = await getBearerToken();

    try {
      final response = await dio.delete(
        Endpoints.deleteTransaction + id,
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );
      EasyLoading.showSuccess("Succès", duration: const Duration(seconds: 3));
      return response.data["message"];
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
        if (kDebugMode) {
          print(e.requestOptions);
          print(e.message);
        }
      }
    }
    return null;
  }

  Future<List<Transaction>> getMyTransaction() async {
    List<Transaction> transactions = [];
    String token = await getBearerToken();

    try {
      final response = await dio.get(
        Endpoints.getMyTransactions,
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
      EasyLoading.showSuccess("Succès", duration: const Duration(seconds: 3));
      return transactions;
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
        if (kDebugMode) {
          print(e.requestOptions);
          print(e.message);
        }
      }
    }
    return transactions;
  }

  Future<Transaction?> makeDemand(String amount) async {
    String token = await getBearerToken();

    try {
      final response = await dio.post(
        Endpoints.makeDemand,
        data: {"amount": amount},
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );

      final transaction = Transaction.fromJson(response.data["transaction"]);
      EasyLoading.showSuccess("Succès", duration: const Duration(seconds: 3));
      return transaction;
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
        if (kDebugMode) {
          print(e.requestOptions);
          print(e.message);
        }
      }
    }
    return null;
  }

  Future<Transaction?> validateTransaction(String id) async {
    String token = await getBearerToken();

    try {
      final response = await dio.put(
        Endpoints.validateTransaction + id,
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );

      final transaction = Transaction.fromJson(response.data["transaction"]);
      EasyLoading.showSuccess("Succès", duration: const Duration(seconds: 3));
      return transaction;
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.data["message"] != null) {
          EasyLoading.showError(e.response!.data["message"], duration: const Duration(seconds: 3));
        }
        if (e.response!.data["errors"] != null) {
          EasyLoading.showError(e.response!.data["errors"].toString(), duration: const Duration(seconds: 3));
        }
        if (kDebugMode) {
          print(e.response!.data["message"]);
        }
      } else {
        if (kDebugMode) {
          print(e.message);
        }
      }
    }
    return null;
  }

}