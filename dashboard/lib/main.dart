import 'package:flutter/material.dart';
import 'package:flutter_web_seo/constants.dart';
import 'package:flutter_web_seo/pages/home.view.dart';
import 'package:flutter_web_seo/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:seo_renderer/helpers/robot_detector_vm.dart';

import 'locator.dart';

void main() {
  QR.setUrlStrategy();
  setupLocator();
  runApp(
    const RobotDetector(
      debug: true,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: const QRouteInformationParser(),
      routerDelegate: QRouterDelegate(AppRoutes.routes),
      debugShowCheckedModeBanner: false,
      title: 'flutter_web_seo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
    );
  }
}
