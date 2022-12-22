// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_import, avoid_init_to_null, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poster_maker/Helper/commanwidget.dart';
import 'package:poster_maker/Helper/utlity.dart';

import 'package:poster_maker/page/editBottomNavBar/BackRound/backround.dart';
import 'package:poster_maker/page/editBottomNavBar/addImage/addImage.dart';
import 'package:poster_maker/page/editBottomNavBar/addTextBottonNavBar.dart';

import 'dart:math' as math;

class EditBottomNavBar extends StatefulWidget {
  const EditBottomNavBar({Key key}) : super(key: key);

  @override
  State<EditBottomNavBar> createState() => _EditBottomNavBarState();
}

class _EditBottomNavBarState extends State<EditBottomNavBar> {
  var currentIndex = null;
  var textCurrentIndex = 0;

  selectedIndex(index) {
    setState(() {
      currentIndex = index;
      textCurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // DeviceOrientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
    ]);
    // Do not capture Screenshot and video
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    // Do not capture Screenshot and video
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          // For Android.
          // Use [light] for white status bar and [dark] for black status bar.
          statusBarIconBrightness: Brightness.light,
          // For iOS.
          // Use [dark] for white status bar and [light] for black status bar.
          statusBarBrightness: Brightness.light,
        ),
        child: Scaffold(
            // backgroundColor: Colors.white,
            // bottomNavigationBar:
            //     currentIndex == 0 ? addTextBottomnavbar() : bottomnavbar(),
            body: Stack(
          // physics: BouncingScrollPhysics(),
          children: [
            if (currentIndex == 0)
              Container(
                height: 500,width: 350,color: Colors.amber,
              )
            else if (currentIndex == 1)
              AddImagePage()
            else if (currentIndex == 2)
              BackRoundPage(),
            SizedBox(height: 70),
            Align(
              alignment: Alignment.bottomCenter,
              child: currentIndex == 0 ? Container() : bottomnavbar(),
            )
          ],
        )));
  }

  bool selected = false;
  addTextPage() {}
  controlPage() {}
  rotationPage() {}
  sizeViewPage() {}
  fontPage() {}
  colorPage() {}
  shadowPage() {}
  textWidthPage() {}
  textHegihtPage() {}
  splitHorizontalPage() {}
  splitverticolPage() {}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> addTextButton <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //

  Widget bottomnavbar() {
    return Container(
      height: currentIndex == 0 ? 0 : Get.height * 0.08,
      decoration: BoxDecoration(
        color: Color(AppColor.bgcolor),
 
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(AppColor.orange),
              Color(AppColor.yellow),
            ]),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        iconButton(
          currentInd: 0,
          iconImg: 'text.png',
          iconName: 'Add Text',
          selectedind: 0,
        ),
        iconButton(
          currentInd: 1,
          iconImg: 'image.png',
          iconName: 'Add Image',
          selectedind: 1,
        ),
        iconButton(
          currentInd: 2,
          iconImg: 'backround.png',
          iconName: 'Backround',
          selectedind: 2,
        ),
        iconButton(
          currentInd: 3,
          iconImg: 'shapes.png',
          iconName: 'Shapes',
          selectedind: 3,
        ),
        iconButton(
          currentInd: 4,
          iconImg: 'sticker.png',
          iconName: 'Sticker',
          selectedind: 4,
        ),
        iconButton(
          currentInd: 5,
          iconImg: 'QRcode.png',
          iconName: 'QR Code',
          selectedind: 5,
        ),
        iconButton(
          currentInd: 6,
          iconImg: 'graphic.png',
          iconName: 'Graphic',
          selectedind: 6,
        ),
      ]),
    );
  }

  Widget iconButton(
      {currentInd, selectedind, String iconImg, String iconName}) {
    return GestureDetector(
        onTap: () {
          selectedIndex(selectedind);
          setState(() {
            if (currentIndex == 0) {
              selected != selected;
              addTextBottomnavbar();
            }
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(currentIndex == currentInd ? 3 : 5),
              height: 30,
              width: 30,
              // color: Color(AppColor.grey),
              child: Image.asset(
                "${AssetPath.editBottomNavBar}$iconImg",
                color: Color(AppColor.white),
              ),
            ),
            Text(
              iconName,
              style: GoogleFonts.fredoka(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(AppColor.white)),
            )
            // : const SizedBox(),
          ],
        ));
  }

  addTextBottomnavbar() {
    Get.bottomSheet(
      Container(
        height: textCurrentIndex == 0
            ? Get.height * 0.08
            : textCurrentIndex != 0 && textCurrentIndex != 4
                ? Get.height * 0.15
                : Get.height * 0.08,
        // padding: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Color(AppColor.bgcolor),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(AppColor.orange),
                Color(AppColor.yellow),
              ]),
        ),
        child: SizedBox(
          child: Stack(
            children: [
              ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: decorationCategory.length,
                  itemBuilder: (context, index) {
                    var currentObj = decorationCategory[index];
                    return GestureDetector(
                        onTap: () {
                          selectedIndex(index);
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            left: index == 0 ? 15 : 5,
                            right: index == /*itemCount*/ decorationCategory
                                        .length -
                                    1
                                ? 15
                                : 0,
                            top: textCurrentIndex == 0
                                ? Get.height * 0.020
                                : textCurrentIndex != 0 && textCurrentIndex != 4
                                    ? Get.height * 0.030
                                    : Get.height * 0.020,
                            bottom: textCurrentIndex == 0
                                ? Get.height * 0.025
                                : textCurrentIndex != 0 && textCurrentIndex != 4
                                    ? Get.height * 0.085
                                    : Get.height * 0.025,
                          ),
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: textCurrentIndex == index
                                  ? Color(AppColor.orange).withOpacity(0.8)
                                  : Colors.transparent),
                          child: Center(
                              child: Text(
                            currentObj.name,
                            style: GoogleFonts.fredoka(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: textCurrentIndex == index
                                    ? Color(AppColor.white)
                                    : Color(AppColor.shadow)),
                          )),
                        ));
                  }),
              textCurrentIndex != 0 && textCurrentIndex != 4
                  ? Center(
                      child: Divider(
                        thickness: 3,
                        color: Colors.grey,
                      ),
                    )
                  : SizedBox(),
              textCurrentIndex == 1
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: Get.height * 0.08,
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
