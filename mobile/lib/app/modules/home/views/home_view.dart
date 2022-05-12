import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:x1xcash/app/core/utils/extensions.dart';
import 'package:x1xcash/app/core/values/colors.dart';
import 'package:x1xcash/app/modules/registration/views/registration_form_view.dart';
import 'package:x1xcash/app/modules/transaction/views/deposit_view.dart';
import 'package:x1xcash/app/modules/transaction/views/withdrawal_view.dart';
import 'package:x1xcash/app/modules/widgets/transaction_tile.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leadingWidth: MediaQuery.of(context).size.width * (0.5),
        leading: TextButton(
          onPressed: () {
            Get.to(() => RegistrationFormView());
          },
          child: const Text(
            'Verifier le compte',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await homeController.logout(context);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: homeController.isIsOnLogout.value
            ? Center(
                child: CircularProgressIndicator(
                  color: HexColor(
                    MyColors.green,
                  ),
                ),
              )
            : SizedBox(
                height: Get.mediaQuery.size.height,
                width: Get.mediaQuery.size.width,
                child: SingleChildScrollView(
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
                      Obx(
                        () => Text(
                          "CFA ${homeController.wallet.value.solde}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28.00.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.00.hp,
                      ),
                      Obx(
                        () => SelectableText(
                          "${homeController.wallet.value.sId}",
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
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
                                  backgroundColor: HexColor(MyColors.blue),
                                ),
                                onPressed: () {
                                  log("Clicked");
                                  Get.to(
                                    () => DepositView(),
                                  );
                                },
                                child: Text(
                                  "Dépôt",
                                  style: TextStyle(
                                    fontSize: 15.00.sp,
                                    color: Colors.white,
                                  ),
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
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    backgroundColor: HexColor(MyColors.green)),
                                onPressed: () {
                                  Get.to(
                                    () => const WithdrawalView(),
                                  );
                                },
                                child: Text(
                                  "Retrait",
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
                                borderRadius: BorderRadius.circular(22),
                              ),
                              backgroundColor: HexColor("#FFB300"),
                            ),
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
                                          ),
                                        )
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 18.00.wp,
                                ),
                                SizedBox(
                                  child: Image.asset(
                                      "assets/images/1xbet_logo.png"),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.50.hp,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: HexColor(MyColors.backgroundColor),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 46.00.wp,
                                right: 46.00.wp,
                                top: 4.00.hp,
                                bottom: 2.00.hp,
                              ),
                              child: Container(
                                height: 0.65.hp,
                                width: 8.00.wp,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.00.wp),
                              child: Text(
                                "RECENT TRANSACTIONS",
                                style: TextStyle(fontSize: 12.50.sp),
                              ),
                            ),
                            Obx(
                              () => Padding(
                                padding: EdgeInsets.only(
                                    top: 2.00.hp, left: 8.00.wp),
                                child: Column(
                                  children: List<TransactionTile>.generate(
                                    homeController.transactions.length,
                                    (index) => TransactionTile(
                                      transaction:
                                          homeController.transactions[index],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
