// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_import, avoid_init_to_null, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poster_maker/Helper/commanwidget.dart';
import 'package:poster_maker/Helper/utlity.dart';

import 'package:poster_maker/page/editBottomNavBar/BackRound/backround.dart';
import 'package:poster_maker/page/editBottomNavBar/addImage/addImage.dart';

import 'dart:math' as math;

import 'package:poster_maker/page/editBottomNavBar/posterpage.dart';

class EditBottomNavBar extends StatefulWidget {
  const EditBottomNavBar({Key key}) : super(key: key);

  @override
  State<EditBottomNavBar> createState() => _EditBottomNavBarState();
}

class _EditBottomNavBarState extends State<EditBottomNavBar> {
  var currentIndex = null;

  selectedIndex(index) {
    setState(() {
      currentIndex = index;
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
            bottomNavigationBar: bottomnavbar(),
            body: ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: GlowingOverscrollIndicator(
                  axisDirection: AxisDirection.down,
                  color: Color(AppColor.orange),
                  child: ListView(
                    children: [
                      if (currentIndex == 0)
                        PosterPage()
                      else if (currentIndex == 1)
                        AddImagePage()
                      else if (currentIndex == 2)
                        BackRoundPage(),
                      SizedBox(height: 70),
                    ],
                  )),
            )));
  }

  bool selected = false;
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> addTextButton <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //

  Widget bottomnavbar() {
    return Container(
      height: Get.height * 0.08,
      decoration: BoxDecoration(
        color: Color(AppColor.bgcolor),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [
              Color(0xFFFA7F08),
              Color(0xFFF24405),
            ]),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
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
            currentIndex == currentInd
                ? Text(
                    iconName,
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: AppFont.Medium,
                      color: currentIndex == currentInd
                          ? Color(AppColor.white)
                          : Colors.transparent,
                    ),
                  )
                : const SizedBox(),
          ],
        ));
  }
}
