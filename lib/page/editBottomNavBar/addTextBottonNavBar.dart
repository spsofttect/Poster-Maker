// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poster_maker/Helper/utlity.dart';

class AddTextBottonNavBarView extends StatefulWidget {
  const AddTextBottonNavBarView({Key? key}) : super(key: key);

  @override
  State<AddTextBottonNavBarView> createState() =>
      _AddTextBottonNavBarViewState();
}

class _AddTextBottonNavBarViewState extends State<AddTextBottonNavBarView> {
  var textCurrentIndex = 0;

  selectedIndex(index) {
    setState(() {
      textCurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // DeviceOrientation
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // Do not capture Screenshot and video
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    // Do not capture Screenshot and video
    return Stack(
      children: [
        ListView(children: [
          if (textCurrentIndex == 0)
            addTextPage()
          else if (textCurrentIndex == 1)
            controlPage()
          else if (textCurrentIndex == 2)
            rotationPage()
          else if (textCurrentIndex == 3)
            sizeViewPage()
          else if (textCurrentIndex == 4)
            fontPage()
          else if (textCurrentIndex == 5)
            colorPage()
          else if (textCurrentIndex == 6)
            shadowPage()
          else if (textCurrentIndex == 7)
            textWidthPage()
          else if (textCurrentIndex == 8)
            textHegihtPage()
          else if (textCurrentIndex == 9)
            splitHorizontalPage()
          else if (textCurrentIndex == 10)
            splitverticolPage()
        ]),
        Align(alignment: Alignment.bottomCenter, child: addTextBottomnavbar()),
      ],
    );
  }

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
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> addTextBottonNavBar <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget addTextBottomnavbar() {
    return Container(
      height: textCurrentIndex == 0
          ? Get.height * 0.08
          : textCurrentIndex != 0 && textCurrentIndex != 4
              ? Get.height * 0.15
              : Get.height * 0.08,
      // padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(AppColor.orange),
              Color(AppColor.yellow),
            ]),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
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
                                ? Color(AppColor.bgcolor).withOpacity(0.8)
                                : Colors.transparent),
                        child: Center(
                            child: Text(
                          currentObj.name!,
                          style: GoogleFonts.fredoka(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: textCurrentIndex == index
                                  ? Color(AppColor.white)
                                  : Color(AppColor.white)),
                        )),
                      ));
                }),
            textCurrentIndex != 0 && textCurrentIndex != 4
                ? Center(
                    child: Divider(
                      thickness: 3,
                      color: Colors.white,
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
    );
  }
}

class DecorationCategory {
  String? name;
  int? id;
  DecorationCategory({this.name, this.id});
}

List<DecorationCategory> decorationCategory = [
  DecorationCategory(id: 0, name: 'Add Text'),
  DecorationCategory(id: 1, name: 'Control'),
  DecorationCategory(id: 2, name: 'Rotation'),
  DecorationCategory(id: 3, name: 'Size'),
  DecorationCategory(id: 4, name: 'Font'),
  DecorationCategory(id: 5, name: 'Color'),
  DecorationCategory(id: 6, name: 'Shadow'),
  DecorationCategory(id: 7, name: 'Text Width'),
  DecorationCategory(id: 8, name: 'Text Hegiht'),
  DecorationCategory(id: 9, name: 'Split-Horizontal'),
  DecorationCategory(id: 10, name: 'Split-verticol'),
];
