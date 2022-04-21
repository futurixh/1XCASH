import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:x1xcash/app/modules/connection/views/connection_form_view.dart';
import 'package:x1xcash/app/modules/connection/views/login_view.dart';
import 'package:x1xcash/app/modules/home/views/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () async {
        const storage = FlutterSecureStorage();

        try {
          final token = await storage.read(key: 'token');

          if (token == null) {
            Get.to(
              () => const LoginView(),
            );
          } else {
            Get.to(
              () => HomeView(),
            );
          }
        } catch (e) {
          Get.to(
            () => const LoginView(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
