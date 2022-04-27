import 'dart:convert';
import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_seo/components/loader_widget.dart';
import 'package:flutter_web_seo/constants.dart';
import 'package:flutter_web_seo/models/user.model.dart';
import 'package:flutter_web_seo/services/api/user/user.dart';
import 'package:flutter_web_seo/sizeconf.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../locator.dart';
import '../responsive.dart';
import '../services/api/api.service.dart';


final apiService = locator<ApiService>();

class UsersTable extends StatefulWidget {
  const UsersTable({Key? key}) : super(key: key);

  @override
  State<UsersTable> createState() => _UsersTableState();
}

class _UsersTableState extends State<UsersTable> {


  static const storage = FlutterSecureStorage();

  bool _isActive = false;
  List users = <User>[];
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

  Future getUsers() async {
    setState(() {
      _isActive = true;
    });
    await apiService.getUsers().
    then((value) {
      if (mounted) {
        setState(() {
          users = value;
          _isActive = false;
        });
      }
    });
  }

  @override


  void initState() {
    super.initState();
    getUsers();
    getCurrentUser();
  }

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
                  horizontal: 1.50.wp * 1.5,
                  vertical:
                  2.00.hp / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {QR.to("/user/add"); },
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
                      label: Text("Nom"),
                      size: ColumnSize.L
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
                    users.length,
                        (index) => usersDataRow(users[index]),
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
  return DataRow2(
    cells: [
      DataCell(
        Row(
          children: [
            Text(user.lastname!),
            SizedBox(width: 0.50.wp),
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
              IconButton(onPressed: () {
                QR.to("/user/edit/${user.sId!}");
                }, icon: const Icon(Icons.edit), iconSize: 2.00.hp),
              IconButton(onPressed: () async {
              }, icon: const Icon(Icons.delete), iconSize: 2.00.hp),
            ],
          )),
    ],
  );
}
