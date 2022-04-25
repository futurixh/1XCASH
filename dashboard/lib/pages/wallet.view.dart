import 'package:flutter/cupertino.dart';
import 'package:flutter_web_seo/components/wallets_table.dart';

class WalletView extends StatefulWidget {
  const WalletView({Key? key}) : super(key: key);

  static String routeName = 'Wallet';

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WalletsTable(),
      ],
    );
  }
}
