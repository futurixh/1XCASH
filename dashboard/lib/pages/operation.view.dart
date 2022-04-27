import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_seo/constants.dart';
import 'package:flutter_web_seo/sizeconf.dart';

import '../responsive.dart';

class OperationView extends StatefulWidget {
  static String routeName = "Operation";
  const OperationView({Key? key}) : super(key: key);

  @override
  State<OperationView> createState() => _OperationViewState();
}

class _OperationViewState extends State<OperationView> {
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
                              "Amount",
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
                            hintText: "5233",
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
                  padding: EdgeInsets.all(2.00.hp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: Text(
                              "Transaction Type",
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
                          child: DropdownButtonFormField2(
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
                            ), items: typeItems, onChanged: (Object? value) {  },
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
                padding: EdgeInsets.all(1.00.hp),
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.00.wp * 1.5,
                      vertical:
                      1.80.hp / (Responsive.isMobile(context) ? 2 : 0.7),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Enregistrer"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1.00.hp),
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.00.wp * 1.5,
                      vertical:
                      1.80.hp / (Responsive.isMobile(context) ? 2 : 0.7),
                    ),
                  ),
                  onPressed: () {},
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

List<DropdownMenuItem<String>> typeItems = [
  DropdownMenuItem(child: Text("Debit"),value: "debit"),
  DropdownMenuItem(child: Text("Credit"),value: "credit"),
];
