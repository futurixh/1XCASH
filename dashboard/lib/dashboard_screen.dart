import 'package:flutter/material.dart';
import 'package:flutter_web_seo/components/header.dart';
import 'package:flutter_web_seo/components/my_fields.dart';
import 'package:flutter_web_seo/components/recent_files.dart';
import 'package:flutter_web_seo/constants.dart';
import 'package:flutter_web_seo/responsive.dart';

class DashboardScreen extends StatelessWidget {
  static String routeName = 'Dashboard';

  DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyFiles(),
        SizedBox(height: defaultPadding),
        RecentFiles(),
      ],
    );
  }
}