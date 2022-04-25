import 'package:flutter/cupertino.dart';
import 'package:flutter_web_seo/components/users_table.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  static String routeName = 'User';

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UsersTable(),
      ],
    );
  }
}
