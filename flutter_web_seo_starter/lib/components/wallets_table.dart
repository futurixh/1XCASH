import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_seo/constants.dart';
import 'package:flutter_web_seo/models/RecentFile.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../models/wallets.dart';
import '../responsive.dart';

class WalletsTable extends StatelessWidget {
  const WalletsTable({Key? key}) : super(key: key);

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
                    demoWallets.length,
                        (index) => walletsDataRow(demoWallets[index]),
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
      DataCell(Text("${wallet.user!}"),),
      DataCell(
          Row(
            children: [
              IconButton(onPressed: () {QR.to("/wallet/edit/${wallet.id!}");}, icon: const Icon(Icons.edit), iconSize: 18.00),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete), iconSize: 18.00),
            ],
          )),
    ],
  );
}
