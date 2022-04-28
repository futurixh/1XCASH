import 'dart:convert';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_seo/components/loader_widget.dart';
import 'package:flutter_web_seo/utils/constants.dart';
import 'package:flutter_web_seo/utils/responsive.dart';
import 'package:flutter_web_seo/services/api/transaction/transaction.dart';
import 'package:flutter_web_seo/utils/sizeconf.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../utils/locator.dart';
import '../models/transaction.model.dart';
import '../models/user.model.dart';
import '../services/api/api.service.dart';

final apiService = locator<ApiService>();

class TransactionsTable extends StatefulWidget {
  final User? currentUser;
  const TransactionsTable({Key? key, this.currentUser}) : super(key: key);

  @override
  State<TransactionsTable> createState() => _TransactionsTableState();
}

class _TransactionsTableState extends State<TransactionsTable> {
  bool _isActive = false;
  bool _isDelete = false;
  List transactions = <Transaction>[];

  Future getTransactions() async {
    setState(() {
      _isActive = true;
    });
    await apiService.getTransactions().then((value) {
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
          Text(transaction.wallet!),
        ),
        DataCell(Row(
          children: [
            IconButton(
                onPressed: () {
                  QR.to("/transaction/edit/${transaction.sId!}");
                },
                icon: const Icon(Icons.edit),
                iconSize: 2.00.hp),
            IconButton(
                onPressed: () async {
                  setState(() {
                    _isDelete = true;
                  });
                  try {
                    await apiService.deleteTransaction(transaction.sId!).then(
                          (value) {
                        if (kDebugMode) {
                          print(value!);
                        }
                        setState(() {
                          transactions.remove(transaction);
                          _isDelete = false;
                        });
                      },
                    );
                  } catch (e) {
                    if (kDebugMode) {
                      print(e.toString());
                    }
                  }
                },
                icon:  _isDelete ? const Loader() : const Icon(Icons.delete),
                iconSize: 2.00.hp),
          ],
        )),
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
              "Transactions",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 1.50.wp * 1.5,
                  vertical: 2.00.hp / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {
                QR.to("/transaction/add");
              },
              icon: const Icon(Icons.add),
              label: const Text("Ajouter"),
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
                  empty: _isActive ? Loader() : Text("No Data"),
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
                    DataColumn2(label: Text("Action")),
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
