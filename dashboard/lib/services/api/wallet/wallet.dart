import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_seo/models/wallet.model.dart';
import 'package:flutter_web_seo/services/api/auth/auth.dart';
import 'package:flutter_web_seo/services/api/requests/dio.dart';

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
      return wallets;
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
    return wallets;
  }

}