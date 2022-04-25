import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_seo/constants.dart';
import 'package:flutter_web_seo/models/RecentFile.dart';
import 'package:flutter_web_seo/models/transactions.dart';
import 'package:flutter_web_seo/responsive.dart';
import 'package:qlevar_router/qlevar_router.dart';

class TransactionsTable extends StatelessWidget {
  const TransactionsTable({Key? key}) : super(key: key);

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
                  horizontal: defaultPadding * 1.5,
                  vertical:
                  defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {QR.to("/transaction/add");},
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
                      label: Text("Amount"),
                    ),
                    DataColumn2(
                      label: Text("Type"),
                    ),
                    DataColumn2(
                      label: Text("Status"),
                    ),
                    DataColumn2(
                        label: Text("Wallet")
                    ),
                    DataColumn2(
                        label: Text("Action")
                    ),
                  ],
                  rows: List.generate(
                    demoTransaction.length,
                        (index) => transactionsDataRow(demoTransaction[index]),
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

DataRow transactionsDataRow(Transaction transaction) {
  return DataRow(
    cells: [
      DataCell(Text(transaction.amount!.toString())),
      DataCell(Text(transaction.type!)),
      DataCell(Text(transaction.status!)),
      DataCell(Text("${transaction.wallet!}"),),
      DataCell(
          Row(
            children: [
              IconButton(onPressed: () {QR.to("/transaction/edit/${transaction.id!}");}, icon: const Icon(Icons.edit), iconSize: 18.00),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete), iconSize: 18.00),
            ],
          )),
    ],
  );
}
