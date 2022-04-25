import 'package:flutter/cupertino.dart';
import 'package:qlevar_router/qlevar_router.dart';

class TransactionEdit extends StatefulWidget {
  static String routeName = 'Transaction Edit';

  const TransactionEdit({Key? key}) : super(key: key);

  @override
  State<TransactionEdit> createState() => _TransactionEditState();
}

class _TransactionEditState extends State<TransactionEdit> {
  final id = QR.params['id'].toString();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(id),
    );
  }
}
