import 'package:flutter/material.dart';
import 'package:flutter_web_seo/utils/constants.dart';
import 'package:flutter_web_seo/utils/sizeconf.dart';

import '../utils/responsive.dart';

class OperationBetView extends StatefulWidget {
  static String routeName = "Operation 1xBet";
  const OperationBetView({Key? key}) : super(key: key);

  @override
  State<OperationBetView> createState() => _OperationBetViewState();
}

class _OperationBetViewState extends State<OperationBetView> {
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
                              "Id 1xbet",
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
                            hintText: "14533284562",
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
                  padding:  EdgeInsets.all(2.00.hp),
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
                          width: 40.0.wp,
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
  DropdownMenuItem(child: Text("Deposit"),value: "deposit"),
  DropdownMenuItem(child: Text("Withdrawal"),value: "withdrawal"),
];