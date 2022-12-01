// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, must_be_immutable, file_names

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/commanwidget.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';
import 'package:poster_maker/page/bottomnavbar/bottomnavbar.dart';

class Refer_EarnPage extends StatelessWidget {
  Refer_EarnPage({Key key}) : super(key: key);
  TextEditingController field = TextEditingController();
  var fabIcon = false.obs;
  @override
  Widget build(BuildContext context) {
    // DeviceOrientation
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    // Do not capture Screenshot and video
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          commanAppbar(
              pageName: "Refer & Earn",
              ontap: () {
                Get.offAll(BottomNavBarScreen());
              }),
          Expanded(
              child: ScrollConfiguration(
                  behavior: ScrollBehavior(),
                  child: GlowingOverscrollIndicator(
                      axisDirection: AxisDirection.down,
                      color: Color(AppColor.orange),
                      child: ListView(
                        physics: AlwaysScrollableScrollPhysics(),
                        children: [
                          pageTitle(),
                          howItWork(),
                          inviteFriend(),
                          Obx(() => GestureDetector(
                                onTap: () {
                                  fabIcon.value = !fabIcon.value;
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    fabIcon.value == false
                                        ? fastDownArrow()
                                        : fastUpArrow(),
                                    SizedBox(width: 10),
                                    text(
                                        text: 'Invite Friend',
                                        fontSize: 18,
                                        color: Color(AppColor.orange),
                                        fontFamily: AppFont.SemiBold),
                                  ],
                                ),
                              )),
                          Obx(() => Visibility(
                                visible: fabIcon.value,
                                child: Container(
                                  height: Get.height * 0.6,
                                  width: Get.width,
                                  margin: EdgeInsets.only(
                                      left: 15, right: 15, top: 20),
                                  child: Expanded(
                                    child: ListView.builder(
                                        itemCount: 100,
                                        itemBuilder: (_, i) {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: DottedBorder(
                                                dashPattern: [10, 3, 2, 3],
                                                strokeWidth: 2,
                                                color: Color(AppColor.yellow),
                                                borderType: BorderType.RRect,
                                                radius: Radius.circular(10),
                                                padding: EdgeInsets.all(5),
                                                child: SizedBox(
                                                  height: 60,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 20),
                                                        height: 50,
                                                        width: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          25)),
                                                          color: Color(
                                                              AppColor.grey),
                                                        ),
                                                      ),
                                                      SizedBox(width: 20),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          text(
                                                              text: 'User Name',
                                                              fontFamily:
                                                                  AppFont
                                                                      .SemiBold,
                                                              fontSize: 20),
                                                          text(
                                                              text:
                                                                  'Enter User Email Id',
                                                              fontFamily:
                                                                  AppFont
                                                                      .SemiBold,
                                                              fontSize: 12),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          );
                                        }),
                                  ),
                                ),
                              )),
                          SizedBox(height: 40)
                        ],
                      ))))
        ]),
      ),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> inviteFriend <<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget inviteFriend() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: RotationTransition(
              turns: AlwaysStoppedAnimation(90 / 360),
              child: dottedContainer(
                  margin: EdgeInsets.only(
                    bottom: 55,
                    right: 100,
                  ),
                  padding: EdgeInsets.only(bottom: 10),
                  height: 325.0,
                  width: 6.0,
                  itemCount: 25,
                  // color: Colors.red.withOpacity(0.2),
                  containtheight: 15)),
        ),
        SizedBox(
          height: Get.height * 0.25,
          width: Get.width * 0.25,
          child: Image.asset(
            '${AssetPath.refer}decoration1.png',
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.only(top: 200),
            height: Get.height * 0.22,
            width: Get.width * 0.3,
            child: Image.asset(
              '${AssetPath.refer}decoration2.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 300),
          height: Get.height * 0.2,
          width: Get.width * 0.27,
          child: Image.asset(
            '${AssetPath.refer}decoration3.png',
            fit: BoxFit.fill,
          ),
        ),
        Column(
          children: [
            // copy & invite
            Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: 'CODE2022'));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 45,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(AppColor.orange)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          text(
                            text: 'CODE2022',
                            color: Color(AppColor.white),
                            fontFamily: AppFont.Medium,
                          ),
                          VerticalDivider(
                              endIndent: 10,
                              indent: 10,
                              thickness: 2,
                              color: Color(AppColor.white)),
                          Image.asset('${AssetPath.refer}copy.png',
                              height: 20, color: Color(AppColor.white))
                        ]),
                  ),
                ),
                DottedBorder(
                  dashPattern: [10, 3, 2, 3],
                  strokeWidth: 2,
                  color: Color(AppColor.yellow),
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  padding: EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      height: 35,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color(AppColor.orange),
                      ),
                      child: Center(
                        child: text(
                            text: 'INVITE YOUR FRIEND',
                            color: Color(AppColor.white),
                            fontSize: 12,
                            fontFamily: AppFont.Medium),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15)
              ],
            ),
            // msg
            Container(
              margin:
                  EdgeInsets.only(top: 20, right: 15, left: Get.width * 0.18),
              height: Get.height * 0.08,
              width: 290,
              child: Center(
                child: text(
                    color: Color(0xFFF9B500),
                    textAlign: TextAlign.center,
                    fontFamily: AppFont.Medium,
                    fontSize: Get.height * 0.018,
                    text:
                        'Invite Your Friends To Join Poster Maker And Get Instant 10 Coin For Each Friend That Joins Using Your Referral Code.'),
              ),
            ),
            // zik
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15, top: 30),
                child: Image.asset(
                  "${AssetPath.refer}zik.png",
                  height: 22,
                ),
              ),
            ),
            ListTile(
              title: text(
                  text: 'Total Reword',
                  fontFamily: AppFont.Bold,
                  fontSize: Get.height * 0.04,
                  color: Color(AppColor.grey).withOpacity(0.5)),
              subtitle: text(
                  text: 'Every 1 Coins Value Equal To 1 Rs.',
                  fontFamily: AppFont.SemiBold,
                  fontSize: Get.height * 0.02,
                  color: Color(AppColor.grey).withOpacity(0.5)),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 35,
              width: 150,
              decoration: BoxDecoration(
                  color: Color(AppColor.white),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1.5, color: Colors.pink)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      '${AssetPath.refer}coin.png',
                      height: 20,
                      color: Colors.pink,
                    ),
                    text(
                        text: '100 Coin',
                        color: Colors.pink,
                        fontSize: 15,
                        fontFamily: AppFont.SemiBold)
                  ]),
            ),
            SizedBox(height: 5),
            text(
                text: 'Total Reword Point',
                color: Color(AppColor.grey).withOpacity(0.5),
                fontSize: Get.height * 0.02,
                fontFamily: AppFont.SemiBold),
            SizedBox(height: 30),
            DottedBorder(
              dashPattern: [10, 3, 2, 3],
              strokeWidth: 2,
              color: Color(AppColor.yellow),
              borderType: BorderType.RRect,
              radius: Radius.circular(10),
              padding: EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  height: 35,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(AppColor.orange),
                  ),
                  child: Center(
                    child: text(
                        text: 'Get Free Coins',
                        color: Color(AppColor.white),
                        fontSize: 12,
                        fontFamily: AppFont.Medium),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        )
      ],
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> howItWork <<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget howItWork() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 15, left: 15),
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        children: [
          Stack(
            children: [
              dottedContainer(
                  padding: EdgeInsets.only(top: 22.0, bottom: 22.0),
                  margin: EdgeInsets.only(left: 50.0, top: 50.0),
                  height: 250.0,
                  width: 5.0,
                  itemCount: 18,
                  containtheight: 10.0),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // tmainitle
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 2, color: Color(AppColor.orange))),
                          child: Center(
                              child: Text('i',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: AppFont.freeh,
                                      color: Color(AppColor.orange)))),
                        ),
                        text(
                          text: 'How It Works',
                          fontFamily: AppFont.Bold,
                          fontSize: Get.height * 0.03,
                        ),
                      ],
                    ),
                    rowContain(
                        ind: '1',
                        work: 'Invite Your Friends Just Share Your Link'),
                    const SizedBox(height: 33),
                    rowContain(
                        ind: '2', work: 'They Hit The Road With Coin 10 Off'),
                    const SizedBox(height: 33),
                    rowContain(
                        ind: '3',
                        work: 'You Make Savings! Then You Get Coin 10 Off'),
                  ])
            ],
          ),
          Spacer(),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              '${AssetPath.refer}refer.png',
              color: Colors.grey.shade500,
              height: 300,
              width: 100,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  Widget rowContain({String work, String ind}) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 28, top: 20),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(AppColor.orange)),
          child: Center(
            child: Text(ind,
                style: TextStyle(
                    fontFamily: AppFont.Bold,
                    fontSize: Get.height * 0.03,
                    color: Color(AppColor.white))),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 10, top: 22),
            height: 35,
            width: Get.width * 0.43,
            child: text(
                text: work,
                fontFamily: AppFont.Medium,
                fontSize: Get.height * 0.018,
                maxLines: 2))
      ],
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> dottedContainer <<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget dottedContainer(
      {padding,
      margin,
      width,
      height,
      double containtheight,
      itemCount,
      color}) {
    return Container(
      // padding: const EdgeInsets.only(top: 22, bottom: 22),
      // margin: const EdgeInsets.only(left: 50, top: 50),
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      color: color,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, i) {
          return Container(
            height: containtheight,
            decoration: BoxDecoration(
                color: Color(AppColor.yellow),
                borderRadius: BorderRadius.circular(5)),
          );
        },
        itemCount: itemCount,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 6);
        },
      ),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> pageTitle <<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget pageTitle() {
    return ListTile(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            text(
              text: 'Refer A Friend',
              fontFamily: AppFont.Bold,
              fontSize: Get.height * 0.042,
            ),
            Spacer(),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(right: 15, bottom: 10),
                child: Image.asset(
                  '${AssetPath.refer}dots.png',
                  height: Get.height * 0.08,
                ),
              ),
            ),
          ],
        ),
        subtitle: text(
            text: 'You And Your Friend Both Will Get 10 Coins.',
            fontFamily: AppFont.Medium,
            fontSize: Get.height * 0.02));
  }

  Widget text(
      {String text, double fontSize, fontFamily, textAlign, maxLines, color}) {
    return Text(
      text,
      style:
          TextStyle(fontFamily: fontFamily, fontSize: fontSize, color: color),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
