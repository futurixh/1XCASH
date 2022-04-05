import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import 'package:get/get.dart';
import 'package:x1xcash/app/core/utils/extensions.dart';
import 'package:x1xcash/app/core/values/colors.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.00.hp, bottom: 1.00.hp),
      child: SizedBox(
        width: Get.mediaQuery.size.width,
        child: Row(
          children: [
            Container(
              height: 7.00.hp,
              width: 12.00.wp,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(0.60.hp),
                child: Image.asset("assets/images/1xbet_logo.png"),
              ),
            ),
            SizedBox(
              width: 2.00.wp,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: Text(
                  "Dépôt",
                  style: TextStyle(fontSize: 12.00.sp),
                )),
                Container(
                    child: Text(
                  "2268397335939329",
                  style: TextStyle(color: Colors.grey),
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
                    top: 1.00.hp, bottom: 1.00.hp, left: 2.00.wp),
                child: Text(
                  "-1,200",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 10.50.sp,
                      color: HexColor(MyColors.redTransaction),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
