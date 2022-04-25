import 'package:flutter_web_seo/dashboard_screen.dart';
import 'package:flutter_web_seo/main_layout.dart';
import 'package:flutter_web_seo/pages/home.view.dart';
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

class AppRoutes {
  static List<QRoute> routes = [
/*    QRoute.withChild(
        path: '/app',
        builderChild: (child) => MainLayout(router: child),
        children: [
          QRoute(
              name: DashboardScreen.routeName,
              path: 'home',
              builder: () => DashboardScreen(),
          ),
          QRoute(
            name: TransactionView.routeName,
            path: 'transaction',
            builder: () => TransactionView(),
          ),
        ]
    ),*/
    QRoute(
      name: DashboardScreen.routeName,
      pageType: QFadePage(),
      path: '/',
      builder: () => MainLayout(widget: DashboardScreen(), pageName: DashboardScreen.routeName,),
    ),
    QRoute(
      name: TransactionView.routeName,
      pageType: QFadePage(),
      path: '/transaction',
      builder: () => MainLayout(widget: TransactionView(), pageName: TransactionView.routeName,),
      children: [
        QRoute(
          name: TransactionAdd.routeName,
          path: '/add',
          builder: () => MainLayout(widget: TransactionAdd(), pageName: TransactionAdd.routeName,),
        ),
        QRoute(
          name: TransactionEdit.routeName,
          path: '/edit/:id',
          builder: () => MainLayout(widget: TransactionEdit(), pageName: TransactionEdit.routeName,),
        ),
      ]
    ),
    QRoute(
      name: WalletView.routeName,
      pageType: QFadePage(),
      path: '/wallet',
      builder: () => MainLayout(widget: WalletView(), pageName: WalletView.routeName,),
      children: [
        QRoute(
          name: WalletAdd.routeName,
          path: '/add',
          builder: () => MainLayout(widget: WalletAdd(), pageName: WalletAdd.routeName,),
        ),
        QRoute(
          name: WalletEdit.routeName,
          path: '/edit/:id',
          builder: () => MainLayout(widget: WalletEdit(), pageName: WalletEdit.routeName,),
        ),
      ]
    ),
    QRoute(
      name: UserView.routeName,
      pageType: QFadePage(),
      path: '/user',
      builder: () => MainLayout(widget: UserView(), pageName: UserView.routeName,),
      children: [
        QRoute(
          name: UserAdd.routeName,
          path: '/add',
          builder: () => MainLayout(widget: UserAdd(), pageName: UserAdd.routeName,),
        ),
        QRoute(
          name: UserEdit.routeName,
          path: '/edit/:id',
          builder: () => MainLayout(widget: UserEdit(), pageName: UserEdit.routeName,),
        ),
      ]
    ),
  ];
}
