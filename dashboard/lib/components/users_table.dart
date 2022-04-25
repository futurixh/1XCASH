import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_web_seo/constants.dart';
import 'package:flutter_web_seo/models/RecentFile.dart';
import 'package:flutter_web_seo/models/users.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../responsive.dart';


class UsersTable extends StatelessWidget {
  const UsersTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Users",
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
              onPressed: () {QR.to("/user/add");},
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
                      label: Text("Nom"),
                    ),
                    DataColumn2(
                      label: Text("Email"),
                    ),
                    DataColumn2(
                      label: Text("Telephone"),
                    ),
                    DataColumn2(
                        label: Text("Role")
                    ),
                    DataColumn2(
                        label: Text("Verified")
                    ),
                    DataColumn2(
                        label: Text("Action")
                    ),
                  ],
                  rows: List.generate(
                    demoUsers.length,
                        (index) => usersDataRow(demoUsers[index]),
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

DataRow usersDataRow(User user) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Text(user.lastname!),
            SizedBox(width: 5,),
            Text(user.firstname!)
          ],
        ),
      ),
      DataCell(Text(user.email!)),
      DataCell(Text(user.telephone!)),
      DataCell(Text(user.role!)),
      DataCell(Text((user.verified!).toString())),
      DataCell(
          Row(
            children: [
              IconButton(onPressed: () {QR.to("/user/edit/${user.id!}");}, icon: const Icon(Icons.edit), iconSize: 18.00),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete), iconSize: 18.00),
            ],
          )),
    ],
  );
}
