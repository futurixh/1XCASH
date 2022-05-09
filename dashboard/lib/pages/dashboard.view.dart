import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_seo/components/header.dart';
import 'package:flutter_web_seo/components/loader_widget.dart';
import 'package:flutter_web_seo/components/my_fields.dart';
import 'package:flutter_web_seo/components/my_transactions_table.dart';
import 'package:flutter_web_seo/components/my_wallet.dart';
import 'package:flutter_web_seo/components/recent_files.dart';
import 'package:flutter_web_seo/services/api/wallet/wallet.dart';
import 'package:flutter_web_seo/utils/constants.dart';
import 'package:flutter_web_seo/utils/responsive.dart';
import 'package:flutter_web_seo/utils/sizeconf.dart';

import '../models/user.model.dart';
import '../models/wallet.model.dart';
import '../services/api/api.service.dart';
import '../utils/locator.dart';

class DashboardScreen extends StatefulWidget {
  static String routeName = 'Dashboard';

  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  static const storage = FlutterSecureStorage();
  final apiService = locator<ApiService>();
  User? currentUser;
  Wallet? myWallet;

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
    return Column(
      children: [
        currentUser != null ? Visibility(visible: (currentUser?.role != "admin"), child: MyWalletCard(currentUser: currentUser)) : SizedBox(height: 6.00.hp, width: 3.00.wp, child: const Loader(),),
        SizedBox(height: 2.00.hp),
        currentUser != null ? Visibility(visible: (currentUser?.role != "admin"), child: MyTransactions(currentUser: currentUser)) : SizedBox(height: 6.00.hp, width: 3.00.wp, child: const Loader(),),
        //const RecentFiles(),
      ],
    );
  }
}
