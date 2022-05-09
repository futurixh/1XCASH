import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_web_seo/utils/constants.dart';
import 'package:flutter_web_seo/pages/home.view.dart';
import 'package:flutter_web_seo/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/number_symbols.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:seo_renderer/helpers/robot_detector_vm.dart';

import 'utils/locator.dart';

void main() {
  numberFormatSymbols['zz'] = const NumberSymbols(
    NAME: 'zz',
    DECIMAL_SEP: ".",
    GROUP_SEP: '.',
    PERCENT: '%',
    ZERO_DIGIT: '0',
    PLUS_SIGN: '+',
    MINUS_SIGN: '-',
    EXP_SYMBOL: 'e',
    PERMILL: '\u2030',
    INFINITY: '\u221E',
    NAN: 'NaN',
    DECIMAL_PATTERN: '#,##0.###',
    SCIENTIFIC_PATTERN: '#E0',
    PERCENT_PATTERN: '#,##0%',
    CURRENCY_PATTERN: '\u00A4#,##0.00',
    DEF_CURRENCY_CODE: 'AUD',
  );
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
      builder: EasyLoading.init(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
    );
  }
}
