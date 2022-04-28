import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_seo/components/loader_widget.dart';
import 'package:flutter_web_seo/utils/constants.dart';
import 'package:flutter_web_seo/services/api/api.service.dart';
import 'package:flutter_web_seo/services/api/auth/auth.dart';
import 'package:flutter_web_seo/utils/sizeconf.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../utils/locator.dart';
import '../utils/responsive.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _phoneController = TextEditingController();
  final _pwdController = TextEditingController();
  final apiService = locator<ApiService>();
  final _formKey = GlobalKey<FormState>();
  bool _isActive = false;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    GetSizePerScreen().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: bgColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15.00.hp,
              ),
              Text('1xCash',
                  style: TextStyle(
                      fontSize: 8.00.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(
                height: 5.00.hp,
              ),
              Container(
                height: 50.00.hp,
                width: 40.00.wp,
                decoration: const BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.00.hp,
                      ),
                      Text('Login',
                          style: TextStyle(
                              fontSize: 3.50.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(
                        height: 5.00.hp,
                      ),
                      Padding(
                          padding: EdgeInsets.all(2.0.hp),
                          child: SizedBox(
                              width: 30.00.wp,
                              child: TextFormField(
                                controller: _phoneController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Ce champs ne peut etre vide";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Enter phone number",
                                  fillColor: secondaryColor,
                                  filled: true,
                                  suffixIcon: Icon(
                                    Icons.phone,
                                    color: Colors.grey,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
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
                            ),
                          ),
                      Padding(
                          padding: EdgeInsets.all(2.00.hp),
                          child: SizedBox(
                            width: 30.00.wp,
                            child: TextFormField(
                              obscureText: _isObscure,
                              controller: _pwdController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Ce champs ne peut etre vide";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter password",
                                fillColor: secondaryColor,
                                filled: true,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    !_isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedErrorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 21.00.wp,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: "Forgot your password ?",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 2.60.sp,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {})),
                        ],
                      ),
                      SizedBox(height: 5.0.hp),
                      ElevatedButton(
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.00.wp,
                            vertical: 1.60.hp /
                                (Responsive.isMobile(context) ? 2 : 0.7),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            apiService.phone = _phoneController.text;
                            apiService.password = _pwdController.text;
                            setState(() {
                              _isActive = true;
                            });
                            try {
                              await apiService.login().then(
                                    (value) {
                                      if (kDebugMode) {
                                        print(
                                        value!.toJson().toString(),
                                      );
                                      }
                                    },
                              );
                              QR.to('/');
                            } catch (e) {
                              if (kDebugMode) {
                                print(e.toString());
                              }
                            }
                            setState(() {
                              _isActive = false;
                            });
                          }
                        },
                        child: _isActive ? const Loader() : const Text("Se connecter"),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
