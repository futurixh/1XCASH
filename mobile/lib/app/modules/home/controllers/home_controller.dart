import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:x1xcash/app/core/models/transaction.model.dart';
import 'package:x1xcash/app/core/models/wallet.model.dart';
import 'package:x1xcash/app/core/services/api/api.service.dart';
import 'package:x1xcash/locator.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final isIsOnLogout = false.obs;
  final wallet = Wallet().obs;
  final transactions = <Transaction>[].obs;
  final apiService = locator<ApiService>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await apiService.getMyWallet().then(
      (value) {
        wallet(value);
      },
    );
    await apiService.getTransactions().then((value) {
      transactions(value);
      log(value.toString());
    });
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  void setIsOnLogout() => isIsOnLogout.value = !isIsOnLogout.value;

  Future<void> logout(context) async {
    setIsOnLogout();
    const storage = FlutterSecureStorage();
    await storage.deleteAll().then(
          (value) => Navigator.of(context)
              .pushNamedAndRemoveUntil('/', (route) => false),
        );
    setIsOnLogout();
  }
}
