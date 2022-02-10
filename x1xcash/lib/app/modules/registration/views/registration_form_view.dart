import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import 'package:get/get.dart';
import 'package:x1xcash/app/core/utils/extensions.dart';

class RegistrationFormView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#EEF7FB"),
      body: SafeArea(
        child: SizedBox(
          height: Get.mediaQuery.size.height,
          child: Stack(
            children: [
              Transform.translate(
                    offset: Offset(45.00.wp, 36.00.hp),
                    child: Container(
                      width: 75.00.wp,
                      height: 57.00.hp,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor("#66C48F").withOpacity(0.4),
                      ),
                    ),
                  ),
              Padding(
                padding: EdgeInsets.all(3.00.hp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.00.hp,
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Remplissez ",
                          style: TextStyle(
                            fontSize: 19.00.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        children: [
                          TextSpan(
                            text: "le formulaire !",
                            style: TextStyle(
                                color: HexColor("#66C48F")
                            ),
                          ),
                        ]
                      )
                    ),
                    SizedBox(
                      height: 10.00.hp,
                    ),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Nom marchand",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontWeight: FontWeight.bold,
                              fontSize: 12.00.sp
                            ),
                          ),
                          SizedBox(
                            height: 1.00.hp,
                          ),
                          SizedBox(
                            width: 81.00.wp,
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.white),
                                )
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.00.hp,
                          ),
                          Text(
                            "Téléphone",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontWeight: FontWeight.bold,
                                fontSize: 12.00.sp
                            ),
                          ),
                          SizedBox(
                            height: 1.00.hp,
                          ),
                          SizedBox(
                            width: 81.00.wp,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.white),
                                  )
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.00.hp,
                          ),
                          Text(
                            "Département",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontWeight: FontWeight.bold,
                                fontSize: 12.00.sp
                            ),
                          ),
                          SizedBox(
                            height: 1.00.hp,
                          ),
                          SizedBox(
                            width: 81.00.wp,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Ex: Département, ville, arrondissement",
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.00.sp
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.white),
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
