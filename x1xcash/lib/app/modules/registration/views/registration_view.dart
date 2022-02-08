import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import 'package:get/get.dart';
import 'package:x1xcash/app/core/utils/extensions.dart';

import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#EEF7FB"),
      body: SafeArea(
        child: Column(
            children: [
              Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.all(3.00.hp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 13.00.hp,
                          ),
                          Text(
                            "Devenez partenaire",
                            style: TextStyle(
                                fontSize: 20.00.sp,
                                fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "1XCASH",
                            style: TextStyle(
                              fontSize: 22.00.sp,
                              fontWeight: FontWeight.w900,
                              color: HexColor("#66C48F")
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 7.00.hp),
                            child: Text(
                              "Effectuez des opérations de Dépôt et Retrait sur 1XBET à partir de votre compte marchand 1XCASH",
                              style: TextStyle(
                                fontSize: 12.00.sp,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                ),
              Expanded(
                flex: 4,
                  child: Stack(
                      children: [
                        Transform.translate(
                          offset: Offset(45.00.wp, -13.00.hp),
                          child: Container(
                            width: 75.00.wp,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: HexColor("#66C48F").withOpacity(0.4),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(33.00.wp, 0.00.hp),
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/souscription.png")
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 11.00.hp,
                          left: 15.00.wp,
                          child: SizedBox(
                              width: 70.00.wp,
                              height: 7.00.hp,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                                    backgroundColor: HexColor("#66C48F")
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Souscrire",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.00.sp,
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                        ),
                      ],
                    ),
                  )
            ],
          ),
        ),
    );
  }
}
