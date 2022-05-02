import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:x1xcash/app/core/services/api/api.service.dart';
import 'package:x1xcash/app/core/utils/extensions.dart';
import 'package:x1xcash/app/core/values/colors.dart';
import 'package:x1xcash/app/modules/home/views/home_view.dart';
import 'package:x1xcash/app/modules/widgets/loader_widget.dart';

class RegistrationFormView extends StatefulWidget {
  RegistrationFormView({Key? key}) : super(key: key);

  @override
  State<RegistrationFormView> createState() => _RegistrationFormViewState();
}

class _RegistrationFormViewState extends State<RegistrationFormView> {
  File? rccm, ifu, identity;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor(MyColors.backgroundColor),
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
                      color: HexColor(MyColors.green).withOpacity(0.4),
                    ),
                  ),
                ),
                Positioned(
                  top: 75.00.hp,
                  left: 11.00.wp,
                  child: SizedBox(
                    width: 80.00.wp,
                    height: 8.00.hp,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22)),
                          backgroundColor: HexColor(MyColors.green)),
                      onPressed: () async {
                        final apiService = ApiService();
                        setState(() {
                          _isLoading = true;
                        });
                        try {
                          final storage = FlutterSecureStorage();
                          String? userId = await storage.read(key: 'id');

                          await apiService
                              .uploadInfos(
                            userId: userId!,
                            rccm: rccm!,
                            ifu: ifu!,
                            identity: identity!,
                          )
                              .then((value) {
                            log(value.toString());
                            Navigator.of(context).pop();
                          });
                        } catch (e) {
                          log('Error on upload ' + e.toString());
                        }
                        setState(() {
                          _isLoading = false;
                        });
                      },
                      child: _isLoading
                          ? const Loader()
                          : Text(
                              "Soumettre",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.00.sp,
                                color: Colors.white,
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
                      Text.rich(TextSpan(
                          text: "Remplissez ",
                          style: TextStyle(
                            fontSize: 19.00.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: "le formulaire !",
                              style: TextStyle(color: HexColor(MyColors.green)),
                            ),
                          ])),
                      SizedBox(
                        height: 7.00.hp,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 30.00.hp,
                  left: 5.00.wp,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Registre RCCM",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.00.sp,
                                ),
                              ),
                              SizedBox(
                                height: 1.00.hp,
                              ),
                              SizedBox(
                                width: 80.00.wp,
                                height: 7.00.hp,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(17),
                                      ),
                                      backgroundColor: Colors.white),
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          rccm != null
                                              ? rccm!.path.split('/').last
                                              : "Importer",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.00.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 7.00.wp,
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles();
                                            setState(() {
                                              rccm = File(
                                                  result!.files.single.path!);
                                            });
                                          },
                                          icon: const Icon(
                                            IconData(
                                              0xe190,
                                              fontFamily: 'MaterialIcons',
                                            ),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gap(30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "IFU",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.00.sp,
                                ),
                              ),
                              SizedBox(
                                height: 1.00.hp,
                              ),
                              SizedBox(
                                width: 80.00.wp,
                                height: 7.00.hp,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(17)),
                                      backgroundColor: Colors.white),
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          ifu != null
                                              ? ifu!.path.split('/').last
                                              : "Importer",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11.00.sp),
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles();
                                            setState(() {
                                              ifu = File(
                                                  result!.files.single.path!);
                                            });
                                          },
                                          icon: const Icon(
                                            IconData(0xe190,
                                                fontFamily: 'MaterialIcons'),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gap(30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pièces d'identité",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.00.sp,
                                ),
                              ),
                              SizedBox(
                                height: 1.00.hp,
                              ),
                              SizedBox(
                                width: 80.00.wp,
                                height: 7.00.hp,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(17)),
                                      backgroundColor: Colors.white),
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          identity != null
                                              ? identity!.path.split('/').last
                                              : "Importer",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11.00.sp),
                                        ),
                                        SizedBox(
                                          width: 7.00.wp,
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles();
                                            setState(() {
                                              identity = File(
                                                  result!.files.single.path!);
                                            });
                                          },
                                          icon: const Icon(
                                            IconData(
                                              0xe190,
                                              fontFamily: 'MaterialIcons',
                                            ),
                                            color: Colors.grey,
                                          ),
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
        ));
  }
}
