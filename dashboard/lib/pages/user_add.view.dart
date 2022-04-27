import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_seo/sizeconf.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../constants.dart';
import '../responsive.dart';

class UserAdd extends StatefulWidget {
  static String routeName = "User Add";
  const UserAdd({Key? key}) : super(key: key);

  @override
  State<UserAdd> createState() => _UserAddState();
}

class _UserAddState extends State<UserAdd> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      child: const TextField(
                        decoration: InputDecoration(
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
                        child: const TextField(
                          decoration: InputDecoration(
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
                        child: const TextField(
                          decoration: InputDecoration(
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
                        child: const TextField(
                          decoration: InputDecoration(
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
                        child: const TextField(
                          decoration: InputDecoration(
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
                          ), items: menuItems, onChanged: (Object? value) {  },
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
                  onPressed: () {},
                  child: Text("Enregistrer"),
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
    );
  }
}

  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text("Marchant"),value: "merchant"),
    const DropdownMenuItem(child: Text("Super Marchant"),value: "super-merchant"),
    const DropdownMenuItem(child: Text("Admin"),value: "admin"),
  ];
