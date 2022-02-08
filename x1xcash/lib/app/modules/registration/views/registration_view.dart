import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:x1xcash/app/core/utils/extensions.dart';

import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text(
                      "Devenez partenaire",
                      style: TextStyle(
                          fontSize: 20.00.sp,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "1XCASH",
                      style: TextStyle(
                        fontSize: 20.00.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                      ),
                    ),
                    Text(
                      "Effectuez des opérations de Dépôt et Retrait sur 1XBET à partir de votre compte marchand 1XCASH",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                )
            ),
            Expanded(
                flex: 2,
                child: SizedBox()
            )
          ],
        ),
      ),
    );
  }
}
