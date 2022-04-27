import 'dart:convert';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_seo/constants.dart';
import 'package:flutter_web_seo/models/RecentFile.dart';
import 'package:flutter_web_seo/services/api/wallet/wallet.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../locator.dart';
import '../models/user.model.dart';
import '../models/wallet.model.dart';
import '../responsive.dart';
import '../services/api/api.service.dart';
import 'loader_widget.dart';

final apiService = locator<ApiService>();

class WalletsTable extends StatefulWidget {
  const WalletsTable({Key? key}) : super(key: key);

  @override
  State<WalletsTable> createState() => _WalletsTableState();
}

class _WalletsTableState extends State<WalletsTable> {

  static const storage = FlutterSecureStorage();

  bool _isActive = false;
  List wallets = <Wallet>[];
  User? currentUser;

  Future getCurrentUser() async {
    await storage.read(key: 'user').
    then((value) {
      if (mounted) {
        setState(() {
          currentUser = User.fromJson(json.decode(value!));
        });
      }
    });
  }

  Future getWallets() async {
    setState(() {
      _isActive = true;
    });
    await apiService.getWallets().
    then((value) {
      if (mounted) {
        setState(() {
          wallets = value;
          _isActive = false;
        });
      }
    });
  }

  void initState() {
    super.initState();
    getWallets();
    getCurrentUser();
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
                  horizontal: defaultPadding * 1.5,
                  vertical:
                  defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {QR.to("/wallet/add");},
              icon: Icon(Icons.add),
              label: Text("Ajouter"),
            ),
          ],
        ),
        SizedBox(height: 20.00),
        Container(
          padding: const EdgeInsets.all(defaultPadding),
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
                  columnSpacing: defaultPadding,
                  minWidth: 600,
                  columns: const [
                    DataColumn2(
                      label: Text("Solde"),
                    ),
                    DataColumn2(
                      label: Text("User"),
                    ),
                    DataColumn2(
                        label: Text("Action")
                    ),
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

DataRow walletsDataRow(Wallet wallet) {
  return DataRow(
    cells: [
      DataCell(Text(wallet.solde!.toString())),
      DataCell(Text("${wallet.user!.firstname}"),),
      DataCell(
          Row(
            children: [
              IconButton(onPressed: () {QR.to("/wallet/edit/${wallet.sId!}");}, icon: const Icon(Icons.edit), iconSize: 18.00),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete), iconSize: 18.00),
            ],
          )),
    ],
  );
}
