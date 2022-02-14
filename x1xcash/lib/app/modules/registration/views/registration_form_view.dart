import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import 'package:get/get.dart';
import 'package:x1xcash/app/core/utils/extensions.dart';
import 'package:x1xcash/app/modules/home/views/home_view.dart';

class RegistrationFormView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#EEF7FB"),
      body: SafeArea(
        child: SizedBox(
          height: Get.mediaQuery.size.height,
          width: Get.mediaQuery.size.width,
          child: Stack(
            children: [
              Transform.translate(
                    offset: Offset(35.00.wp, 26.00.hp),
                    child: Container(
                      width: 80.00.wp,
                      height: 60.00.hp,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor("#66C48F").withOpacity(0.4),
                      ),
                    ),
                  ),
              Positioned(
                top: 84.00.hp,
                left: 11.00.wp,
                child: SizedBox(
                  width: 80.00.wp,
                  height: 8.00.hp,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                        backgroundColor: HexColor("#66C48F")
                    ),
                    onPressed: () {Get.to(() => HomeView());},
                    child: Text(
                      "Soumettre",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.00.sp,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(3.00.hp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3.00.hp,
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
                      height: 7.00.hp,
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
                                  hintText: "Ex: Département, ville, arrondissement",
                                  hintStyle: TextStyle(
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
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 58.00.hp,
                left: 5.00.wp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Registre RCCM",
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
                              width: 35.00.wp,
                              height: 7.00.hp,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                                    backgroundColor: Colors.white
                                ),
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Importer",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.00.sp
                                        ),
                                      ),
                                      SizedBox(
                                        width: 7.00.wp,
                                      ),
                                      const Icon(
                                        IconData(0xe190, fontFamily: 'MaterialIcons'),
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 12.00.wp,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "IFU",
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
                              width: 35.00.wp,
                              height: 7.00.hp,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                                    backgroundColor: Colors.white
                                ),
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Importer",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.00.sp
                                        ),
                                      ),
                                      SizedBox(
                                        width: 7.00.wp,
                                      ),
                                      const Icon(
                                        IconData(0xe190, fontFamily: 'MaterialIcons'),
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.00.hp,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pièces d'identité",
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
                              width: 35.00.wp,
                              height: 7.00.hp,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                                    backgroundColor: Colors.white
                                ),
                                onPressed: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Importer",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.00.sp
                                        ),
                                      ),
                                      SizedBox(
                                        width: 7.00.wp,
                                      ),
                                      const Icon(
                                        IconData(0xe190, fontFamily: 'MaterialIcons'),
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.00.hp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
