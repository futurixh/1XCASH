
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_seo/dashboard_screen.dart';
import 'package:flutter_web_seo/pages/transaction.view.dart';
import 'package:flutter_web_seo/pages/transaction_add.view.dart';
import 'package:flutter_web_seo/pages/transaction_edit.view.dart';
import 'package:flutter_web_seo/pages/user.view.dart';
import 'package:flutter_web_seo/pages/user_add.view.dart';
import 'package:flutter_web_seo/pages/user_edit.view.dart';
import 'package:flutter_web_seo/pages/wallet.view.dart';
import 'package:flutter_web_seo/pages/wallet_add.view.dart';
import 'package:flutter_web_seo/pages/wallet_edit.view.dart';
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
          const DrawerHeader(
            child: Center(
              child: Text('1xCash', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
            ),
          ),
          DrawerListTile(
            active: QR.isCurrentName(DashboardScreen.routeName) ? true : false,
            title: DashboardScreen.routeName,
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () => {QR.toName(DashboardScreen.routeName)},
          ),
          DrawerListTile(
            active: QR.isCurrentName(UserView.routeName) ||  QR.isCurrentName(UserEdit.routeName)||  QR.isCurrentName(UserAdd.routeName)  ? true : false,
            title: UserView.routeName,
            svgSrc: "assets/icons/menu_profile.svg",
            press: () => QR.toName(UserView.routeName),
          ),
          DrawerListTile(
            active: QR.isCurrentName(TransactionView.routeName) ||  QR.isCurrentName(TransactionEdit.routeName)||  QR.isCurrentName(TransactionAdd.routeName) ? true : false,
            title: TransactionView.routeName,
            svgSrc: "assets/icons/menu_tran.svg",
            press: () => QR.toName(TransactionView.routeName),
          ),
          DrawerListTile(
            active: QR.isCurrentName(WalletView.routeName) ||  QR.isCurrentName(WalletEdit.routeName)||  QR.isCurrentName(WalletAdd.routeName)  ? true : false,
            title: WalletView.routeName,
            svgSrc: "assets/icons/menu_store.svg",
            press: () => QR.toName(WalletView.routeName),
          ),
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
