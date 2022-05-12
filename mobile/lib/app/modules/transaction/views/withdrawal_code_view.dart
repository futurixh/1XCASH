import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:x1xcash/app/core/services/api/api.service.dart';
import 'package:get/get.dart';
import 'package:x1xcash/app/core/utils/extensions.dart';
import 'package:x1xcash/app/core/values/colors.dart';
import 'package:x1xcash/app/modules/transaction/views/withdrawal_code_display_view.dart';
import 'package:x1xcash/app/modules/widgets/loader_widget.dart';
import 'package:x1xcash/locator.dart';

class WithdrawalCodeView extends StatefulWidget {
  const WithdrawalCodeView({
    Key? key,
    required this.code,
  }) : super(key: key);

  final String? code;

  @override
  State<WithdrawalCodeView> createState() => _WithdrawalCodeViewState();
}

class _WithdrawalCodeViewState extends State<WithdrawalCodeView> {
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
          icon: Icon(Icons.chevron_left),
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
                            Icons.store,
                            size: 13.00.hp,
                            color: Colors.grey,
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 4.00.hp,
              ),
              Center(
                child: Text(
                  "Votre code de retrait est :",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 12.00.sp),
                ),
              ),
              SizedBox(
                height: 4.00.hp,
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
                          child: SelectableText(
                            widget.code!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.00.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 13.00.hp,
              ),
              SizedBox(
                width: 80.00.wp,
                height: 6.50.hp,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    backgroundColor: HexColor(
                      MyColors.green,
                    ),
                  ),
                  onPressed: () async {
                    setState(() {
                      _isActive = true;
                    });
                    // Get.to(
                    //   () => const WithdrawalCodeDisplayView(),
                    // );
                    await Clipboard.setData(ClipboardData(text: widget.code))
                        .then(
                      (value) => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: HexColor(MyColors.green),
                          content: const Text(
                            "Copier avec succès",
                          ),
                        ),
                      ),
                    );
                    setState(() {
                      _isActive = false;
                    });
                  },
                  child: _isActive
                      ? const Loader()
                      : Text(
                          "COPIER",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.00.sp,
                            color: Colors.white,
                          ),
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
