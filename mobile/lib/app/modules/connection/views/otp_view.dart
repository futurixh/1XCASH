import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:x1xcash/app/core/values/colors.dart';

class OtpView extends StatefulWidget {
  const OtpView({Key? key}) : super(key: key);

  static const routeName = '/otp';
  @override
  _OtpViewState createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(MediaQuery.of(context).size.height * (0.2)),
              Text(
                "Entrer le code de vérification",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
              const Gap(10),
              const Text(
                'Nous avons envoyé un code de de 6 chiffre à votre numéro de téléphone',
                style: TextStyle(),
              ),
              const Gap(50),
              PinCodeTextField(
                controller: _codeController,
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  borderWidth: 1,
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: HexColor(MyColors.green),
                  disabledColor: Colors.white,
                  activeColor: HexColor(MyColors.green),
                  inactiveColor: Colors.transparent,
                  inactiveFillColor: Colors.white,
                  selectedColor: HexColor(MyColors.green),
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (v) {},
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
              const Gap(50),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: HexColor(MyColors.green),
                  ),
                  onPressed: () {
                    //Navigator.of(context).pushNamed(OtpView.routeName);
                    Navigator.of(context).pop(_codeController.text);
                  },
                  child: const Text(
                    'Confirmer le code de vérification',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
