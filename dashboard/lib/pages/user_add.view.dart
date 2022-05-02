import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_seo/services/api/user/user.dart';
import 'package:flutter_web_seo/utils/sizeconf.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../components/loader_widget.dart';
import '../services/api/api.service.dart';
import '../utils/constants.dart';
import '../utils/locator.dart';
import '../utils/responsive.dart';

class UserAdd extends StatefulWidget {
  static String routeName = "User Add";
  const UserAdd({Key? key}) : super(key: key);

  @override
  State<UserAdd> createState() => _UserAddState();
}

class _UserAddState extends State<UserAdd> {
  PlatformFile? ifuFile;
  PlatformFile? identityFile;
  PlatformFile? rccmFile;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _lastController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _role;
  final apiService = locator<ApiService>();
  final _formKey = GlobalKey<FormState>();
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.00.hp),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Form(
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
                          child: Text(
                              "Lastname",
                              style: TextStyle(fontSize: 3.00.sp, color: Colors.white)
                          ),
                          margin: const EdgeInsets.only(left: 0, bottom: 0),
                          alignment: Alignment.centerLeft
                      ),
                      SizedBox(
                        width: 3.00.wp,
                      ),
                      SizedBox(
                        width: 40.00.wp,
                        child: TextFormField(
                          controller: _lastController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Ce champs ne peut etre vide";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "John",
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
                  Padding(
                    padding: EdgeInsets.all(2.0.hp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Text(
                                "Firstname",
                                style: TextStyle(fontSize: 3.00.sp, color: Colors.white)
                            ),
                            margin: const EdgeInsets.only(left: 0, bottom: 0),
                            alignment: Alignment.centerLeft
                        ),
                        SizedBox(
                          width: 3.00.wp,
                        ),
                        SizedBox(
                          width: 40.00.wp,
                          child: TextFormField(
                            controller: _firstController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Ce champs ne peut etre vide";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "Doe",
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
                  Padding(
                    padding: EdgeInsets.all(2.0.hp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Text(
                                "Email",
                                style: TextStyle(fontSize: 3.00.sp, color: Colors.white)
                            ),
                            margin: const EdgeInsets.only(left: 0, bottom: 0),
                            alignment: Alignment.centerLeft
                        ),
                        SizedBox(
                          width: 3.00.wp,
                        ),
                        SizedBox(
                          width: 40.00.wp,
                          child: TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Ce champs ne peut etre vide";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "johndoe@example.com",
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
                  Padding(
                    padding: EdgeInsets.all(2.0.hp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Text(
                                "Telephone",
                                style: TextStyle(fontSize: 3.00.sp, color: Colors.white)
                            ),
                            margin: const EdgeInsets.only(left: 0, bottom: 0),
                            alignment: Alignment.centerLeft
                        ),
                        SizedBox(
                          width: 3.00.wp,
                        ),
                        SizedBox(
                          width: 40.00.wp,
                          child: TextFormField(
                            controller: _telephoneController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Ce champs ne peut etre vide";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "01020304",
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
                  Padding(
                    padding: EdgeInsets.all(2.0.hp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Text(
                                "Password",
                                style: TextStyle(fontSize: 3.00.sp, color: Colors.white)
                            ),
                            margin: const EdgeInsets.only(left: 0, bottom: 0),
                            alignment: Alignment.centerLeft
                        ),
                        SizedBox(
                          width: 3.00.wp,
                        ),
                        SizedBox(
                          width: 40.00.wp,
                          child: TextFormField(
                            controller: _passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Ce champs ne peut etre vide";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "*********",
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
                  Padding(
                    padding: EdgeInsets.all(2.0.hp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Text(
                                "Role",
                                style: TextStyle(fontSize: 3.00.sp, color: Colors.white)
                            ),
                            margin: const EdgeInsets.only(left: 0, bottom: 0),
                            alignment: Alignment.centerLeft
                        ),
                        SizedBox(
                          width: 3.00.wp,
                        ),
                        SizedBox(
                          width: 40.00.wp,
                          child: DropdownButtonFormField(
                            value: _role,
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
                            ), items: menuItems, onChanged: (Object? value) {
                            setState(() {
                              _role = value as String;
                            });
                          },
                          )
                        )
                      ],),
                  ),
                  Visibility(
                    visible: _role == "merchant",
                    child: Padding(
                      padding: EdgeInsets.all(2.0.hp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              child: Text(
                                  "Ifu",
                                  style: TextStyle(fontSize: 3.00.sp, color: Colors.white)
                              ),
                              margin: const EdgeInsets.only(left: 0, bottom: 0),
                              alignment: Alignment.centerLeft
                          ),
                          SizedBox(
                            width: 3.00.wp,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10.00.wp,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final result = await FilePicker.platform.pickFiles();
                                    if (result == null) return;

                                    final file = result.files.first;
                                    setState(() {
                                      ifuFile = file;
                                    });
/*                                print('Name: ${file.name}');
                                    print('Bytes: ${file.bytes}');
                                    print('Size: ${file.size}');
                                    print('Ext: ${file.extension}');*/
                                  },
                                  child: Text("Add file"),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.00.wp),
                                child: SizedBox(
                                  width: 25.00.wp,
                                  child: Text(ifuFile?.name != null ? ifuFile!.name : "No file"),
                                ),
                              ),
                            ],
                          )
                        ],),
                    ),
                  ),
                  Visibility(
                    visible: _role == "merchant",
                    child: Padding(
                      padding: EdgeInsets.all(2.0.hp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              child: Text(
                                  "Identité",
                                  style: TextStyle(fontSize: 3.00.sp, color: Colors.white)
                              ),
                              margin: const EdgeInsets.only(left: 0, bottom: 0),
                              alignment: Alignment.centerLeft
                          ),
                          SizedBox(
                            width: 3.00.wp,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10.00.wp,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final result = await FilePicker.platform.pickFiles();
                                    if (result == null) return;

                                    final file = result.files.first;
                                    setState(() {
                                      identityFile = file;
                                    });
/*                                print('Name: ${file.name}');
                                    print('Bytes: ${file.bytes}');
                                    print('Size: ${file.size}');
                                    print('Ext: ${file.extension}');*/
                                  },
                                  child: Text("Add file"),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.00.wp),
                                child: SizedBox(
                                  width: 25.00.wp,
                                  child: Text(identityFile?.name != null ? identityFile!.name : "No file"),
                                ),
                              ),
                            ],
                          )
                        ],),
                    ),
                  ),
                  Visibility(
                    visible: _role == "merchant",
                    child: Padding(
                      padding: EdgeInsets.all(2.0.hp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              child: Text(
                                  "Rccm",
                                  style: TextStyle(fontSize: 3.00.sp, color: Colors.white)
                              ),
                              margin: const EdgeInsets.only(left: 0, bottom: 0),
                              alignment: Alignment.centerLeft
                          ),
                          SizedBox(
                            width: 3.00.wp,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10.00.wp,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final result = await FilePicker.platform.pickFiles();
                                    if (result == null) return;

                                    final file = result.files.first;
                                    setState(() {
                                      rccmFile = file;
                                    });
/*                                print('Name: ${file.name}');
                                    print('Bytes: ${file.bytes}');
                                    print('Size: ${file.size}');
                                    print('Ext: ${file.extension}');*/
                                  },
                                  child: Text("Add file"),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.00.wp),
                                child: SizedBox(
                                  width: 25.00.wp,
                                  child: Text(rccmFile?.name != null ? rccmFile!.name : "No file"),
                                ),
                              ),
                            ],
                          )
                        ],),
                    ),
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
                          _isActive = true;
                        });
                        try {
                          await apiService.createUser(
                              _lastController.text,
                              _firstController.text,
                              _emailController.text,
                              _telephoneController.text,
                              _passwordController.text,
                              _role!,
                              ifuFile,
                              identityFile,
                              rccmFile
                          ).then(
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
                          _isActive = false;
                        });
                      }
                    },
                    child: _isActive ? const Loader() : const Text("Enregistrer"),
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
                    onPressed: () {QR.to("/user");},
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

  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text("Marchant"),value: "merchant"),
    const DropdownMenuItem(child: Text("Super Marchant"),value: "super-merchant"),
    const DropdownMenuItem(child: Text("Admin"),value: "admin"),
  ];
