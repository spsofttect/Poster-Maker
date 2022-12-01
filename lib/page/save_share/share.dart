// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class SharePage extends StatefulWidget {
  const SharePage({Key key}) : super(key: key);

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            commanAppbar(
                pageName: "Save & Share",
                ontap: () {
                  Get.back();
                }),
            sharePost(
              height: Get.height * 0.45,
              width: Get.width * 0.6,
              borderColor: Color(AppColor.grey),
            ),
            text(
                text: "E:/Application/poster_banner_Logo/xd",
                fontsize: Get.height * 0.02),
            bottomContainer(),
          ],
        ),
      ),
    );
  }

  Widget sharePost({height, width, borderColor}) {
    return Screenshot(
      controller: screenshotController,
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 15),
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  Widget text({text, fontsize, color}) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontsize, fontFamily: AppFont.Medium, color: color),
    );
  }

  Widget bottomContainer() {
    return Container(
      height: Get.height * 0.37,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: text(
              text: "Save to Camara Roll",
              fontsize: Get.height * 0.022,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              borderContainer(
                  height: Get.height * 0.005, width: Get.width * 0.35),
              text(text: "Share", fontsize: Get.height * 0.02),
              borderContainer(
                  height: Get.height * 0.005, width: Get.width * 0.35),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              sociallmages(imageName: "whatsapp.png"),
              sociallmages(imageName: "instagram.png"),
              sociallmages(imageName: "facebook.png"),
              sociallmages(imageName: "twitter.png"),
              sociallmages(
                  imageName: "share.png",
                  ontap: () async {
                    await screenshotController
                        .capture(delay: Duration(milliseconds: 10))
                        .then((Uint8List image) async {
                           final directory =
                          await getApplicationDocumentsDirectory();
                      final imagePath =
                          await File('${directory.path}/image.png').create();
                      await imagePath.writeAsBytes(image);

                      /// Share Plugin
                      await Share.shareFiles([imagePath.path]);
                        });
                   
                  }),
            ],
          ),
          borderContainer(height: Get.height * 0.005, width: Get.width),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              btm(name: "Continue Edit", color: Color(AppColor.grey)),
              btm(name: "Finish", color: Color(AppColor.orange)),
            ],
          ),
        ],
      ),
    );
  }

  Widget sociallmages({imageName, ontap}) => Bounce(
        duration: const Duration(milliseconds: 200),
        onPressed: ontap,
        child: Image.asset(AssetPath.custom + imageName,
            color: Color(AppColor.grey), height: Get.height * 0.04),
      );

  Widget borderContainer({height, width}) {
    return Container(
      height: height,
      width: width,
      color: Color(AppColor.grey).withOpacity(0.3),
    );
  }

  Widget btm({color, name, ontap}) {
    return Bounce(
      duration: const Duration(milliseconds: 200),
      onPressed: ontap,
      child: Container(
        height: Get.height * 0.06,
        width: Get.width * 0.4,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: text(text: name, color: Color(AppColor.white)),
      ),
    );
  }
}
