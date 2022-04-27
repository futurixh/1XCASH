import 'dart:convert';
import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_seo/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_seo/sizeconf.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:flutter_web_seo/services/api/api.service.dart';
import 'package:flutter_web_seo/services/api/auth/auth.dart';

import '../locator.dart';
import '../../../constants.dart';
import '../models/user.model.dart';

final apiService = locator<ApiService>();

class Header extends StatefulWidget {
  final String pageName;

  Header({
    Key? key,
    required this.pageName,
  }) : super(key: key);


  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  static const storage = FlutterSecureStorage();
  User? currentUser;

  Future getCurrentUser() async {
    await storage.read(key: 'user').
    then((value) {
      if (mounted) {
        setState(() {
          currentUser = User.fromJson(json.decode(value!));
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        if (!Responsive.isMobile(context))
          Text(
            widget.pageName,
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: SearchField()),
        ProfileCard(currentUser: currentUser,)
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  final User? currentUser;
  const ProfileCard({
    Key? key, this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: defaultPadding),
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding / 2,
        ),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white10),
        ),
        child: DropdownButtonHideUnderline(
            child: DropdownButton2(
          dropdownWidth: 180,
          dropdownDecoration:
              BoxDecoration(borderRadius: BorderRadius.circular(4)),
          customButton: Row(
            children: [
              SvgPicture.asset(
                "icons/profile-user.svg",
                color: Colors.white,
                height: 20,
              ),
              if (!Responsive.isMobile(context))
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 2),
                  child: Text("${currentUser?.firstname} ${currentUser?.lastname}"),
                ),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
          buttonHeight: 30,
          offset: Offset(-16, -13),
          onChanged: (value) {},
          icon: Visibility(visible: false, child: Icon(Icons.arrow_downward)),
          items: typeItems,
        )));
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}

List<DropdownMenuItem<String>> typeItems = [
  DropdownMenuItem(
      child: Row(
        children: [
          Icon(Icons.logout),
          SizedBox(
            width: 0.5.wp,
          ),
          Text("Deconnexion"),
        ],
      ),
      value: "debit",
      onTap: () async {
        const storage = FlutterSecureStorage();
        try {
          await apiService.logout().then(
                (value) => log(value!,),
          );
          QR.to('/login');
        } catch (e) {
          print(e.toString());
        }
      }),
];
