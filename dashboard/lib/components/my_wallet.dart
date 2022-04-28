import 'package:flutter/foundation.dart';
import 'package:flutter_web_seo/components/loader_widget.dart';
import 'package:flutter_web_seo/models/MyFiles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_web_seo/services/api/wallet/wallet.dart';
import 'package:flutter_web_seo/utils/sizeconf.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/number_symbols.dart';

import '../models/user.model.dart';
import '../models/wallet.model.dart';
import '../services/api/api.service.dart';
import '../utils/constants.dart';
import '../utils/locator.dart';

class MyWalletCard extends StatefulWidget {
  const MyWalletCard({
    Key? key, this.currentUser,
  }) : super(key: key);

  final User? currentUser;

  @override
  State<MyWalletCard> createState() => _MyWalletCardState();
}

class _MyWalletCardState extends State<MyWalletCard> {

  final apiService = locator<ApiService>();
  final NumberFormat myFormat = NumberFormat("###,###", "zz");
  Wallet? myWallet;

  Future getMyWallet() async {
    try {
      await apiService.getMyWallet().then(
            (value) {
          if (kDebugMode) {
            print(value!);
          }
          if (mounted) {
            setState(() {
              myWallet = value;
            });
          }
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getMyWallet();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.00.hp),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Mon portefeuille 1XCASH", style: GoogleFonts.inconsolata(fontSize: 5.00.sp)),
              myWallet != null ? Text("${myWallet!.user!.lastname!} ${myWallet!.user!.firstname! }", style: GoogleFonts.inconsolata(fontSize: 5.00.sp)) : const Loader(),
              //Icon(Icons.more_vert, color: Colors.white54)
            ],
          ),
          SizedBox(height: 3.00.hp,),
          myWallet != null ? Text(myFormat.format(myWallet?.solde), style: GoogleFonts.inconsolata(fontSize: 8.00.sp)) : const Loader(),
        ],
      ),
    );
  }
}
