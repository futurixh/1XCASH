import 'package:flutter/cupertino.dart';
import 'package:qlevar_router/qlevar_router.dart';

class WalletEdit extends StatefulWidget {
  static String routeName = 'Wallet Edit';
  const WalletEdit({Key? key}) : super(key: key);

  @override
  State<WalletEdit> createState() => _WalletEditState();
}

class _WalletEditState extends State<WalletEdit> {
  final id = QR.params['id'].toString();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(id),
    );
  }
}
