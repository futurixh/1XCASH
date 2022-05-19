import 'dart:convert';
import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_seo/components/loader_widget.dart';
import 'package:flutter_web_seo/models/deposit-code.model.dart';
import 'package:flutter_web_seo/services/api/code/deposit.dart';
import 'package:flutter_web_seo/utils/constants.dart';
import 'package:flutter_web_seo/models/user.model.dart';
import 'package:flutter_web_seo/services/api/user/user.dart';
import 'package:flutter_web_seo/utils/sizeconf.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/locator.dart';
import '../utils/responsive.dart';
import '../services/api/api.service.dart';

final apiService = locator<ApiService>();

class DepositCodeTable extends StatefulWidget {
  final User? currentUser;
  const DepositCodeTable({Key? key, this.currentUser}) : super(key: key);

  @override
  State<DepositCodeTable> createState() => _DepositCodeTableState();
}

class _DepositCodeTableState extends State<DepositCodeTable> {
  bool _isActive = false;
  bool _isDelete = false;
  bool _isVerified = false;
  List depositCodes = <DepositCode>[];

  Future getDepositCodes() async {
    setState(() {
      _isActive = true;
    });
    await apiService.getDepositCodes().then((value) {
      if (mounted) {
        setState(() {
          depositCodes = value;
          _isActive = false;
        });
      }
    });
  }

  DataRow usersDataRow(DepositCode code) {
    return DataRow2(
      cells: [
        DataCell(
          Text(code.amount!),
        ),
        DataCell(Text(code.merchant!)),
        DataCell(Text(code.code!)),
        DataCell(Text(code.validity!)),
        DataCell(
          Container(
            height: 3.00.hp,
            width: 4.50.wp,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: code.status! == "active" ? Colors.green : (code.status! == "used" ? Colors.blue : Colors.grey)
            ),
            child: Center(child: Text(code.status!, style: TextStyle(fontSize: 2.50.sp, color: Colors.white),)),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    getDepositCodes();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Deposit Codes",
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
                    DataColumn2(label: Text("Amount"), size: ColumnSize.L),
                    DataColumn2(
                      label: Text("Merchant"),
                      size: ColumnSize.L
                    ),
                    DataColumn2(
                      label: Text("Code"),
                    ),
                    DataColumn2(label: Text("Validity")),
                    DataColumn2(label: Text("Status"), size: ColumnSize.L),
                  ],
                  rows: List.generate(
                    depositCodes.length,
                    (index) => usersDataRow(depositCodes[index]),
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