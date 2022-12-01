// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_import, file_names

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/commanlist/list.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/Helper/widget.dart';
import 'package:poster_maker/page/SplashScreen/splash.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';

class ProPage extends StatefulWidget {
  const ProPage({Key key}) : super(key: key);

  @override
  State<ProPage> createState() => _ProPageState();
}

class _ProPageState extends State<ProPage> {
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
      // backgroundColor:
      // Get.isDarkMode ? Color(AppColor.white) : Color(AppColor.bgcolor),
      body: SafeArea(
        child: Column(children: [
          commanAppbar(
              ontap: () {
                Get.back();
              },
              pageName: "Subscription Plan"),
          Expanded(
              child: ListView(
            children: [
              logo(
                  context: context,
                  height: 0.12,
                  width: 0.2,
                  size: Get.height * 0.018,
                  fontSize: 30.0),
              const SizedBox(height: 20),
              msg(msg: 'Unlock 2000+ Templates'),
              msg(msg: 'Unlock 2000+ Stickers'),
              msg(msg: 'Unlock Every Week'),
              msg(msg: 'Get access of all festival & days posters.'),
              const SizedBox(height: 20),
              templates(
                listindex: item2,
                itemCount: item2.length,
                boxfit: BoxFit.cover,
                height: 140,
                width: 140,
              ),
              Divider(
                thickness: 3,
                color: Color(AppColor.grey).withOpacity(0.5),
              ),
              const SizedBox(height: 10),
              Text(
                'Choose Your plan',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontFamily: AppFont.Medium),
              ),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                //per Month
                Container(
                    width: Get.width * 0.3,
                    decoration: BoxDecoration(
                        color: Color(AppColor.yellow),
                        borderRadius: BorderRadius.circular(10)),
                    child: GestureDetector(
                      onTap: () {
                        selectedIndex(0);
                      },
                      child: Container(
                        margin: EdgeInsets.all(3),
                        height: 150,
                        width: Get.width * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: currentIndex == 0
                                ? Color(AppColor.white)
                                : Colors.transparent,
                            border: Border.all(
                                color: Color(AppColor.white), width: 1.5)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(height: 10),
                              text(
                                  text: '3 Day Free',
                                  currentind: 0,
                                  fontFamily: AppFont.Bold,
                                  fontSize: 15.0),
                              text(
                                  text: 'Trial',
                                  currentind: 0,
                                  fontFamily: AppFont.Bold,
                                  fontSize: 15.0),
                              SizedBox(height: 10),
                              text(
                                  text: 'then ₹250.00/per',
                                  fontFamily: AppFont.Regular,
                                  fontSize: 11.0,
                                  currentind: 0),
                              text(
                                text: 'Mounth',
                                currentind: 0,
                                fontFamily: AppFont.Regular,
                                fontSize: 11.0,
                              ),
                              SizedBox(height: 10)
                            ]),
                      ),
                    )),
                // 3 Month
                Container(
                    width: Get.width * 0.3,
                    decoration: BoxDecoration(
                        color: Color(AppColor.yellow),
                        borderRadius: BorderRadius.circular(10)),
                    child: GestureDetector(
                      onTap: () {
                        selectedIndex(1);
                      },
                      child: Container(
                        margin: EdgeInsets.all(3),
                        height: 150,
                        width: Get.width * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: currentIndex == 1
                                ? Color(AppColor.white)
                                : Colors.transparent,
                            border: Border.all(
                                color: Color(AppColor.white), width: 1.5)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(height: 20),
                              text(
                                  text: 'Start Today',
                                  currentind: 1,
                                  fontSize: 16,
                                  fontFamily: AppFont.SemiBold),
                              text(
                                  text: '3 Month',
                                  currentind: 1,
                                  fontSize: 16,
                                  fontFamily: AppFont.SemiBold),
                              text(
                                  text: '₹ 750.00',
                                  currentind: 1,
                                  fontSize: 14,
                                  fontFamily: AppFont.SemiBold),
                              text(
                                  text: 'Per Month',
                                  currentind: 1,
                                  fontSize: 12,
                                  fontFamily: AppFont.Regular),
                              SizedBox(height: 10)
                            ]),
                      ),
                    )),
                //  life Time
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                          color: Color(AppColor.yellow),
                          borderRadius: BorderRadius.circular(10)),
                      child: GestureDetector(
                        onTap: () {
                          selectedIndex(2);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 3, left: 3, right: 3, bottom: 3),
                          height: 150,
                          width: Get.width * 0.25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: currentIndex == 2
                                  ? Color(AppColor.white)
                                  : Colors.transparent,
                              border: Border.all(
                                  color: Color(AppColor.white), width: 1.5)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(height: 20),
                                text(
                                    text: 'Start Today',
                                    currentind: 2,
                                    fontSize: 15,
                                    fontFamily: AppFont.SemiBold),
                                text(
                                    text: 'Forever',
                                    currentind: 2,
                                    fontSize: 16,
                                    fontFamily: AppFont.SemiBold),
                                text(
                                    text: '₹ 820.00',
                                    currentind: 2,
                                    fontSize: 12,
                                    fontFamily: AppFont.SemiBold),
                                text(
                                    text: '₹ 3000.00',
                                    currentind: 2,
                                    fontSize: 12,
                                    fontFamily: AppFont.SemiBold,
                                    decoration: TextDecoration.lineThrough),
                                SizedBox(height: 10)
                              ]),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -12,
                      child: Image.asset(
                        '${AssetPath.settingpage}hottest.png',
                        height: Get.height * 0.04,
                      ),
                    ),
                  ],
                  clipBehavior: Clip.none,
                ),
              ]),
              CommanWidget().nextButton(
                  height: 45,
                  margin: EdgeInsets.only(
                      left: 100, right: 100, top: 30, bottom: 30),
                  radius: 10,
                  text: 'Buy Now')
            ],
          ))
        ]),
      ),
    );
  }

  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Templates <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget templates(
      {double height, double width, itemCount, listindex, boxfit}) {
    return Container(
        margin: const EdgeInsets.only(top: 15, bottom: 20),
        height: height,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              var currentObj = listindex[index];
              return Container(
                margin: EdgeInsets.only(
                    left: index == 0 ? 15 : 5,
                    right: index == itemCount - 1 ? 15 : 5),
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(currentObj), fit: boxfit),
                          borderRadius: BorderRadius.circular(15),
                          color: Color(AppColor.grey)),
                      // child: Center(child: Text("$index")),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(AppColor.white)),
                        child: Center(
                            child: Text(
                          '2000 + Templates',
                          style: TextStyle(
                              color: Color(AppColor.bgcolor),
                              fontFamily: AppFont.Medium,
                              fontSize: 13),
                        )),
                      ),
                    )
                  ],
                ),
              );
            }));
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> msg <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget msg({msg}) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20),
      child: Row(
        children: [
          Container(
            height: 13,
            width: 13,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(AppColor.grey)),
          ),
          const SizedBox(width: 20),
          Text(
            msg,
            style: TextStyle(
                fontSize: 14,
                fontFamily: AppFont.Medium,
                color: Color(AppColor.grey)),
          )
        ],
      ),
    );
  }

  Widget text(
      {text, double fontSize, decoration, color, currentind, fontFamily}) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          decoration: decoration,
          color: currentIndex == currentind
              ? Color(AppColor.black)
              : Color(AppColor.white)),
      textAlign: TextAlign.center,
    );
  }
}
logo({context, fontSize, size, height, width}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * height,
        width: MediaQuery.of(context).size.width * width,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "PixeL",
            style: TextStyle(fontFamily: AppFont.Bold, fontSize: fontSize),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8, right: 1),
            child: Image.asset(
              '${AssetPath.splash}ux.png',
              height: size,
            ),
          ),
          Text(
            "ry",
            style: TextStyle(fontFamily: AppFont.Bold, fontSize: fontSize),
          ),
        ],
      )
    ],
  );
}
