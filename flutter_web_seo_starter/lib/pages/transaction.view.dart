import 'package:flutter/material.dart';
import 'package:flutter_web_seo/components/transactions_table.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({Key? key}) : super(key: key);

  static String routeName = 'Transaction';

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionsTable(),
      ],
    );
  }
}
