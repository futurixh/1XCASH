import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_seo/components/loader_widget.dart';
import 'package:flutter_web_seo/constants.dart';
import 'package:flutter_web_seo/services/api/api.service.dart';
import 'package:flutter_web_seo/services/api/auth/auth.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../locator.dart';
import '../responsive.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: bgColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              Text('1xCash',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(
                height: 60,
              ),
              Container(
                height: 550,
                width: 700,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text('Login',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                          padding: EdgeInsets.all(16.0),
                          child: SizedBox(
                              width: 550,
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
                          padding: EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: 550,
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
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 370,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: "Forgot your password ?",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {})),
                        ],
                      ),
                      SizedBox(height: 50),
                      ElevatedButton(
                        style: TextButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding * 14.5,
                            vertical: defaultPadding /
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
                                    (value) => print(
                                  value!.toJson().toString(),
                                ),
                              );
                              QR.to('/');
                            } catch (e) {
                              print(e.toString());
                            }
                            setState(() {
                              _isActive = false;
                            });
                          }
                        },
                        child: _isActive ? const Loader() : Text("Se connecter"),
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
