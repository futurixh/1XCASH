import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:get/get.dart';
import 'package:x1xcash/app/core/services/api/api.service.dart';
import 'package:x1xcash/app/core/utils/extensions.dart';
import 'package:x1xcash/app/core/values/colors.dart';
import 'package:x1xcash/app/modules/widgets/loader_widget.dart';
import 'package:x1xcash/locator.dart';

class DepositView extends StatefulWidget {
  const DepositView({Key? key}) : super(key: key);

  @override
  State<DepositView> createState() => _DepositViewState();
}

class _DepositViewState extends State<DepositView> {
  final _idController = TextEditingController();
  final _amountController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final apiService = locator<ApiService>();
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black, size: 3.50.hp),
        title: Text(
          'Recharge 1xbet',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18.00.sp),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: EdgeInsets.all(5.00.hp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Id client 1xbet",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontSize: 12.00.sp,
                  ),
                ),
                SizedBox(
                  height: 1.00.hp,
                ),
                SizedBox(
                  width: 81.00.wp,
                  child: TextFormField(
                    controller: _idController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Ce champs ne peut etre vide";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Ex: 12345364789",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.00.sp),
                      filled: true,
                      fillColor: HexColor(MyColors.backgroundColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.00.hp,
                ),
                Text(
                  "Montant",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 12.00.sp),
                ),
                SizedBox(
                  height: 1.00.hp,
                ),
                SizedBox(
                  width: 81.00.wp,
                  child: TextFormField(
                    controller: _amountController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Ce champs ne peut etre vide";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(2.00.hp),
                          child: Text(
                            "cfa",
                            style: TextStyle(
                              fontSize: 18.00.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        hintText: "Ex: 1500",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 11.00.sp),
                        filled: true,
                        fillColor: HexColor(MyColors.backgroundColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white),
                        )),
                  ),
                ),
                SizedBox(
                  height: 7.00.hp,
                ),
                SizedBox(
                  width: 80.00.wp,
                  height: 6.50.hp,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        backgroundColor: HexColor(MyColors.green)),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          _isActive = true;
                        });
                        await apiService
                            .makeDeposit(
                                _idController.text, _amountController.text)
                            .then(
                              (value) => log(value.toString()),
                            );
                        setState(() {
                          _isActive = false;
                        });
                      }
                    },
                    child: _isActive
                        ? Loader()
                        : Row(
                            children: [
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 4.00.hp,
                              ),
                              SizedBox(
                                width: 20.00.wp,
                              ),
                              Text(
                                "RECHARGER",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.00.sp,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
