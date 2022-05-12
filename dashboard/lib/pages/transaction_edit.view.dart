import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_seo/components/loader_widget.dart';
import 'package:flutter_web_seo/models/transaction.model.dart';
import 'package:flutter_web_seo/services/api/transaction/transaction.dart';
import 'package:flutter_web_seo/utils/sizeconf.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../services/api/api.service.dart';
import '../utils/constants.dart';
import '../utils/locator.dart';
import '../utils/responsive.dart';

class TransactionEdit extends StatefulWidget {
  static String routeName = 'Transaction Edit';

  const TransactionEdit({Key? key}) : super(key: key);

  @override
  State<TransactionEdit> createState() => _TransactionEditState();
}

class _TransactionEditState extends State<TransactionEdit> {
  final id = QR.params['id'].toString();
  String? _transactionType;
  String? _transactionTypeBet;
  String? _status;
  TextEditingController _amountController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _clientController = TextEditingController();
  final apiService = locator<ApiService>();
  final _formKey = GlobalKey<FormState>();
  bool _isActive = false;
  bool _isEdit = false;
  Transaction? transaction;

  Future getTransaction() async {
    setState(() {
      _isActive = true;
    });
    await apiService.getTransaction(id).then((value) {
      if (mounted) {
        setState(() {
          transaction = value;
          _amountController = TextEditingController()..text = value!.amount.toString();
          _status = value.status;
          _transactionType = value.type;
          if (value.bet != null) {
            _idController = TextEditingController()..text = value.bet!.id.toString();
            _transactionTypeBet = value.bet!.type;
            if (value.bet!.clientTelephone != null) {
              _clientController = TextEditingController()..text = value.bet!.clientTelephone.toString();
            }
          }

          _isActive = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getTransaction();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.00.hp),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: _isActive ? const Loader() : Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(2.00.hp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 0, bottom: 0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "Amount",
                                style: TextStyle(fontSize: 3.00.sp, color: Colors.black87)
                            )
                        ),
                        SizedBox(
                          width: 3.00.wp,
                        ),
                        SizedBox(
                          width: 40.00.wp,
                          child: TextFormField(
                            controller: _amountController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Ce champs ne peut etre vide";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "5233",
                              fillColor: secondaryColor,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius:  BorderRadius.all(Radius.circular(10)),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        )
                      ],),
                  ),
                  Visibility(
                    visible: transaction!.bet != null && transaction!.bet!.id != null,
                    child: Padding(
                      padding: EdgeInsets.all(2.00.hp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(left: 0, bottom: 0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "Id 1xbet",
                                  style: TextStyle(fontSize: 3.00.sp, color: Colors.black87)
                              )
                          ),
                          SizedBox(
                            width: 3.00.wp,
                          ),
                          SizedBox(
                            width: 40.00.wp,
                            child: TextFormField(
                              controller: _idController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Ce champs ne peut etre vide";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: "125553866222",
                                fillColor: secondaryColor,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:  BorderRadius.all(Radius.circular(10)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                          )
                        ],),
                    ),
                  ),
                  Visibility(
                    visible: (transaction!.bet != null &&  _transactionTypeBet == "withdrawal"),
                    child: Padding(
                      padding: EdgeInsets.all(2.00.hp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(left: 0, bottom: 0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "Client telephone",
                                  style: TextStyle(fontSize: 3.00.sp, color: Colors.black87)
                              )
                          ),
                          SizedBox(
                            width: 3.00.wp,
                          ),
                          SizedBox(
                            width: 40.00.wp,
                            child: TextFormField(
                              controller: _clientController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Ce champs ne peut etre vide";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: "67662166",
                                fillColor: secondaryColor,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:  BorderRadius.all(Radius.circular(10)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                          )
                        ],),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.00.hp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Text(
                                "Status",
                                style: TextStyle(fontSize: 3.00.sp, color: Colors.black87)
                            ),
                            margin: const EdgeInsets.only(left: 0, bottom: 0),
                            alignment: Alignment.centerLeft
                        ),
                        SizedBox(
                          width: 3.00.wp,
                        ),
                        SizedBox(
                            width: 40.00.wp,
                            child: DropdownButtonFormField2(
                              value: _status,
                              validator: (value) {
                                if (value == null) {
                                  return "Ce champs ne peut etre vide";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                fillColor: secondaryColor,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:  BorderRadius.all(Radius.circular(10)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                              ), items: statusItems, onChanged: (Object? value) {
                              setState(() {
                                _status = value as String;
                              });
                            },
                            )
                        )
                      ],),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.00.hp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Text(
                                "Transaction Type",
                                style: TextStyle(fontSize: 3.00.sp, color: Colors.black87)
                            ),
                            margin: const EdgeInsets.only(left: 0, bottom: 0),
                            alignment: Alignment.centerLeft
                        ),
                        SizedBox(
                          width: 3.00.wp,
                        ),
                        SizedBox(
                            width: 40.00.wp,
                            child: DropdownButtonFormField2(
                              value: _transactionType,
                              validator: (value) {
                                if (value == null) {
                                  return "Ce champs ne peut etre vide";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                fillColor: secondaryColor,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:  BorderRadius.all(Radius.circular(10)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                              ), items: typeItems, onChanged: (Object? value) {
                              setState(() {
                                _transactionType = value as String;
                              });
                            },
                            )
                        )
                      ],),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.00.hp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Text(
                                "Transaction Type Bet",
                                style: TextStyle(fontSize: 3.00.sp, color: Colors.black87)
                            ),
                            margin: const EdgeInsets.only(left: 0, bottom: 0),
                            alignment: Alignment.centerLeft
                        ),
                        SizedBox(
                          width: 3.00.wp,
                        ),
                        SizedBox(
                            width: 40.00.wp,
                            child: DropdownButtonFormField2(
                              value: _transactionTypeBet,
                              validator: (value) {
                                if (value == null) {
                                  return "Ce champs ne peut etre vide";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                fillColor: secondaryColor,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:  BorderRadius.all(Radius.circular(10)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                              ), items: typeBetItems, onChanged: (Object? value) {
                              setState(() {
                                _transactionTypeBet = value as String;
                              });
                            },
                            )
                        )
                      ],),
                  ),
                ],
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(1.0.hp),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.00.wp * 1.5,
                        vertical:
                        1.80.hp / (Responsive.isMobile(context) ? 2 : 0.7),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isEdit = true;
                        });
                        try {
                          await apiService.editTransaction(id, _amountController.text, _status!, _transactionType, _transactionTypeBet, _idController.text, _transactionTypeBet == "withdrawal" ? _clientController.text : "").then(
                                (value) {
                              if (kDebugMode) {
                                print(value!.toJson().toString(),);
                              }
                            },
                          );
                        } catch (e) {
                          if (kDebugMode) {
                            print(e.toString());
                          }
                        }
                        setState(() {
                          _isEdit = false;
                        });
                      }
                    },
                    child: _isEdit ? const Loader() : const Text("Enregistrer"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.0.hp),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.00.wp * 1.5,
                        vertical:
                        1.80.hp / (Responsive.isMobile(context) ? 2 : 0.7),
                      ),
                    ),
                    onPressed: () {QR.to("/transaction");},
                    child: const Text("Quitter"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

List<DropdownMenuItem<String>> typeItems = [
  DropdownMenuItem(child: Text("Debit"),value: "debit"),
  DropdownMenuItem(child: Text("Credit"),value: "credit"),
];

List<DropdownMenuItem<String>> typeBetItems = [
  DropdownMenuItem(child: Text("Deposit"),value: "deposit"),
  DropdownMenuItem(child: Text("Withdrawal"),value: "withdrawal"),
];

List<DropdownMenuItem<String>> statusItems = [
  DropdownMenuItem(child: Text("Pending"),value: "pending"),
  DropdownMenuItem(child: Text("Finished"),value: "finished"),
];
