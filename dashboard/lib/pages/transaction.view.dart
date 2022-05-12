import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_seo/components/transactions_table.dart';

import '../utils/locator.dart';
import '../models/user.model.dart';
import '../services/api/api.service.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({Key? key}) : super(key: key);

  static String routeName = 'Transaction';

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  static const storage = FlutterSecureStorage();
  final apiService = locator<ApiService>();
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

  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionsTable(currentUser: currentUser,),
      ],
    );
  }
}
