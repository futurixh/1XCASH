import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:x1xcash/locator.dart';

import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

globalInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Firebase.initializeApp();
}

void main() async {
  await globalInitializer();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "1xCash",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
