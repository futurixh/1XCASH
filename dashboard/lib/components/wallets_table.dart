import 'dart:convert';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_seo/utils/constants.dart';
import 'package:flutter_web_seo/services/api/wallet/wallet.dart';
import 'package:flutter_web_seo/utils/sizeconf.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../utils/locator.dart';
import '../models/user.model.dart';
import '../models/wallet.model.dart';
import '../utils/responsive.dart';
import '../services/api/api.service.dart';
import 'loader_widget.dart';

final apiService = locator<ApiService>();

class WalletsTable extends StatefulWidget {
  final User? currentUser;
  const WalletsTable({Key? key, this.currentUser}) : super(key: key);

  @override
  State<WalletsTable> createState() => _WalletsTableState();
}

class _WalletsTableState extends State<WalletsTable> {
  bool _isActive = false;
  bool _isDelete = false;
  List wallets = <Wallet>[];

  Future getWallets() async {
    setState(() {
      _isActive = true;
    });
    await apiService.getWallets().then((value) {
      if (mounted) {
        setState(() {
          wallets = value;
          _isActive = false;
        });
      }
    });
  }

  DataRow walletsDataRow(Wallet wallet) {
    return DataRow(
      cells: [
        DataCell(Text(wallet.solde!.toString())),
        DataCell(
          Row(
            children: [
              Text("${wallet.user!.lastname}"),
              SizedBox(width: 0.50.wp),
              Text("${wallet.user!.firstname}")
            ],
          ),
        ),
        DataCell(Row(
          children: [
            IconButton(
                onPressed: () {
                  QR.to("/wallet/edit/${wallet.sId!}");
                },
                icon: const Icon(Icons.edit),
                iconSize: 2.00.hp),
            IconButton(
                onPressed: () async {
                  try {
                    await apiService.deleteWallet(wallet.sId!).then(
                          (value) {
                        if (kDebugMode) {
                          print(value!);
                        }
                        setState(() {
                          wallets.remove(wallet);
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
    getWallets();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Wallets",
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
                QR.to("/wallet/add");
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
                  empty: _isActive ? const Loader() : const Text("No Data"),
                  columnSpacing: 2.00.hp,
                  minWidth: 6.00.wp,
                  columns: const [
                    DataColumn2(
                      label: Text("Solde"),
                    ),
                    DataColumn2(
                      label: Text("User"),
                    ),
                    DataColumn2(label: Text("Action")),
                  ],
                  rows: List.generate(
                    wallets.length,
                    (index) => walletsDataRow(wallets[index]),
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
