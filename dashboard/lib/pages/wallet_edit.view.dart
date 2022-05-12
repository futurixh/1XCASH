import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_seo/components/loader_widget.dart';
import 'package:flutter_web_seo/models/wallet.model.dart';
import 'package:flutter_web_seo/services/api/wallet/wallet.dart';
import 'package:flutter_web_seo/utils/sizeconf.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../services/api/api.service.dart';
import '../utils/constants.dart';
import '../utils/locator.dart';
import '../utils/responsive.dart';

class WalletEdit extends StatefulWidget {
  static String routeName = 'Wallet Edit';
  const WalletEdit({Key? key}) : super(key: key);

  @override
  State<WalletEdit> createState() => _WalletEditState();
}

class _WalletEditState extends State<WalletEdit> {
  final id = QR.params['id'].toString();
  TextEditingController _soldeController = TextEditingController();
  final apiService = locator<ApiService>();
  final _formKey = GlobalKey<FormState>();
  bool _isActive = false;
  bool _isEdit = false;
  Wallet? wallet;

  Future getWallet() async {
    setState(() {
      _isActive = true;
    });
    await apiService.getWallet(id).then((value) {
      if (mounted) {
        setState(() {
          wallet = value;
          _soldeController = TextEditingController()..text = value!.solde.toString();
          _isActive = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getWallet();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.00.hp),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: _isActive ? const Loader() : Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(2.00.hp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 0, bottom: 0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "Solde",
                                style: TextStyle(fontSize: 3.00.sp, color: Colors.black87)
                            )
                        ),
                        SizedBox(
                          width: 3.00.wp,
                        ),
                        SizedBox(
                          width: 40.00.wp,
                          child: TextFormField(
                            controller: _soldeController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Ce champs ne peut etre vide";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "5233",
                              fillColor: secondaryColor,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius:  BorderRadius.all(Radius.circular(10)),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        )
                      ],),
                  ),
                ],
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(1.00.hp),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.00.wp * 1.5,
                        vertical:
                        1.80.hp / (Responsive.isMobile(context) ? 2 : 0.7),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _isEdit = true;
                        });
                        try {
                          await apiService.editWallet(id, _soldeController.text).then(
                                (value) {
                              if (kDebugMode) {
                                print(value!.toJson().toString(),);
                              }
                            },
                          );
                        } catch (e) {
                          if (kDebugMode) {
                            print(e.toString());
                          }
                        }
                        setState(() {
                          _isEdit = false;
                        });
                      }
                    },
                    child: _isEdit ? const Loader() : const Text("Enregistrer"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.0.hp),
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.00.wp * 1.5,
                        vertical:
                        1.80.hp / (Responsive.isMobile(context) ? 2 : 0.7),
                      ),
                    ),
                    onPressed: () {QR.to("/wallet");},
                    child: const Text("Quitter"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}