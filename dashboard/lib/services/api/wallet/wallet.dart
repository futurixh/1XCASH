import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_web_seo/models/wallet.model.dart';
import 'package:flutter_web_seo/services/api/auth/auth.dart';
import 'package:flutter_web_seo/services/api/requests/dio.dart';

import '../../../models/transaction.model.dart';
import '../api.service.dart';
import '../requests/endpoints.dart';

extension Wallets on ApiService {

  Future<List<Wallet>> getWallets() async {
    List<Wallet> wallets = [];
    String token = await getBearerToken();

    try {
      final response = await dio.get(
        Endpoints.getWallets,
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );

      final rawWallets = response.data['wallets'];
      for (var i = 0; i < rawWallets.length; i++) {
        wallets.add(Wallet.fromJson(rawWallets[i]));
      }
      print(token);
      return wallets;
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
          print(e.response!.headers);
          print(e.response!.requestOptions);
        }
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        if (kDebugMode) {
          print(e.requestOptions);
          print(e.message);
        }
      }
    }
    return wallets;
  }

  Future<Wallet?> getMyWallet() async {
    String token = await getBearerToken();

    try {
      final response = await dio.get(
        Endpoints.getMyWallet,
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );

      final wallet = Wallet.fromJson(response.data["wallet"]);

      return wallet;
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

  Future<String?> deleteWallet(String id) async {
    String token = await getBearerToken();

    try {
      final response = await dio.delete(
        Endpoints.deleteWallet + id,
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );

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
          print(e.response!.headers);
          print(e.response!.requestOptions);
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

  Future<Wallet?> makeOperation(String id, String amount, String type) async {
    String token = await getBearerToken();

    try {
      final response = await dio.post(
        Endpoints.makeOperation + id,
        data: {"amount": amount, "type": type},
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );

      final wallet = Wallet.fromJson(response.data["wallet"]);

      return wallet;
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

  Future<Transaction?> makeBetOperation(String id, String? telephone, String amount, String type) async {
    String token = await getBearerToken();

    try {
      final response = await dio.post(
        Endpoints.makeBetOperation,
        data: {"id_1xbet": id, "amount": amount, "type": type, "client_telephone": telephone},
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );
      final transaction = Transaction.fromJson(response.data["transaction"]);

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
}