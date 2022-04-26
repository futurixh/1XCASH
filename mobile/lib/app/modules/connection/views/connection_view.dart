import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import 'package:get/get.dart';
import 'package:x1xcash/app/core/utils/extensions.dart';
import 'package:x1xcash/app/core/values/colors.dart';
import 'package:x1xcash/app/modules/connection/views/connection_form_view.dart';

import '../controllers/connection_controller.dart';

class ConnectionView extends GetView<ConnectionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(MyColors.backgroundColor),
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
                top: 52.00.hp,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.00.wp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        SizedBox(
                          height: 1.00.hp,
                        ),
                        Container(
                          width: 95.00.wp,
                          padding: EdgeInsets.only(right: 10.00.hp),
                          child: Text(
                            "An Easy app to manage your all payment and finance related needs",
                            style: TextStyle(
                                fontSize: 11.00.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
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
                        backgroundColor: HexColor(MyColors.green)
                    ),
                    onPressed: () {Get.to(() => ConnectionFormView());},
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
        ),
      )
    );
  }
}
