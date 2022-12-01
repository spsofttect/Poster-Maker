// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/Helper/widget.dart';

class AddBusinessPage extends StatelessWidget {
  AddBusinessPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            appbar(widget: SizedBox()),
            CommanWidget().profileImagePicker(
                sizedBoxWidth: 130,
                sizedBoxHeight: 130,
                imageheigth: 140,
                imagewidth: 140,
                imageRadius: 75,
                iconheigth: 40,
                iconwidth: 40,
                iconRadius: 20),
            textfield(hintText: 'Enter Your Business Name'),
            textfield(hintText: 'Enter Your Business Mobaile Number 1'),
            textfield(hintText: 'Mobaile Number 1 (optional)'),
            textfield(hintText: 'Enter Your Business Email'),
            textfield(hintText: 'Enter Your Business Website'),
            textfield(hintText: 'Enter Your Business Address'),
            CommanWidget().nextButton(
                margin:
                    EdgeInsets.only(left: 50, right: 50, top: 25, bottom: 25),
                radius: 10,
                height: 50,
                width: double.infinity,
                text: 'Submit',
                onTap: () {
                  Get.to(BusinessList());
                }),
          ],
        ),
      ),
    ));
  }

  Widget textfield({String hintText}) {
    return Container(
        margin: EdgeInsets.only(left: 30, right: 30, top: 25),
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(AppColor.grey).withOpacity(0.5),
        ),
        child: TextField(
          cursorColor: Color(AppColor.orange),
          style: TextStyle(
              // color:
              // Get.isDarkMode ? Color(AppColor.grey) : Color(AppColor.white),
              fontSize: 15,
              fontFamily: AppFont.SemiBold),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
                // color: Get.isDarkMode
                // ? Color(AppColor.grey)
                // : Color(AppColor.white),
                fontSize: 15,
                fontFamily: AppFont.SemiBold),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(AppColor.orange), width: 1.5),
            ),
          ),
        ));
  }
}

////////////////////////////////////////<<<<<<<<<<BusinessList>>>>>>>>>>//////////////////////////////////////
class BusinessList extends StatelessWidget {
  const BusinessList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(AppColor.bgcolor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            appbar(
              widget: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15),
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: const [
                            Color(0xFFFA7F08),
                            Color(0xFFF24405)
                          ])),
                  child: Icon(
                    Icons.add,
                    color: Color(AppColor.black),
                    size: 20,
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 20, left: 20),
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(AppColor.orange), width: 2),
                    borderRadius: BorderRadius.circular(15),
                    color: Color(AppColor.grey)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CommanWidget().profileImagePicker(
                        sizedBoxHeight: 70,
                        sizedBoxWidth: 70,
                        imageheigth: 60,
                        imagewidth: 60,
                        imageRadius: 30,
                        iconRadius: 15,
                        iconheigth: 25,
                        iconwidth: 25),
                    Text(
                      'Enter Your Business Name',
                      style: TextStyle(
                          // color: Get.isDarkMode
                          //     ? Color(AppColor.grey)
                          //     : Color(AppColor.white),
                          fontFamily: AppFont.Medium,
                          fontSize: 15),
                    ),
                    Icon(
                      Icons.more_vert,
                      size: 40,
                      // color: Get.isDarkMode
                      //     ? Color(AppColor.grey)
                      //     : Color(AppColor.white),
                    )
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>AppBar<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
appbar({widget}) {
  return
      // ignore: prefer_const_literals_to_create_immutables
      Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          margin: EdgeInsets.all(15),
          child: Image.asset(
            '${AssetPath.language}back.png',
            height: 25,
          ),
        ),
      ),
      SizedBox(
        width: 50,
      ),
      Text(
        'Add Business',
        style: TextStyle(fontFamily: AppFont.Medium, fontSize: 20),
      ),
      Spacer(),
      widget
    ],
  );
}
