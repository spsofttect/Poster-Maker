// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/page/Digital%20Posts/DigitalPost.dart';

import 'package:poster_maker/page/bottomnavbar/bottomnavbar.dart';
import 'package:poster_maker/page/help%20&%20feedback/feedback.dart';

import 'package:poster_maker/page/notification/notification.dart';
import 'package:poster_maker/page/settingpage/settingScreen.dart';

import '../save_share/share.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  var isVisibale = false.obs;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
            image: '${AssetPath.create}business.png', name: 'My Businesses'),
        drawarItem(image: '${AssetPath.create}project.png', name: 'My Project'),
        drawarItem(
            ontap: () {
              Get.to(SettingPage());
            },
            image: '${AssetPath.create}setting.png',
            name: 'Setting'),
        drawarItem(image: '${AssetPath.create}tutor.png', name: 'Tutor'),
        drawarItem(
            image: '${AssetPath.create}suggest.png', name: 'Suggest a Feature'),
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
        drawarItem(image: '${AssetPath.create}rate.png', name: 'Rate us'),
        drawarItem(
            image: '${AssetPath.create}share.png',
            name: 'Share App',
            ontap: () {
              Get.to(SharePage());
            }),
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
                color: Color(AppColor.grey).withOpacity(0.15),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  height: 27,
                ),
                SizedBox(width: 30),
                Text(
                  name,
                  style: TextStyle(
                      fontFamily: AppFont.Medium, fontSize: Get.height * 0.02,color: Color(AppColor.white)),
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
          style: TextStyle(
              fontFamily: AppFont.Bold,
              fontSize: Get.height * 0.03,
              color: Color(AppColor.orange)),
        )
      ],
    );
  }
}
