import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:x1xcash/locator.dart';

import 'app/routes/app_pages.dart';

void main() {
  setupLocator();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "1xCash",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
