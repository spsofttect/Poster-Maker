// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/Helper/widget.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';
import 'package:poster_maker/page/bottomnavbar/bottomnavbar.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            commanAppbar(
                ontap: () {
                  Get.offAll(BottomNavBarScreen());
                },
                pageName: "Help & Feedback"),
            Image.asset(
              "${AssetPath.settingpage}feedback.png",
              height: Get.height * 0.35,
            ),
            textfield(
                hintText: 'Enter your Email-ID*',
                height: 45,
                keyboardtype: TextInputType.emailAddress),
            textfield(
                hintText: 'Enter your Mobile*',
                height: 45,
                keyboardtype: TextInputType.number),
            textfield(
                hintText: 'Enter your Text',
                height: 120,
                keyboardtype: TextInputType.text),
            CommanWidget().nextButton(
                text: 'Send',
                radius: 10.0,
                height: 45,
                width: Get.width,
                margin: const EdgeInsets.only(
                    top: 15, bottom: 15, left: 50, right: 50))
          ],
        ),
      ),
    );
  }

  Widget textfield(
      {String hintText, double height, TextInputType keyboardtype}) {
    return Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(AppColor.grey).withOpacity(0.5),
        ),
        child: TextField(
          keyboardType: keyboardtype,
          maxLines: (height == 120) ? 6 : 1,
          cursorColor: Color(AppColor.orange),
          style: TextStyle(
              // color:
              // Get.isDarkMode ? Color(AppColor.grey) : Color(AppColor.white),
              fontSize: 15,
              fontFamily: AppFont.SemiBold),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 15, fontFamily: AppFont.SemiBold),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(AppColor.orange), width: 1.5),
            ),
          ),
        ));
  }
}
