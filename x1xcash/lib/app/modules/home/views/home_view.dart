import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import 'package:get/get.dart';
import 'package:x1xcash/app/core/utils/extensions.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: Get.mediaQuery.size.height,
          width: Get.mediaQuery.size.width,
          child: Column(
            children: [
              SizedBox(
                height: 10.00.hp,
              ),
              Text(
                "Portefeuille",
                style: TextStyle(fontSize: 13.00.sp),
              ),
              SizedBox(
                height: 1.00.hp,
              ),
              Text(
                "CFA 85,625",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.00.sp,
                ),
              ),
              SizedBox(
                height: 7.00.hp,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.00.wp, right: 8.00.wp),
                child: Row(
                  children: [
                    SizedBox(
                      width: 40.00.wp,
                      height: 10.00.hp,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            backgroundColor: HexColor("#1E32FA")),
                        onPressed: () {},
                        child: Text(
                          "Dépôt",
                          style: TextStyle(
                              fontSize: 15.00.sp, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.00.wp,
                    ),
                    SizedBox(
                      width: 40.00.wp,
                      height: 10.00.hp,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: HexColor("#66C48F")),
                        onPressed: () {},
                        child: Text(
                          "Retrait",
                          style: TextStyle(
                              fontSize: 15.00.sp, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.00.hp,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.00.wp, right: 8.00.wp),
                child: SizedBox(
                  width: 90.00.wp,
                  height: 12.00.hp,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)),
                        backgroundColor: HexColor("#FFB300")),
                    onPressed: () {},
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25.00.wp,
                          child: Text.rich(
                            TextSpan(
                                text: "200% ",
                                style: TextStyle(fontSize: 20.00.sp),
                                children: [
                                  TextSpan(
                                      text: "BONUS",
                                      style: TextStyle(
                                        fontSize: 15.00.sp,
                                      ))
                                ]),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        SizedBox(
                          width: 18.00.wp,
                        ),
                        SizedBox(
                          child: Image.asset("assets/images/1xbet_logo.png"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.50.hp,
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      color: HexColor("#EEF7FB"),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 46.00.wp,
                              right: 46.00.wp,
                              top: 4.00.hp,
                              bottom: 2.00.hp),
                          child: Container(
                            height: 0.65.hp,
                            width: 8.00.wp,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.00.wp),
                          child: Text(
                            "RECENT TRANSACTIONS",
                            style: TextStyle(fontSize: 12.50.sp),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(top: 2.00.hp),
                          child: ListView(
                            padding: EdgeInsets.only(left: 8.00.wp),
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.00.hp, bottom: 1.00.hp),
                                child: Container(
                                  width: Get.mediaQuery.size.width,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 7.00.hp,
                                        width: 12.00.wp,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(0.60.hp),
                                          child: Image.asset(
                                              "assets/images/1xbet_logo.png"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.00.wp,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Text(
                                            "Dépôt",
                                            style:
                                                TextStyle(fontSize: 12.00.sp),
                                          )),
                                          Container(
                                              child: Text(
                                            "2268397335939329",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          )),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 22.00.wp,
                                      ),
                                      Container(
                                        width: 20.00.wp,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.00.hp,
                                              bottom: 1.00.hp,
                                              left: 2.00.wp),
                                          child: Text(
                                            "-2,000",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                color: HexColor("#DC0919"),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.00.hp, bottom: 1.00.hp),
                                child: Container(
                                  width: Get.mediaQuery.size.width,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 7.00.hp,
                                        width: 12.00.wp,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(0.60.hp),
                                          child: Image.asset(
                                              "assets/images/1xbet_logo.png"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.00.wp,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Text(
                                                "Dépôt",
                                                style:
                                                TextStyle(fontSize: 12.00.sp),
                                              )),
                                          Container(
                                              child: Text(
                                                "2268397335939329",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 22.00.wp,
                                      ),
                                      Container(
                                        width: 20.00.wp,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.00.hp,
                                              bottom: 1.00.hp,
                                              left: 2.00.wp),
                                          child: Text(
                                            "-2,000",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                color: HexColor("#DC0919"),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.00.hp, bottom: 1.00.hp),
                                child: Container(
                                  width: Get.mediaQuery.size.width,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 7.00.hp,
                                        width: 12.00.wp,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(0.60.hp),
                                          child: Image.asset(
                                              "assets/images/1xbet_logo.png"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.00.wp,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Text(
                                                "Dépôt",
                                                style:
                                                TextStyle(fontSize: 12.00.sp),
                                              )),
                                          Container(
                                              child: Text(
                                                "2268397335939329",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 22.00.wp,
                                      ),
                                      Container(
                                        width: 20.00.wp,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.00.hp,
                                              bottom: 1.00.hp,
                                              left: 2.00.wp),
                                          child: Text(
                                            "-2,000",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                color: HexColor("#DC0919"),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.00.hp, bottom: 1.00.hp),
                                child: Container(
                                  width: Get.mediaQuery.size.width,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 7.00.hp,
                                        width: 12.00.wp,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(0.60.hp),
                                          child: Image.asset(
                                              "assets/images/1xbet_logo.png"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.00.wp,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Text(
                                                "Dépôt",
                                                style:
                                                TextStyle(fontSize: 12.00.sp),
                                              )),
                                          Container(
                                              child: Text(
                                                "2268397335939329",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 22.00.wp,
                                      ),
                                      Container(
                                        width: 20.00.wp,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.00.hp,
                                              bottom: 1.00.hp,
                                              left: 2.00.wp),
                                          child: Text(
                                            "-2,000",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                color: HexColor("#DC0919"),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.00.hp, bottom: 1.00.hp),
                                child: Container(
                                  width: Get.mediaQuery.size.width,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 7.00.hp,
                                        width: 12.00.wp,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(0.60.hp),
                                          child: Image.asset(
                                              "assets/images/1xbet_logo.png"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.00.wp,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Text(
                                                "Dépôt",
                                                style:
                                                TextStyle(fontSize: 12.00.sp),
                                              )),
                                          Container(
                                              child: Text(
                                                "2268397335939329",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 22.00.wp,
                                      ),
                                      Container(
                                        width: 20.00.wp,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.00.hp,
                                              bottom: 1.00.hp,
                                              left: 2.00.wp),
                                          child: Text(
                                            "-2,000",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                color: HexColor("#DC0919"),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.00.hp, bottom: 1.00.hp),
                                child: Container(
                                  width: Get.mediaQuery.size.width,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 7.00.hp,
                                        width: 12.00.wp,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(0.60.hp),
                                          child: Image.asset(
                                              "assets/images/1xbet_logo.png"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.00.wp,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Text(
                                                "Dépôt",
                                                style:
                                                TextStyle(fontSize: 12.00.sp),
                                              )),
                                          Container(
                                              child: Text(
                                                "2268397335939329",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 22.00.wp,
                                      ),
                                      Container(
                                        width: 20.00.wp,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.00.hp,
                                              bottom: 1.00.hp,
                                              left: 2.00.wp),
                                          child: Text(
                                            "-2,000",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                color: HexColor("#DC0919"),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.00.hp, bottom: 1.00.hp),
                                child: Container(
                                  width: Get.mediaQuery.size.width,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 7.00.hp,
                                        width: 12.00.wp,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(0.60.hp),
                                          child: Image.asset(
                                              "assets/images/1xbet_logo.png"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.00.wp,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Text(
                                                "Dépôt",
                                                style:
                                                TextStyle(fontSize: 12.00.sp),
                                              )),
                                          Container(
                                              child: Text(
                                                "2268397335939329",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 22.00.wp,
                                      ),
                                      Container(
                                        width: 20.00.wp,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.00.hp,
                                              bottom: 1.00.hp,
                                              left: 2.00.wp),
                                          child: Text(
                                            "-2,000",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                color: HexColor("#DC0919"),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.00.hp, bottom: 1.00.hp),
                                child: Container(
                                  width: Get.mediaQuery.size.width,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 7.00.hp,
                                        width: 12.00.wp,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(0.60.hp),
                                          child: Image.asset(
                                              "assets/images/1xbet_logo.png"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.00.wp,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Text(
                                                "Dépôt",
                                                style:
                                                TextStyle(fontSize: 12.00.sp),
                                              )),
                                          Container(
                                              child: Text(
                                                "2268397335939329",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 22.00.wp,
                                      ),
                                      Container(
                                        width: 20.00.wp,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.00.hp,
                                              bottom: 1.00.hp,
                                              left: 2.00.wp),
                                          child: Text(
                                            "-2,000",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                color: HexColor("#DC0919"),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.00.hp, bottom: 1.00.hp),
                                child: Container(
                                  width: Get.mediaQuery.size.width,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 7.00.hp,
                                        width: 12.00.wp,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(0.60.hp),
                                          child: Image.asset(
                                              "assets/images/1xbet_logo.png"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.00.wp,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Text(
                                                "Dépôt",
                                                style:
                                                TextStyle(fontSize: 12.00.sp),
                                              )),
                                          Container(
                                              child: Text(
                                                "2268397335939329",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 22.00.wp,
                                      ),
                                      Container(
                                        width: 20.00.wp,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.00.hp,
                                              bottom: 1.00.hp,
                                              left: 2.00.wp),
                                          child: Text(
                                            "-2,000",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                color: HexColor("#DC0919"),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.00.hp, bottom: 1.00.hp),
                                child: Container(
                                  width: Get.mediaQuery.size.width,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 7.00.hp,
                                        width: 12.00.wp,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(0.60.hp),
                                          child: Image.asset(
                                              "assets/images/1xbet_logo.png"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.00.wp,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Text(
                                                "Dépôt",
                                                style:
                                                TextStyle(fontSize: 12.00.sp),
                                              )),
                                          Container(
                                              child: Text(
                                                "2268397335939329",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 22.00.wp,
                                      ),
                                      Container(
                                        width: 20.00.wp,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.00.hp,
                                              bottom: 1.00.hp,
                                              left: 2.00.wp),
                                          child: Text(
                                            "-2,000",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                color: HexColor("#DC0919"),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 1.00.hp, bottom: 1.00.hp),
                                child: Container(
                                  width: Get.mediaQuery.size.width,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 7.00.hp,
                                        width: 12.00.wp,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(0.60.hp),
                                          child: Image.asset(
                                              "assets/images/1xbet_logo.png"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.00.wp,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Text(
                                                "Dépôt",
                                                style:
                                                TextStyle(fontSize: 12.00.sp),
                                              )),
                                          Container(
                                              child: Text(
                                                "2268397335939329",
                                                style:
                                                TextStyle(color: Colors.grey),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 22.00.wp,
                                      ),
                                      Container(
                                        width: 20.00.wp,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 1.00.hp,
                                              bottom: 1.00.hp,
                                              left: 2.00.wp),
                                          child: Text(
                                            "-2,000",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                color: HexColor("#DC0919"),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
