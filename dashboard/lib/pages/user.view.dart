import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_seo/components/users_table.dart';

import '../utils/locator.dart';
import '../models/user.model.dart';
import '../services/api/api.service.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  static String routeName = 'User';

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
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
        UsersTable(currentUser: currentUser,),
      ],
    );
  }
}
