import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:get/get.dart';
import 'package:x1xcash/app/core/values/colors.dart';
import 'package:gap/gap.dart';
import 'package:x1xcash/app/core/utils/extensions.dart';
import 'package:x1xcash/app/modules/connection/views/connection_form_view.dart';
import 'package:x1xcash/app/modules/connection/views/login_registration_form_view.dart';
import 'package:x1xcash/app/modules/registration/views/registration_form_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
              child: Padding(
                padding: EdgeInsets.only(top: 25.00.hp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40.00.hp,
                      padding: EdgeInsets.only(right: 10.00.hp),
                      child: Text(
                        "1XCASH Partner App...",
                        style: TextStyle(
                            fontSize: 40.00.sp,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    const Gap(10),
                    Container(
                      width: 95.00.wp,
                      padding: EdgeInsets.only(left: 10.00.wp),
                      child: Text(
                        "An Easy app to manage your all payment and finance related needs",
                        style: TextStyle(
                          fontSize: 11.00.sp,
                        ),
                      ),
                    ),
                    const Gap(20),
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
                          Get.to(
                            () => ConnectionFormView(),
                          );
                        },
                        child: Text(
                          "Se connecter",
                          style: TextStyle(
                            fontSize: 15.00.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Gap(30),
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
                        onPressed: () {
                          Get.to(
                            () => const LoginRegistrationFormView(),
                          );
                        },
                        child: Text(
                          "S'inscrire",
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
        ),
      ),
    );
  }
}
