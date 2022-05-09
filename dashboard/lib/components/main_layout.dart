import 'package:flutter/material.dart';
import 'package:flutter_web_seo/components/header.dart';
import 'package:flutter_web_seo/utils/constants.dart';
import 'package:flutter_web_seo/pages/home.view.dart';
import 'package:flutter_web_seo/utils/responsive.dart';
import 'package:flutter_web_seo/components/side_menu.dart';
import 'package:flutter_web_seo/utils/sizeconf.dart';
import 'package:qlevar_router/qlevar_router.dart';

class MainLayout extends StatefulWidget {
  final Widget widget;
  final String pageName;
  const MainLayout({Key? key, required this.widget, required this.pageName}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final ScrollController _controller = ScrollController();
  @override

  Widget build(BuildContext context) {
    GetSizePerScreen().init(context);
    return Scaffold(
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: SafeArea(
                child: SingleChildScrollView(
                  controller: _controller,
                  padding: EdgeInsets.all(3.00.hp),
                  child: Column(
                    children: [
                      Header(pageName: widget.pageName),
                      SizedBox(height: 10.00.hp),
                      widget.widget
                    ],
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
