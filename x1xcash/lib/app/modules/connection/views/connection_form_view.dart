import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import 'package:get/get.dart';
import 'package:x1xcash/app/core/utils/extensions.dart';
import 'package:x1xcash/app/modules/registration/views/registration_view.dart';

class ConnectionFormView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: HexColor("#EEF7FB"),
        body: SafeArea(
            child: SizedBox(
              height: Get.mediaQuery.size.height,
              width: Get.mediaQuery.size.width,
              child: Stack(
                children: [
                  Transform.translate(
                    offset: Offset(00.00, -5.00.hp),
                    child: Container(
                      height: 83.00.hp,
                      width: Get.mediaQuery.size.width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/illustrator_home.png"),
                            fit: BoxFit.fitHeight,
                            alignment: Alignment.topLeft
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 46.00.hp,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.00.wp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 40.00.hp,
                              padding: EdgeInsets.only(right: 10.00.hp),
                              child: Text(
                                "Connexion",
                                style: TextStyle(
                                    fontSize: 30.00.sp,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                  Positioned(
                      top: 53.00.hp,
                      child: Container(
                              height: 50.00.hp,
                              width: 100.00.wp,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)
                                )
                              ),
                        child: Padding(
                          padding: EdgeInsets.all(8.00.wp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Please enter",
                                style: TextStyle(
                                  fontSize: 22.00.sp
                                ),
                              ),
                              SizedBox(
                                height: 3.00.hp,
                              ),
                              Text(
                                "Nom utilisateur",
                                style: TextStyle(
                                    fontSize: 13.00.sp
                                ),
                              ),
                              SizedBox(
                                width: 81.00.wp,
                                child: TextFormField(
                                  style: TextStyle(
                                    fontSize: 25.00.sp
                                  ),
                                  decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 1.00.wp),
                                      hintText: "Ex: celinepay",
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
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.00.hp,
                              ),
                              Text(
                                "Numéro de téléphone",
                                style: TextStyle(
                                    fontSize: 13.00.sp
                                ),
                              ),
                              SizedBox(
                                width: 81.00.wp,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(
                                      fontSize: 25.00.sp,
                                  ),
                                  decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 1.00.wp),
                                      hintText: "9812345678",
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(top: 0.50.hp, right: 1.00.wp),
                                        child: Text("+91", style: TextStyle(fontSize: 25.00.sp, fontWeight: FontWeight.bold)),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                            ),
                        ),
                  Positioned(
                    top: 85.00.hp,
                    left: 11.00.wp,
                    child: SizedBox(
                      width: 80.00.wp,
                      height: 6.50.hp,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                            backgroundColor: HexColor("#66C48F")
                        ),
                        onPressed: () {
                          Get.to(() => RegistrationView());
                        },
                        child: Text(
                          "Se connecter",
                          style: TextStyle(
                              fontSize: 15.00.sp,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}
