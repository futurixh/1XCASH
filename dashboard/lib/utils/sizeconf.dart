import 'package:flutter/material.dart';

class GetSizePerScreen {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

extension PercentSized on double {
  double get hp => (GetSizePerScreen.screenHeight * (this / 100));
  double get wp => (GetSizePerScreen.screenWidth * (this / 100));
}

extension ResponsiveText on double {
  double get sp => GetSizePerScreen.screenWidth / 100 * (this / 3);
}

