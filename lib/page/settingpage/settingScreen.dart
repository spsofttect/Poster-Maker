// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, non_constant_identifier_names, avoid_print, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poster_maker/Helper/app_theme.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/Helper/widget.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';
import 'package:poster_maker/page/bottomnavbar/bottomnavbar.dart';
import 'package:poster_maker/page/login/login.dart';

import 'package:poster_maker/page/settingpage/proView/proView.dart';

import 'developmentpage/Appdevelopmentpage.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    // DeviceOrientation
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // Do not capture Screenshot and video
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    // Do not capture Screenshot and video
    return Scaffold(
      // backgroundColor:
      //     Get.isDarkMode ? Color(AppColor.white) : Color(AppColor.bgcolor),
      body: SafeArea(
        child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              settingPageAppbar(
                context: context,
                ontap: () {
                  Get.offAll(BottomNavBarScreen());
                },
              ),
              Expanded(
                  child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  userDetail(),
                  optionBtn(text: 'My Business'),
                  optionBtn(text: 'Preferred Languages'),
                  optionBtn(
                      text: 'Night Mode',
                      item: Switch(
                        onChanged: (value) {
                          setState(() {
                            isdarkMode = value;
                            if (Get.isDarkMode)
                              Get.changeThemeMode(ThemeMode.light);
                            else
                              Get.changeThemeMode(ThemeMode.dark);

                            status = value;
                          });
                          // Get.isDarkMode
                          //     ? Get.changeTheme(ThemeData.light())
                          //     : Get.changeTheme(ThemeData.dark());
                          // isdarkMode.value = value;
                          // if (Get.isDarkMode) {
                          //   // setState(() {
                          //   // Get.changeTheme(ThemeData.light());
                          //   Get.changeThemeMode(ThemeMode.light);
                          //   // });
                          // } else {
                          //   // setState(() {
                          //   // Get.changeTheme(ThemeData.dark());
                          //   Get.changeThemeMode(ThemeMode.dark);
                          //   // });
                          // }
                        },
                        value: status,
                        activeColor: Color(AppColor.orange),
                        activeTrackColor: Color(AppColor.yellow).withOpacity(0.3),
                        inactiveThumbColor: Color(AppColor.orange),
                        inactiveTrackColor: Color(AppColor.yellow).withOpacity(0.3),
                      )),
                  optionBtn(text: 'Save Path'),
                  optionBtn(
                    text: 'Notification',
                    item: Switch(
                      onChanged: notificationSwitch,
                      value: isNotification,
                      activeColor: Color(AppColor.orange),
                      activeTrackColor: Color(AppColor.yellow).withOpacity(0.3),
                      inactiveThumbColor: Color(AppColor.orange),
                      inactiveTrackColor: Color(AppColor.yellow).withOpacity(0.3),
                    ),
                  ),
                  SizedBox(height: 20),
                  //Our Services
                  Box(
                      item: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title(title: 'Our Services'),
                      SizedBox(height: 10),
                      subTitle(
                          ontap: () {
                            Get.to(DevelopmentPage(), arguments: "App");
                          },
                          subTitle: 'App Development',
                          divider: Divider(thickness: 1, color: Color(AppColor.grey))),
                      subTitle(
                          ontap: () {
                            Get.to(DevelopmentPage(), arguments: "Website");
                          },
                          subTitle: 'Website Development',
                          divider: Divider(thickness: 1, color: Color(AppColor.grey))),
                      subTitle(
                          ontap: () {
                            Get.to(DevelopmentPage(), arguments: "Graphics");
                          },
                          subTitle: 'Graphics Design',
                          divider: SizedBox()),
                    ],
                  )),
                  // How to Use
                  Box(
                    item: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      title(title: 'How to Use'),
                      SizedBox(height: 10),
                      subTitle(subTitle: 'How to Use', divider: Divider(thickness: 1, color: Color(AppColor.grey))),
                      subTitle(subTitle: 'User Guide', divider: Divider(thickness: 1, color: Color(AppColor.grey))),
                      subTitle(subTitle: 'Tutorial', divider: Divider(thickness: 1, color: Color(AppColor.grey))),
                      subTitle(subTitle: 'Tutorial', divider: SizedBox()),
                    ]),
                  ),
                  Box(
                      item: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title(title: 'About Us'),
                      SizedBox(height: 10),
                      subTitle(subTitle: 'Share App', divider: Divider(thickness: 1, color: Color(AppColor.grey))),
                      subTitle(subTitle: 'Rate Us', divider: Divider(thickness: 1, color: Color(AppColor.grey))),
                      subTitle(subTitle: 'Contact Us', divider: Divider(thickness: 1, color: Color(AppColor.grey))),
                      subTitle(subTitle: 'Privacy Policy', divider: Divider(thickness: 1, color: Color(AppColor.grey))),
                      subTitle(subTitle: 'Trems and Services', divider: SizedBox()),
                    ],
                  )),
                  Box(
                      item: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title(title: 'Follow US'),
                      SizedBox(height: 10),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'change to win free ',
                            style: GoogleFonts.fredoka(
                                color: Color(AppColor.grey),
                                fontSize: 15,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: 'VIP',
                            style: GoogleFonts.fredoka(
                                color: Colors.red,
                                fontWeight: FontWeight.w400)),
                      ])),
                      SizedBox(height: 20),
                      socialMedia(
                          networkImage:
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Facebook_logo_%28square%29.png/800px-Facebook_logo_%28square%29.png',
                          subTitle: 'FaceBook',
                          divider: Divider(
                            thickness: 1,
                            color: Color(AppColor.grey),
                          )),
                      socialMedia(
                          networkImage: 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/2048px-Instagram_icon.png',
                          subTitle: 'Instagram',
                          divider: Divider(
                            thickness: 1,
                            color: Color(AppColor.grey),
                          )),
                      socialMedia(
                          networkImage:
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/LinkedIn_logo_initials.png/640px-LinkedIn_logo_initials.png',
                          subTitle: 'Linkdin',
                          divider: SizedBox()),
                    ],
                  )),
                  CommanWidget().nextButton(
                      onTap: () async {
                        await authClass.signOut();
                        Get.back();
                        Get.back();
                        currentpage = 0;
                        await Get.offAllNamed("/loginScreen");
                      },
                      height: 45,
                      radius: 10,
                      text: 'Sign Out',
                      margin: EdgeInsets.only(
                          left: 50, right: 50, top: 10, bottom: 20))
                ],
              ))
            ]),
      ),
    );
  }

  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>SocialMedia<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //

  Widget socialMedia({divider, networkImage, subTitle, ontap}) {
    return Container(
      margin: EdgeInsets.only(bottom: 4, top: 4),
      child: Column(
        children: [
          GestureDetector(
            onTap: ontap,
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(networkImage), fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(5),
                      color: Color(AppColor.grey)),
                ),
                SizedBox(width: 15),
                Text(
                  subTitle,
                  style: GoogleFonts.fredoka(
                      color: Color(AppColor.grey),
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          divider
        ],
      ),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>CommanBox<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //

  Widget Box({item}) {
    return Container(
        margin: EdgeInsets.only(top: 20, right: 25, left: 25, bottom: 25),
        padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 10),
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: Color(AppColor.grey), width: 1.5)),
        child: item);
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Title<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget title({title}) {
    return Text(
      title,
      style: GoogleFonts.fredoka(
          color: Color(AppColor.grey),
          fontWeight: FontWeight.w400,
          fontSize: 18),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>subTitle<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget subTitle({subTitle, ontap, divider}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            margin: EdgeInsets.only(top: 8, bottom: 8),
            child: Text(
              subTitle,
              style: GoogleFonts.fredoka(
                  color: Color(AppColor.grey),
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        divider
      ],
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> user Detail <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Row userDetail() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        margin: EdgeInsets.only(left: 30),
        height: 80,
        width: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color(AppColor.grey)),
      ),
      SizedBox(width: 20),
      Column(
        children: [
          Text(
            'User Name',
            style: GoogleFonts.fredoka(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Theme.of(context).textTheme.headline1!.color,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 35,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(AppColor.orange), Color(AppColor.yellow)])),
            child: Center(
                child: Text(
              'SUBSCRIBE PLAN',
              style: GoogleFonts.fredoka(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Color(AppColor.white)),
            )),
          ),
        ],
      ),
    ]);
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Options <<<<<<<<<<<<<<<<<<<<<<<<<<<< //

  bool isNotification = false;
  var textValue = 'Switch is OFF';

  void notificationSwitch(bool value) {
    if (isNotification == false) {
      setState(() {
        isNotification = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isNotification = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  Widget optionBtn({text, ontap, item}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(top: 20, right: 25, left: 25),
        padding: const EdgeInsets.only(left: 15, right: 15),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: Color(AppColor.grey), width: 1.5)),
        child: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Text(
                text,
                style: GoogleFonts.fredoka(
                    color: Color(AppColor.grey),
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
              Container(
                child: item,
              )
            ])),
      ),
    );
  }
}
