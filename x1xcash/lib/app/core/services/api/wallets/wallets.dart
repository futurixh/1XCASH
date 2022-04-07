import 'dart:developer';

import 'package:x1xcash/app/core/models/wallet.model.dart';
import 'package:x1xcash/app/core/services/api/api.service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:x1xcash/app/core/services/api/requests/endpoints.dart';
import '../requests/dio.dart';
import '../auth/auth.dart';

extension Wallets on ApiService {
  Future<Wallet?> getMyWallet() async {
    String token = await getBearerToken();

    log(token);
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

      return Wallet.fromJson(response.data['wallet']);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
