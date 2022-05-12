import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:x1xcash/app/core/services/api/api.service.dart';
import 'package:get/get.dart';
import 'package:x1xcash/app/core/utils/extensions.dart';
import 'package:x1xcash/app/core/values/colors.dart';
import 'package:x1xcash/app/modules/widgets/loader_widget.dart';
import 'package:x1xcash/locator.dart';

class WithdrawalCodeDisplayView extends StatefulWidget {
  const WithdrawalCodeDisplayView({Key? key}) : super(key: key);

  @override
  State<WithdrawalCodeDisplayView> createState() =>
      _WithdrawalCodeDisplayViewState();
}

class _WithdrawalCodeDisplayViewState extends State<WithdrawalCodeDisplayView> {
  final _idController = TextEditingController();
  final _amountController = TextEditingController();
  final _phoneController = TextEditingController();
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
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: IconThemeData(color: Colors.black, size: 3.50.hp),
        title: Text(
          'Retrait 1xbet',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18.00.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5.00.hp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 80.00.wp,
                height: 17.50.hp,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: HexColor(MyColors.backgroundColor),
                  ),
                  child: _isActive
                      ? const Loader()
                      : Center(
                          child: Icon(
                            Icons.check_circle,
                            size: 11.00.hp,
                            color: Colors.green,
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 7.00.hp,
              ),
              Center(
                child: Text(
                  "5000" + "cfa",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 25.00.sp),
                ),
              ),
              SizedBox(
                height: 4.00.hp,
              ),
              Center(
                child: Text(
                  "A été reçu sur votre compte marchand 1XCASH",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.00.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 11.00.hp,
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
                    setState(() {
                      _isActive = true;
                    });

                    Get.back();

                    setState(() {
                      _isActive = false;
                    });
                  },
                  child: _isActive
                      ? const Loader()
                      : Text(
                          "RETOUR",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.00.sp,
                              color: Colors.white),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
