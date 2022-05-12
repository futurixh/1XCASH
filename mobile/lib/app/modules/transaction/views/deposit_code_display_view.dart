import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:x1xcash/app/core/services/api/api.service.dart';
import 'package:x1xcash/app/core/utils/extensions.dart';
import 'package:x1xcash/app/core/values/colors.dart';
import 'package:x1xcash/app/modules/widgets/loader_widget.dart';
import 'package:x1xcash/locator.dart';

class DepositCodeDisplayView extends StatefulWidget {
  const DepositCodeDisplayView({Key? key}) : super(key: key);

  @override
  State<DepositCodeDisplayView> createState() => _DepositCodeDisplayViewState();
}

class _DepositCodeDisplayViewState extends State<DepositCodeDisplayView> {
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
        child: Padding(
            padding: EdgeInsets.all(5.00.hp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "5000" + " cfa",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                        fontSize: 25.00.sp),
                  ),
                ),
                SizedBox(
                  height: 3.00.hp,
                ),
                Center(
                  child: QrImage(
                    data: '7845633255',
                    version: QrVersions.auto,
                    size: 250,
                    gapless: false,
                    embeddedImage: const AssetImage('assets/images/1xbet_logo.png'),
                    embeddedImageStyle: QrEmbeddedImageStyle(
                      size: const Size(80, 40),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.00.hp,
                ),
                SizedBox(
                  width: 80.00.wp,
                  height: 7.50.hp,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: HexColor(MyColors.backgroundColor),
                    ),
                    child: _isActive
                        ? const Loader()
                        : Center(
                          child: Text(
                                  "78945JDLQLE545D",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.00.sp,
                                      color: Colors.black),
                                ),
                        ),
                  ),
                ),
                SizedBox(
                  height: 3.00.hp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 30.00.wp,
                      height: 6.50.hp,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            backgroundColor: HexColor(MyColors.green)),
                        onPressed: () async {
                        },
                        child: _isActive
                            ? const Loader()
                            : Text(
                          "COPIER",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.00.sp,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.00.wp,
                      height: 6.50.hp,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            backgroundColor: HexColor(MyColors.green)),
                        onPressed: () async {
                        },
                        child: _isActive
                            ? const Loader()
                            : Text(
                          "PARTAGER",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.00.sp,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }
}
