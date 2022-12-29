// ignore_for_file: prefer_const_constructors, unused_import, avoid_print

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/page/Digital%20Posts/DigitalPost.dart';

import 'package:poster_maker/page/bottomnavbar/bottomnavbar.dart';
import 'package:poster_maker/page/help%20&%20feedback/feedback.dart';

import 'package:poster_maker/page/notification/notification.dart';
import 'package:poster_maker/page/settingpage/settingScreen.dart';
import 'package:share_plus/share_plus.dart';

import '../myBusiness/myBusiness.dart';
import '../save_share/share.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key?key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  var isVisibale = false.obs;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        appbar(),
        drawerItems(),
      ],
    );
  }

  Widget drawerItems() {
    return Column(
      children: [
        drawarItem(
            image: '${AssetPath.create}myEarning.png',
            name: 'Digital Posts',
            ontap: () {
              Get.to(DigitalPost());
            }),
        // drawarItem(
        //     image: '${AssetPath.create}myEarning.png', name: 'My Earnings'),
        drawarItem(
            ontap: () {
              Get.to(NotificationPageView());
            },
            image: '${AssetPath.create}notification.png',
            name: 'Notification'),
        drawarItem(
            image: '${AssetPath.create}business.png',
            name: 'My Businesses',
            ontap: () {
              Get.to(MyBusinessPage());
            }),
        drawarItem(
          image: '${AssetPath.create}project.png',
          name: 'My Project',
        ),
        drawarItem(
            ontap: () {
              Get.to(SettingPage());
            },
            image: '${AssetPath.create}setting.png',
            name: 'Setting'),

        drawarItem(image: '${AssetPath.create}tutor.png', name: 'Tutor'),
        drawarItem(
            image: '${AssetPath.create}suggest.png', name: 'Suggest a Feature'),
        drawarItem(
            name: '------------------------------------------------------'),
        drawarItem(image: '${AssetPath.create}about.png', name: 'About us'),
        drawarItem(image: '${AssetPath.create}contact.png', name: 'Contact us'),
        drawarItem(
            image: '${AssetPath.create}help.png',
            name: 'Help & Feedback',
            ontap: () {
              Get.to(FeedbackView());
            }),
        drawarItem(
            image: '${AssetPath.create}policy.png', name: 'Privacy Policy'),
        drawarItem(image: '${AssetPath.create}follow.png', name: 'Follow us'),
        drawarItem(
            name: '------------------------------------------------------'),
        drawarItem(
            image: '${AssetPath.create}rate.png',
            name: 'Rate us',
            ontap: () async {
              final InAppReview inAppReview = InAppReview.instance;
              print(
                  "-------------------------${await inAppReview.isAvailable()}-----------------------------------");
              if (await inAppReview.isAvailable()) {
                inAppReview.requestReview();
              }
              // Initialize the In App Review Plugin.
//               InAppReview.init();
//
// //Launch the Review Flow.
//               InAppReview.launch();
            }),
        drawarItem(
            image: '${AssetPath.create}share.png',
            name: 'Share App',
            ontap: () {
              Share.share(
                  'https://play.google.com/store/apps/details?id=com.spsofttech.digitalposter');
            }),
        Container(
          margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [Color(0xFFFA7F08), Color(0xFFF24405)]),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            "Log Out",
            style:
                GoogleFonts.fredoka(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
      ],
    );
  }

  Widget drawarItem({image, name, ontap}) {
    return GestureDetector(
        onTap: ontap,
        child: Container(
          margin: EdgeInsets.only(left: 20),
          child: Container(
            padding: EdgeInsets.only(left: 10),
            height: 40,
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
                color: (image == null)
                    ? Color(AppColor.grey).withOpacity(0)
                    : Color(AppColor.grey).withOpacity(0.15),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                (image == null)
                    ? const SizedBox()
                    : Image.asset(
                        image,
                        height: 27,
                      ),
                (image == null) ? const SizedBox() : SizedBox(width: 30),
                (image == null)
                    ? Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            name,
                            style: GoogleFonts.fredoka(
                              fontWeight: FontWeight.w500,
                              fontSize: Get.height * 0.02,
                              color: Color(AppColor.orange),
                              letterSpacing: 4,
                            ),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                          ),
                        ),
                      )
                    : Text(
                        name,
                        style: GoogleFonts.fredoka(
                          fontWeight: FontWeight.w500,
                          fontSize: Get.height * 0.02,
                          color: Color(AppColor.white),
                        ),
                      )
              ],
            ),
          ),
        ));
  }

  Widget appbar() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.offAllNamed("/bottomNavBar");
          },
          child: Container(
              margin: EdgeInsets.all(15),
              child: RotationTransition(
                  turns: AlwaysStoppedAnimation(180 / 360),
                  child: Image.asset(
                    '${AssetPath.language}back.png',
                    height: 30,
                  ))),
        ),
        SizedBox(width: 20),
        Text(
          "Menu",
          style: GoogleFonts.fredoka(
              fontWeight: FontWeight.w600,
              fontSize: Get.height * 0.03,
              color: Color(AppColor.orange)),
        )
      ],
    );
  }
}
