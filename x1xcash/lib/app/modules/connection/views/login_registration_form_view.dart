import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:x1xcash/app/core/services/api/api.service.dart';
import 'package:x1xcash/app/core/utils/extensions.dart';
import 'package:x1xcash/app/core/values/colors.dart';
import 'package:x1xcash/app/modules/registration/views/registration_view.dart';
import 'package:x1xcash/app/modules/transaction/views/transaction_view.dart';
import 'package:x1xcash/app/modules/widgets/loader_widget.dart';
import 'package:x1xcash/locator.dart';

// Transform.translate(
//                   offset: Offset(00.00, -5.00.hp),
//                   child: Container(
//                     height: 83.00.hp,
//                     width: Get.mediaQuery.size.width,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage("assets/images/illustrator_home.png"),
//                         fit: BoxFit.fitHeight,
//                         alignment: Alignment.topLeft,
//                       ),
//                     ),
//                   ),
//                 ),

class LoginRegistrationFormView extends StatefulWidget {
  const LoginRegistrationFormView({Key? key}) : super(key: key);

  @override
  State<LoginRegistrationFormView> createState() =>
      _LoginRegistrationFormViewState();
}

class _LoginRegistrationFormViewState extends State<LoginRegistrationFormView> {
  final _mailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _pwdController = TextEditingController();
  final apiService = locator<ApiService>();

  final _formKey = GlobalKey<FormState>();
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor(MyColors.backgroundColor),
      body: SafeArea(
        child: Container(
          height: Get.mediaQuery.size.height,
          width: Get.mediaQuery.size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              alignment: Alignment.topLeft,
              image: AssetImage(
                "assets/images/illustrator_home.png",
              ),
            ),
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              height: Get.mediaQuery.size.height,
              width: Get.mediaQuery.size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40.00.hp,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.00.wp,
                      vertical: 10,
                    ),
                    child: Text(
                      "S'inscrire",
                      style: TextStyle(
                          fontSize: 30.00.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 100.00.wp,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(8.00.wp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Please enter",
                              style: TextStyle(fontSize: 20.00.sp),
                            ),
                            SizedBox(
                              height: 3.00.hp,
                            ),
                            Text(
                              "E-mail",
                              style: TextStyle(fontSize: 13.00.sp),
                            ),
                            SizedBox(
                              width: 81.00.wp,
                              child: TextFormField(
                                controller: _mailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(fontSize: 20.00.sp),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Ce champs ne peut etre vide";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0,
                                    vertical: 1.00.wp,
                                  ),
                                  hintText: "xcash@bet.com",
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.00.hp,
                            ),
                            Text(
                              "Numéro de téléphone",
                              style: TextStyle(fontSize: 13.00.sp),
                            ),
                            SizedBox(
                              width: 81.00.wp,
                              child: TextFormField(
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                style: TextStyle(
                                  fontSize: 20.00.sp,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Ce champs ne peut etre vide";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0,
                                    vertical: 1.00.wp,
                                  ),
                                  hintText: "98123244",
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(
                                      top: 0.50.hp,
                                      right: 1.00.wp,
                                    ),
                                    child: Text(
                                      "+229 ",
                                      style: TextStyle(
                                        fontSize: 20.00.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.00.hp,
                            ),
                            Text(
                              "Mot de passe",
                              style: TextStyle(fontSize: 13.00.sp),
                            ),
                            SizedBox(
                              width: 81.00.wp,
                              child: TextFormField(
                                obscureText: true,
                                controller: _pwdController,
                                keyboardType: TextInputType.text,
                                style: TextStyle(fontSize: 20.00.sp),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Ce champs ne peut etre vide";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0,
                                    vertical: 1.00.wp,
                                  ),
                                  hintText: "Ex: 1xcash229",
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const Gap(10),
                            SizedBox(
                              width: 80.00.wp,
                              height: 6.50.hp,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  backgroundColor: HexColor(MyColors.green),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    apiService.phone = _mailController.text;
                                    apiService.password = _pwdController.text;
                                    setState(() {
                                      _isActive = true;
                                    });
                                    try {
                                      await apiService
                                          .register(
                                            lastname: _mailController.text
                                                .split('@')[0],
                                            firstname: _mailController.text
                                                .split('@')[0],
                                            email: apiService.phone!,
                                            password: apiService.password!,
                                            telephone: _phoneController.text,
                                          )
                                          .then(
                                            (value) => log(
                                              value!.toJson().toString(),
                                            ),
                                          );
                                      await apiService.login().then(
                                            (value) => log(
                                              value!.toJson().toString(),
                                            ),
                                          );
                                      // Get.to(() => TransactionView());
                                    } catch (e) {
                                      log(e.toString());
                                    }
                                    setState(() {
                                      _isActive = false;
                                    });
                                  }
                                  //
                                },
                                child: _isActive
                                    ? const Loader()
                                    : Text(
                                        "Je m'inscris",
                                        style: TextStyle(
                                          fontSize: 15.00.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
