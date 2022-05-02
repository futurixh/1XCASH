import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_seo/services/api/transaction/transaction.dart';
import 'package:flutter_web_seo/utils/sizeconf.dart';

import '../models/transaction.model.dart';
import '../models/user.model.dart';
import '../services/api/api.service.dart';
import '../utils/constants.dart';
import '../utils/locator.dart';
import 'loader_widget.dart';

final apiService = locator<ApiService>();

class MyTransactions extends StatefulWidget {
  final User? currentUser;
  const MyTransactions({Key? key, this.currentUser}) : super(key: key);

  @override
  State<MyTransactions> createState() => _MyTransactionsState();
}

class _MyTransactionsState extends State<MyTransactions> {
  bool _isActive = false;
  List transactions = <Transaction>[];

  Future getTransactions() async {
    setState(() {
      _isActive = true;
    });
    await apiService.getMyTransaction().then((value) {
      if (mounted) {
        setState(() {
          transactions = value;
          _isActive = false;
        });
      }
    });
  }

  DataRow transactionsDataRow(Transaction transaction) {
    return DataRow(
      cells: [
        DataCell(Text(transaction.amount!.toString())),
        DataCell(Text(transaction.type!)),
        DataCell(Text(transaction.status!)),
        DataCell(
          Text("${transaction.wallet!.user!.firstname!} ${transaction.wallet!.user!.lastname!}"),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    getTransactions();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Mes transactions",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        SizedBox(height: 2.00.hp),
        Container(
          padding: EdgeInsets.all(2.00.hp),
          decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: DataTable2(
                  empty: _isActive ? const Loader() : const Text("No Data"),
                  columnSpacing: 2.00.hp,
                  minWidth: 6.00.wp,
                  columns: const [
                    DataColumn2(
                      label: Text("Amount"),
                    ),
                    DataColumn2(
                      label: Text("Type"),
                    ),
                    DataColumn2(
                      label: Text("Status"),
                    ),
                    DataColumn2(label: Text("Wallet Id")),
                  ],
                  rows: List.generate(
                    transactions.length,
                        (index) => transactionsDataRow(transactions[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
