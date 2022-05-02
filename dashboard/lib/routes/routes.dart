import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_seo/pages/dashboard.view.dart';
import 'package:flutter_web_seo/components/main_layout.dart';
import 'package:flutter_web_seo/pages/login.view.dart';
import 'package:flutter_web_seo/pages/demand.view.dart';
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
import 'package:flutter_web_seo/routes/auth.middleware.dart';
import 'package:qlevar_router/qlevar_router.dart';


class AppRoutes {
  static List<QRoute> routes = [
    QRoute(
        name: DashboardScreen.routeName,
        pageType: QFadePage(),
        path: '/',
        builder: () => MainLayout(
          widget: DashboardScreen(),
          pageName: DashboardScreen.routeName,
        ),
        middleware: [
          AuthMiddleware(),
        ]),
    QRoute(
      name: 'Login',
      pageType: QFadePage(),
      path: '/login',
      middleware: [LoginMiddleware()],
      builder: () => LoginView(),
    ),
    QRoute(
      name: DemandView.routeName,
      pageType: QFadePage(),
      path: '/demand',
      builder: () => MainLayout(
        widget: DemandView(),
        pageName: DemandView.routeName,
      ),
      middleware: [
        AuthMiddleware(),
      ],
    ),
    QRoute(
        name: WalletView.routeName,
        pageType: QFadePage(),
        path: '/wallet',
        builder: () => MainLayout(
              widget: WalletView(),
              pageName: WalletView.routeName,
            ),
        middleware: [
          AuthMiddleware(),
        ],
        children: [
          QRoute(
            name: WalletAdd.routeName,
            path: '/add',
            builder: () => MainLayout(
              widget: WalletAdd(),
              pageName: WalletAdd.routeName,
            ),
          ),
          QRoute(
            name: WalletEdit.routeName,
            path: '/edit/:id',
            builder: () => MainLayout(
              widget: WalletEdit(),
              pageName: WalletEdit.routeName,
            ),
          ),
        ]),
    QRoute(
        name: UserView.routeName,
        pageType: QFadePage(),
        path: '/user',
        builder: () => MainLayout(
              widget: UserView(),
              pageName: UserView.routeName,
            ),
        middleware: [
          AuthMiddleware(),
        ],
        children: [
          QRoute(
            name: UserAdd.routeName,
            path: '/add',
            builder: () => MainLayout(
              widget: UserAdd(),
              pageName: UserAdd.routeName,
            ),
          ),
          QRoute(
            name: UserEdit.routeName,
            path: '/edit/:id',
            builder: () => MainLayout(
              widget: UserEdit(),
              pageName: UserEdit.routeName,
            ),
          ),
        ]),
    QRoute(
        name: TransactionView.routeName,
        pageType: QFadePage(),
        path: '/transaction',
        builder: () => MainLayout(
          widget: TransactionView(),
          pageName: TransactionView.routeName,
        ),
        middleware: [
          AuthMiddleware(),
        ],
        children: [
          QRoute(
            name: TransactionAdd.routeName,
            path: '/add',
            builder: () => MainLayout(
              widget: TransactionAdd(),
              pageName: TransactionAdd.routeName,
            ),
          ),
          QRoute(
            name: TransactionEdit.routeName,
            path: '/edit/:id',
            builder: () => MainLayout(
              widget: TransactionEdit(),
              pageName: TransactionEdit.routeName,
            ),
          ),
          QRoute(
            name: OperationView.routeName,
            pageType: QFadePage(),
            path: '/operation/:id/:amount/:type',
            builder: () => MainLayout(
              widget: OperationView(),
              pageName: OperationView.routeName,
            ),
          ),
        ]
    ),
    QRoute(
      name: OperationBetView.routeName,
      pageType: QFadePage(),
      path: '/operation-1xbet',
      builder: () => MainLayout(
        widget: OperationBetView(),
        pageName: OperationBetView.routeName,
      ),
      middleware: [
        AuthMiddleware(),
      ],
    ),
  ];
}
