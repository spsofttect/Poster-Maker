// ignore_for_file: prefer_const_constructors, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/Helper/widget.dart';
import 'package:poster_maker/page/bottomnavbar/homepage/addBusiness/addBuisness.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  var currentIndex = 0;

  selectedIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // DeviceOrientation
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // Do not capture Screenshot and video
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    // Do not capture Screenshot and video
    return Scaffold(
      // backgroundColor: Get.isDarkMode ? Colors.white : Color(AppColor.bgcolor),

      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              appbar(),
              SvgPicture.asset(
                '${AssetPath.language}translator.svg',
                height: Get.height * 0.3,
              ),
              Text(
                'Select Your preferred Language',
                style: TextStyle(fontSize: 16, fontFamily: AppFont.Regular
                    // color: Get.isDarkMode
                    //     ? Color(AppColor.grey)
                    //     : Color(AppColor.white),
                    ),
              ),
              Column(
                children: [
                  languageButton(
                      text: 'English',
                      color: currentIndex == 0
                          ? Color(AppColor.orange)
                          : Color(AppColor.grey),
                      onTap: () {
                        setState(() {
                          selectedIndex(0);
                        });
                      }),
                  languageButton(
                      text: 'हिंदी',
                      color: currentIndex == 1
                          ? Color(AppColor.orange)
                          : Color(AppColor.grey),
                      onTap: () {
                        setState(() {
                          selectedIndex(1);
                        });
                      }),
                  languageButton(
                      text: 'मराठी',
                      color: currentIndex == 2
                          ? Color(AppColor.orange)
                          : Color(AppColor.grey),
                      onTap: () {
                        setState(() {
                          selectedIndex(2);
                        });
                      }),
                  languageButton(
                      text: 'ગુજરાતી',
                      color: currentIndex == 3
                          ? Color(AppColor.orange)
                          : Color(AppColor.grey),
                      onTap: () {
                        setState(() {
                          selectedIndex(3);
                        });
                      }),
                ],
              ),
              CommanWidget().nextButton(
                onTap: () {
                  Get.toNamed('/bottomNavBar');
                },
                text: 'Continue',
                height: Get.height * 0.06,
                radius: 10,
                margin: EdgeInsets.all(10),
                width: Get.height * 0.4,
              )
            ]),
      ),
    );
  }

  Widget languageButton({text, onTap, color}) {
    return GestureDetector(
        onTap: onTap,
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            height: Get.height * 0.06,
            width: Get.height * 0.4,
            decoration: BoxDecoration(
                color: Color(AppColor.white).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1.5, color: color)),
            child: Center(
                child: Text(
              text,
              style: TextStyle(color: color, fontFamily: AppFont.Medium),
            )),
          ),
        ));
  }

  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>AppBar<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  appbar() {
    return Row(
      children: [
        // GestureDetector(
        //   onTap: () {
        //     Get.back();
        //   },
        //   child: Container(
        //     margin: EdgeInsets.all(15),
        //     child: Image.asset(
        //       '${AssetPath.language}back.png',
        //       height: 25,
        //     ),
        //   ),
        // ),
        SizedBox(
          width: 15,
        ),
        Text(
          'Preferred Language',
          style: TextStyle(fontFamily: AppFont.Medium, fontSize: 20),
        ),
      ],
    );
  }
}
