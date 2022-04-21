import 'package:flutter/material.dart';
import 'package:flutter_web_seo/pages/home.view.dart';
import 'package:flutter_web_seo/responsive.dart';
import 'package:flutter_web_seo/side_menu.dart';
import 'package:qlevar_router/qlevar_router.dart';

class MainLayout extends StatefulWidget {
  final Widget widget;
  const MainLayout({Key? key, required this.widget}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: widget.widget,
            ),
          ],
        ),
      ),
    );
  }
}
