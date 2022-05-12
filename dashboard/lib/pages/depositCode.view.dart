import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_seo/components/depositCodes_table.dart';
import 'package:flutter_web_seo/components/users_table.dart';

import '../utils/locator.dart';
import '../models/user.model.dart';
import '../services/api/api.service.dart';

class DepositCodeView extends StatefulWidget {
  const DepositCodeView({Key? key}) : super(key: key);

  static String routeName = 'Deposit Code';

  @override
  State<DepositCodeView> createState() => _DepositCodeViewState();
}

class _DepositCodeViewState extends State<DepositCodeView> {
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
      children:  [
        DepositCodeTable(currentUser: currentUser,),
      ],
    );
  }
}
