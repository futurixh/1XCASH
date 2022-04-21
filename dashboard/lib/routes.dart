import 'package:flutter_web_seo/dashboard_screen.dart';
import 'package:flutter_web_seo/main_layout.dart';
import 'package:flutter_web_seo/pages/home.view.dart';
import 'package:flutter_web_seo/pages/transaction.view.dart';
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
      path: '/',
      builder: () => MainLayout(widget: DashboardScreen()),
    ),
    QRoute(
      name: TransactionView.routeName,
      path: '/transaction',
      builder: () => MainLayout(widget: TransactionView()),
    ),
  ];
}
