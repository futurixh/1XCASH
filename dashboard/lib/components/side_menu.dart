
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_seo/pages/dashboard.view.dart';
import 'package:flutter_web_seo/pages/demand.view.dart';
import 'package:flutter_web_seo/pages/depositCode.view.dart';
import 'package:flutter_web_seo/pages/operation.view.dart';
import 'package:flutter_web_seo/pages/operation_one_xbet.view.dart';
import 'package:flutter_web_seo/pages/transaction.view.dart';
import 'package:flutter_web_seo/pages/transaction_add.view.dart';
import 'package:flutter_web_seo/pages/transaction_edit.view.dart';
import 'package:flutter_web_seo/pages/user.view.dart';
import 'package:flutter_web_seo/pages/user_add.view.dart';
import 'package:flutter_web_seo/pages/user_edit.view.dart';
import 'package:flutter_web_seo/pages/wallet.view.dart';
import 'package:flutter_web_seo/pages/wallet_add.view.dart';
import 'package:flutter_web_seo/pages/wallet_edit.view.dart';
import 'package:flutter_web_seo/utils/sizeconf.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../models/user.model.dart';
import '../pages/withdrawalCode.view.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  static const storage = FlutterSecureStorage();
  User? currentUser;

  Future getCurrentUser() async {
    await storage.read(key: 'user').
    then((value) {
      if (mounted) {
        setState(() {
          currentUser = User.fromJson(json.decode(value!));
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: HexColor("66C48F"),
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Text('1xCash', style: TextStyle(fontSize: 4.00.sp, fontWeight: FontWeight.bold, color: Colors.white),),
            ),
          ),
          DrawerListTile(
            visible: true,
            active: QR.isCurrentName(DashboardScreen.routeName) ? true : false,
            title: DashboardScreen.routeName,
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () => {QR.toName(DashboardScreen.routeName)},
          ),
          DrawerListTile(
            visible: currentUser?.role == "admin" ? true : false,
            active: QR.isCurrentName(UserView.routeName) ||  QR.isCurrentName(UserEdit.routeName)||  QR.isCurrentName(UserAdd.routeName)  ? true : false,
            title: UserView.routeName,
            svgSrc: "assets/icons/menu_profile.svg",
            press: () => QR.toName(UserView.routeName),
          ),
          DrawerListTile(
            visible: currentUser?.role == "admin" || currentUser?.role == "super-merchant" ? true : false,
            active: QR.isCurrentName(TransactionView.routeName) ||  QR.isCurrentName(TransactionEdit.routeName)||  QR.isCurrentName(TransactionAdd.routeName) || QR.isCurrentName(OperationView.routeName) ? true : false,
            title: TransactionView.routeName,
            svgSrc: "assets/icons/menu_tran.svg",
            press: () => QR.toName(TransactionView.routeName),
          ),
          DrawerListTile(
            visible: currentUser?.role == "admin" ? true : false,
            active: QR.isCurrentName(WalletView.routeName) ||  QR.isCurrentName(WalletEdit.routeName)||  QR.isCurrentName(WalletAdd.routeName)  ? true : false,
            title: WalletView.routeName,
            svgSrc: "assets/icons/menu_store.svg",
            press: () => QR.toName(WalletView.routeName),
          ),
          DrawerListTile(
            visible: currentUser?.role == "admin" ? true : false,
            active: QR.isCurrentName(DepositCodeView.routeName) ? true : false,
            title: DepositCodeView.routeName,
            svgSrc: "assets/icons/money.svg",
            press: () => QR.toName(DepositCodeView.routeName),
          ),
          DrawerListTile(
            visible: currentUser?.role == "admin" ? true : false,
            active: QR.isCurrentName(WithdrawalCodeView.routeName) ? true : false,
            title: WithdrawalCodeView.routeName,
            svgSrc: "assets/icons/money.svg",
            press: () => QR.toName(WithdrawalCodeView.routeName),
          ),
          DrawerListTile(
            visible: currentUser?.role == "super-merchant" || currentUser?.role == "merchant"  ? true : false,
            active: QR.isCurrentName(DemandView.routeName)  ? true : false,
            title: DemandView.routeName,
            svgSrc: "assets/icons/money.svg",
            press: () => QR.toName(DemandView.routeName),
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
    required this.visible,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool active, visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(
          svgSrc,
          color: active ? Colors.white : Colors.white54,
          height: 1.80.hp,
        ),
        title: Text(
          title,
          style: TextStyle(color: active ? Colors.white : Colors.white54),
        ),
      ),
    );
  }
}
