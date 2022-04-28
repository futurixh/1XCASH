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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
    );
  }
}
