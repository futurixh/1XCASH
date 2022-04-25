import 'package:flutter/cupertino.dart';
import 'package:qlevar_router/qlevar_router.dart';

class UserEdit extends StatefulWidget {
  static String routeName = 'User Edit';

  const UserEdit({Key? key}) : super(key: key);

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  final id = QR.params['id'].toString();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(id),
    );
  }
}
