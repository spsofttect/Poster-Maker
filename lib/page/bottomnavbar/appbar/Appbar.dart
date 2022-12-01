// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, file_names

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poster_maker/Helper/app_theme.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/Helper/widget.dart';
import 'package:poster_maker/page/bottomnavbar/bottomnavbar.dart';
import 'package:poster_maker/page/bottomnavbar/homepage/addBusiness/addBuisness.dart';
import 'package:poster_maker/page/refer&earn/coin.dart';
import 'package:poster_maker/page/settingpage/proView/proView.dart';

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>AppBar<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
Widget homeAppbar({draweronTap,context}) => SizedBox(
      height: Get.height * 0.1,
      width: double.infinity,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                DottedBorder(
                    dashPattern: [10, 3, 3, 3],
                    strokeWidth: 2.5,
                    color: Color(AppColor.orange),
                    borderType: BorderType.Circle,
                    radius: Radius.circular(10),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                            image:
                                AssetImage('${AssetPath.homepage}profile.jpeg'),
                            fit: BoxFit.cover),
                      ),
                    )),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'User Name',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.headline1.color,
                        fontFamily: AppFont.Medium,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Add Your Business',
                      style:
                          TextStyle(fontFamily: AppFont.Regular, fontSize: 12,
                        color: Theme.of(context).textTheme.headline1.color,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    bottomsheet();
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                    height: 50,
                    width: 25,
                    // color: Colors.white10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          '${AssetPath.homepage}add.png',
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Get.to(CoinPageView());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 22,
                    child: Image.asset(
                      '${AssetPath.homepage}coin.png',
                    ),
                  ),
                  Text(
                    '200',
                    style: TextStyle(
                        fontFamily: AppFont.Regular,
                        fontSize: 10,
                        color: Color(0xFFF9B500)),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 25,
                child: Image.asset(
                  '${AssetPath.homepage}search.png',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(ProPage());
              },
              child: SizedBox(
                height: 28,
                child: Image.asset(
                  '${AssetPath.settingpage}pro.png',
                ),
              ),
            ),
            Bounce(
              duration: Duration(milliseconds: 200),
              onPressed: () {  },
              child: GestureDetector(
                onTap: draweronTap,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Image.asset(
                    '${AssetPath.homepage}menu.png',
                    height: 18,
                    color: Color(AppColor.yellow),
                  ),
                ),
              ),
            ),
          ]),
    );

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>BottomSheet<<<<<<<<<<<<<<<<<<<<<<<<<<< //
Future<dynamic> bottomsheet() {
  return Get.bottomSheet(Container(
    padding: EdgeInsets.all(15),
    height: 180,
    decoration: BoxDecoration(
        color:
            isdarkMode.value ? Color(AppColor.white) : Color(AppColor.bgcolor),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25), topLeft: Radius.circular(25))),
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Text(
            'Change Your Business',
            style: TextStyle(
                color: Color(AppColor.bgcolor),
                fontSize: 16,
                fontFamily: AppFont.Regular),
            textAlign: TextAlign.center,
          ),
          SizedBox(
              height: 25,
              width: 25,
              child: FloatingActionButton(
                onPressed: () {
                  Get.back();
                },
                backgroundColor: Color(AppColor.yellow),
                child: Icon(
                  Icons.close,
                  color: Color(AppColor.white),
                  size: 18,
                ),
              )),
        ],
      ),
      Container(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
        margin: EdgeInsets.only(left: 30, right: 30),
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 2, color: Color(AppColor.orange)),
            color: Color(AppColor.grey).withOpacity(0.3)),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(AppColor.bgcolor),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Your Business Name',
                    style:
                        TextStyle(fontSize: 10, color: Color(AppColor.orange))),
                Text('Edit',
                    style:
                        TextStyle(fontSize: 10, color: Color(AppColor.grey))),
              ],
            ),
            Spacer(),
            SizedBox(
                height: 20,
                width: 20,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Color(AppColor.yellow),
                  child: Icon(
                    Icons.check,
                    color: Color(AppColor.white),
                    size: 18,
                  ),
                )),
          ],
        ),
      ),
      CommanWidget().nextButton(
          margin: EdgeInsets.only(left: 30, right: 30),
          onTap: () {
            Get.back();
            Get.to(AddBusinessPage());
            // Get.to(CetegoryNameScreen());         SizedBox(width: 10),
          },
          radius: 10.0,
          text: 'Add New Business',
          height: 45,
          width: double.infinity)
    ]),
  ));
}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>settingPage<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //

Widget settingPageAppbar({context, ontap}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      GestureDetector(
        onTap: ontap,
        child: Container(
          margin: EdgeInsets.all(15),
          child: Image.asset(
            '${AssetPath.language}back.png',
            height: 25,
          ),
        ),
      ),
      SizedBox(
        width: 30,
      ),
      Text(
        'Setting',
        style: TextStyle(
          color: Theme.of(context).textTheme.headline1.color,
          fontFamily: AppFont.Medium,
          fontSize: 20,
        ),
      ),
      Spacer(),
      GestureDetector(
        onTap: () {
          Get.to(ProPage());
        },
        child: Container(
          margin: EdgeInsets.only(right: 15),
          child: Image.asset(
            '${AssetPath.settingpage}pro.png',
            height: 35,
          ),
        ),
      ),
    ],
  );
}
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>CommanAppBar<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //

Widget commanAppbar({String pageName, color, ontap,textColor}) => Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            margin: EdgeInsets.all(15),
            child: Image.asset(
              '${AssetPath.language}back.png',
              color: color,
              height: 25,
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          pageName,
          style:
              TextStyle(fontFamily: AppFont.Medium, fontSize: 20, color: textColor),
        ),
      ],
    );
