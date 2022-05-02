import 'dart:convert';
import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_seo/components/loader_widget.dart';
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

class UsersTable extends StatefulWidget {
  final User? currentUser;
  const UsersTable({Key? key, this.currentUser}) : super(key: key);

  @override
  State<UsersTable> createState() => _UsersTableState();
}

class _UsersTableState extends State<UsersTable> {
  bool _isActive = false;
  bool _isDelete = false;
  bool _isVerified = false;
  List users = <User>[];

  Future getUsers() async {
    setState(() {
      _isActive = true;
    });
    await apiService.getUsers().then((value) {
      if (mounted) {
        setState(() {
          users = value;
          _isActive = false;
        });
      }
    });
  }

  DataRow usersDataRow(User user) {
    return DataRow2(
      cells: [
        DataCell(
          Text("${user.lastname!} ${user.firstname!}"),
        ),
        DataCell(Text(user.email!)),
        DataCell(Text(user.telephone!)),
        DataCell(Text(user.role!)),
        DataCell((user.ifu != null && user.identity != null && user.rccm != null) ? Flex(direction: Axis.horizontal, children: [
          RichText(text: TextSpan(text: "identity", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 2.50.sp), recognizer: new TapGestureRecognizer()
            ..onTap = () { launchUrl(Uri.parse(user.identity!));
            },)),
          SizedBox(width: 0.50.wp,),
          RichText(text: TextSpan(text: "ifu", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 2.50.sp), recognizer: new TapGestureRecognizer()
            ..onTap = () { launchUrl(Uri.parse(user.ifu!));
            },)),
          SizedBox(width: 0.50.wp,),
          RichText(text: TextSpan(text: "rccm", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 2.50.sp), recognizer: new TapGestureRecognizer()
            ..onTap = () { launchUrl(Uri.parse(user.rccm!));
            },)),
        ],)
         : Text("no files")),
        DataCell(
          ElevatedButton(
                style: TextButton.styleFrom(
                  maximumSize: Size(5.00.wp, 7.00.hp),
                  minimumSize: Size(3.00.wp, 3.50.hp),
                  backgroundColor: user.verified! == true ? Colors.green : Colors.red
                ),
                onPressed: () async {
                  if (user.verified! == false && widget.currentUser?.role == "admin") {
                    setState(() {
                      _isVerified = true;
                    });
                    try {
                      await apiService.verifyUser(user.sId!).then(
                            (value) {
                          if (kDebugMode) {
                            print(value!);
                          }
                          setState(() {
                            user.verified = true;
                            _isVerified = false;
                          });
                        },
                      );
                    } catch (e) {
                      if (kDebugMode) {
                        print(e.toString());
                      }
                    }
                  }
                },
                child: Text(user.verified!.toString(), style: TextStyle(fontSize: 2.50.sp),),
              ),
        ),
        DataCell(Flex(
          direction: Axis.horizontal,
          children: [
            IconButton(
                onPressed: () {
                  QR.to("/user/edit/${user.sId!}");
                },
                icon: const Icon(Icons.edit),
                iconSize: 0.50.wp * 0.25.hp),
            IconButton(
                onPressed: () async {
                  setState(() {
                    _isDelete = true;
                  });
                  try {
                    await apiService.deleteUser(user.sId!).then(
                      (value) {
                        if (kDebugMode) {
                          print(value!);
                        }
                        setState(() {
                          users.remove(user);
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
                icon: _isDelete ? const Loader() : const Icon(Icons.delete),
                iconSize: 0.50.wp * 0.25.hp),
          ],
        )),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    getUsers();
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
                  vertical: 2.00.hp / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {
                QR.to('/user/add');
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
                    DataColumn2(label: Text("Nom"), size: ColumnSize.L),
                    DataColumn2(
                      label: Text("Email"),
                      size: ColumnSize.L
                    ),
                    DataColumn2(
                      label: Text("Telephone"),
                    ),
                    DataColumn2(label: Text("Role")),
                    DataColumn2(label: Text("Files"), size: ColumnSize.L),
                    DataColumn2(label: Text("Verified")),
                    DataColumn2(label: Text("Action") , size: ColumnSize.L),
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
