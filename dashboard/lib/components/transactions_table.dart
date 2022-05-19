import 'dart:convert';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_seo/components/loader_widget.dart';
import 'package:flutter_web_seo/models/message.model.dart';
import 'package:flutter_web_seo/services/api/wallet/wallet.dart';
import 'package:flutter_web_seo/utils/constants.dart';
import 'package:flutter_web_seo/utils/responsive.dart';
import 'package:flutter_web_seo/services/api/transaction/transaction.dart';
import 'package:flutter_web_seo/utils/sizeconf.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  late FToast fToast;
  bool _isActive = false;
  bool _isDelete = false;
  bool _isFinished = false;
  bool _isOperation = false;
  List transactions = <Transaction>[];

  Widget toast(String message, Color color, Widget icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.00.wp, vertical: 2.00.hp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(
            width: 1.00.wp,
          ),
          Text(message),
        ],
      ),
    );
  }

  _showToastSuccess(String message) {
    fToast.showToast(
      child: toast(message, Colors.greenAccent, const Icon(Icons.check)),
      gravity: ToastGravity.BOTTOM_LEFT,
      toastDuration: const Duration(seconds: 3),
    );
  }

  _showToastError(String message) {
    fToast.showToast(
      child: toast(message, Colors.redAccent, const Icon(Icons.close)),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
    );
  }

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

    User? user1 = transaction.validations!.asMap().containsKey(0) ? Validation.fromJson(transaction.validations![0]).user : null;
    User? user2 = transaction.validations!.asMap().containsKey(1) ? Validation.fromJson(transaction.validations![1]).user : null;
    User? user3 = transaction.validations!.asMap().containsKey(2) ? Validation.fromJson(transaction.validations![2]).user : null;

    return DataRow(
      cells: [
        DataCell(Text(transaction.amount!.toString(), style: TextStyle(fontSize: 2.50.sp),)),
        DataCell(Text(transaction.type!, style: TextStyle(fontSize: 2.50.sp))),
        DataCell(
            SizedBox(
              height: 3.00.hp,
              width: 5.00.wp,
              child: _isFinished ? const Loader() : ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: transaction.approval! == true ? Colors.green : Colors.red
                ),
                onPressed: () async {
                  if (transaction.approval! == false && widget.currentUser?.role != "merchant") {
                    setState(() {
                      _isFinished = true;
                    });
                    try {
                      await apiService.validateTransaction(transaction.sId!).then(
                            (value) {
                          if (kDebugMode) {
                            print(value!.toJson().toString());
                          }
                          setState(() {
                            transaction.validations = value!.validations;
                            transaction.approval = value.approval;
                            _isFinished = false;
                          });
                        },
                      );
                    } catch (e) {
                      setState(() {
                        _isFinished = false;
                      });
                      if (kDebugMode) {
                        print(e.toString());
                      }
                    }
                  }
                },
                child: Text(transaction.approval!.toString(), style: TextStyle(fontSize: 2.50.sp)),
              ),
            )
        ),
        DataCell(
          Container(
            height: 3.00.hp,
            width: 5.00.wp,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: transaction.status! == "finished" ? Colors.green : Colors.orange
            ),
            child: Center(child: Text(transaction.status!, style: TextStyle(fontSize: 2.50.sp, color: Colors.white),)),
          ),
        ),
        DataCell(
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.transparent
            ),
            child: Column(
              children: [
                user1 != null ? Text("${user1.firstname!} ${user1.lastname!}", style: TextStyle(fontSize: 2.20.sp, fontWeight: FontWeight.bold)) : Text("-", style: TextStyle(fontSize: 2.20.sp)),
                user2 != null ? Text("${user2.firstname!} ${user2.lastname!}", style: TextStyle(fontSize: 2.20.sp, fontWeight: FontWeight.bold)) : Text("-", style: TextStyle(fontSize: 2.20.sp)),
                user3 != null ? Text("${user3.firstname!} ${user3.lastname!}", style: TextStyle(fontSize: 2.20.sp, fontWeight: FontWeight.bold)) : Text("-", style: TextStyle(fontSize: 2.20.sp)),

              ],
            )),
          ),
        DataCell(
          Text("${transaction.wallet!.user!.firstname!} ${transaction.wallet!.user!.lastname!}" , style: TextStyle(fontSize: 2.50.sp)),
        ),
        DataCell(Row(
          children: [
            IconButton(
                onPressed: ((transaction.approval == true && transaction.status == "pending") && (widget.currentUser!.role == "admin" || (widget.currentUser!.role == "super-merchant" && transaction.wallet!.user!.role == "merchant"))) ? () async {
                  /*QR.to("/transaction/operation/${transaction.wallet!.sId!}/${transaction.amount}/${transaction.type}");*/
                  setState(() {
                    _isOperation = true;
                  });
                  try {
                    await apiService.makeOperation(transaction.sId!).then(
                          (value) {
                            setState(() {
                              transaction.status = value?.status;
                              _isOperation = false;
                            });
                        if (kDebugMode) {
                          print(value!.toJson().toString(),);
                        }
                      },
                    );
                  } catch (e) {
                    setState(() {
                      _isOperation = false;
                    });
                    if (kDebugMode) {
                      print(e.toString());
                    }
                  }
                } : null,
                icon: _isOperation ? const Loader() : const Icon(Icons.money),
                iconSize: 2.00.hp),
            IconButton(
                onPressed: (widget.currentUser!.role == "admin") ? () {
                  QR.to("/transaction/edit/${transaction.sId!}");
                } : null,
                icon: const Icon(Icons.edit),
                iconSize: 2.00.hp),
            IconButton(
                onPressed: (widget.currentUser!.role == "admin") ? () async {
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
                } : null,
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
    fToast = FToast();
    fToast.init(context);
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
                  dataRowHeight: 7.00.hp,
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
                      label: Text("Approval"),
                    ),
                    DataColumn2(
                      label: Text("Status"),
                    ),
                    DataColumn2(
                      label: Text("Validations"),
                    ),
                    DataColumn2(label: Text("Wallet User")),
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
