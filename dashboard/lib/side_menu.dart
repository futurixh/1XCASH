
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_seo/dashboard_screen.dart';
import 'package:flutter_web_seo/pages/transaction.view.dart';
import 'package:qlevar_router/qlevar_router.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Text('1xcash', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
            ),
          ),
          DrawerListTile(
            active: QR.isCurrentName(DashboardScreen.routeName) ? true : false,
            title: DashboardScreen.routeName,
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () => {QR.toName(DashboardScreen.routeName)},
          ),
          DrawerListTile(
            active: QR.isCurrentName(TransactionView.routeName) ? true : false,
            title: TransactionView.routeName,
            svgSrc: "assets/icons/menu_tran.svg",
            press: () => QR.toName(TransactionView.routeName),
          ),
/*          DrawerListTile(
            active: router.routeName == "Task" ? true : false,
            title: "Task",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {},
          ),
          DrawerListTile(
            active: router.routeName == "Documents" ? true : false,
            title: "Documents",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {},
          ),
          DrawerListTile(
            active: router.routeName == "Store" ? true : false,
            title: "Store",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {},
          ),
          DrawerListTile(
            active: router.routeName == "Notification" ? true : false,
            title: "Notification",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {},
          ),
          DrawerListTile(
            active: router.routeName == "Profile" ? true : false,
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {},
          ),
          DrawerListTile(
            active: router.routeName == "Settings" ? true : false,
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),*/
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.active,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: active ? Colors.white : Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: active ? Colors.white : Colors.white54),
      ),
    );
  }
}
