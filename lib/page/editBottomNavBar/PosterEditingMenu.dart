// ignore_for_file: file_names, avoid_init_to_null, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/page/editBottomNavBar/addTextBottonNavBar.dart';

class PosterEditingMenu extends StatefulWidget {
  const PosterEditingMenu({Key? key}) : super(key: key);

  @override
  State<PosterEditingMenu> createState() => _PosterEditingMenuState();
}

class _PosterEditingMenuState extends State<PosterEditingMenu> {
  var bottomIndex = null;
  var textCurrentIndex = null;
  bool selected = false;

  selectedIndex(index) {
    setState(() {
      bottomIndex = index;
    });
  }

  selectedTextIndex(index) {
    setState(() {
      textCurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Image.asset(
                      '${AssetPath.language}back.png',
                      height: 25,
                    ),
                  ),
                ),
                SizedBox(width: Get.width * 0.01),
                Text(
                  "Poster Name",
                  style: GoogleFonts.fredoka(
                      fontWeight: FontWeight.w500, fontSize: 15),
                ),
                const Spacer(),
                Bounce(
                    duration: const Duration(milliseconds: 300),
                    onPressed: () {},
                    child: Image.asset("${AssetPath.appbar}layer.png",
                        height: Get.width * 0.07)),
                SizedBox(width: Get.width * 0.01),
                Bounce(
                    duration: const Duration(milliseconds: 300),
                    onPressed: () {},
                    child: Image.asset("${AssetPath.appbar}lock.png",
                        height: Get.width * 0.07)),
                SizedBox(width: Get.width * 0.01),
                Bounce(
                    duration: const Duration(milliseconds: 300),
                    onPressed: () {},
                    child: Image.asset("${AssetPath.appbar}undo.png",
                        height: Get.width * 0.07)),
                SizedBox(width: Get.width * 0.01),
                Bounce(
                    duration: const Duration(milliseconds: 300),
                    onPressed: () {},
                    child: Image.asset("${AssetPath.appbar}redo.png",
                        height: Get.width * 0.07)),
                SizedBox(width: Get.width * 0.01),
                Bounce(
                    duration: const Duration(milliseconds: 300),
                    onPressed: () {},
                    child: Image.asset("${AssetPath.appbar}copy.png",
                        height: Get.width * 0.07)),
                SizedBox(width: Get.width * 0.01),
                Bounce(
                    duration: const Duration(milliseconds: 300),
                    onPressed: () {},
                    child: Image.asset("${AssetPath.appbar}refres.png",
                        height: Get.width * 0.07)),
                SizedBox(width: Get.width * 0.01),
                Bounce(
                    duration: const Duration(milliseconds: 300),
                    onPressed: () {},
                    child: Image.asset("${AssetPath.appbar}save.png",
                        height: Get.width * 0.07)),
                SizedBox(width: Get.width * 0.01),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: Get.height * 0.68,
              width: Get.width * 0.9,
              color: const Color.fromARGB(255, 245, 219, 140),
            ),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomnavbar()),
          if (bottomIndex == 1)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: textCurrentIndex != 0 && textCurrentIndex != null
                    ? Get.height * 0.12
                    : Get.height * 0.08,
                decoration: BoxDecoration(
                  color: Color(AppColor.white),
                  borderRadius: BorderRadius.only(
                    topLeft: textCurrentIndex != 0 && textCurrentIndex != null
                        ? const Radius.circular(2)
                        : const Radius.circular(15),
                    topRight: textCurrentIndex != 0 && textCurrentIndex != null
                        ? const Radius.circular(2)
                        : const Radius.circular(15),
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(AppColor.orange),
                        Color(AppColor.yellow),
                      ]),
                ),
                child: Column(
                  mainAxisAlignment:
                      textCurrentIndex == 0 || textCurrentIndex == null
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      height: Get.height * 0.05,
                      width: double.infinity,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              selectedTextIndex(null);
                              selectedIndex(null);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 10, right: 5),
                              height: Get.width * 0.065,
                              width: Get.width * 0.065,
                              decoration: BoxDecoration(
                                  color: Color(AppColor.white).withOpacity(0.8),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              child: Icon(
                                Icons.close,
                                size: Get.width * 0.05,
                                color: Color(AppColor.orange),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: decorationCategory.length,
                                itemBuilder: (context, index) {
                                  var currentObj = decorationCategory[index];
                                  return GestureDetector(
                                      onTap: () {
                                        selectedTextIndex(index);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          // left: index == 0 ? 15 : 5,
                                          right: index ==
                                                  decorationCategory.length - 1
                                              ? 15
                                              : 0,
                                        ),
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: textCurrentIndex == index
                                                ? Color(AppColor.white)
                                                    .withOpacity(0.8)
                                                : Colors.transparent),
                                        child: Center(
                                            child: Text(
                                          currentObj.name!,
                                          style: GoogleFonts.fredoka(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: textCurrentIndex == index
                                                  ? Color(AppColor.orange)
                                                  : Color(AppColor.white)
                                                      .withOpacity(0.8)),
                                        )),
                                      ));
                                }),
                          ),
                        ],
                      ),
                    ),
                    textCurrentIndex != 0 && textCurrentIndex != null
                        ? Container(
                            height: Get.height * 0.005,
                            width: double.infinity,
                            color: Color(AppColor.white).withOpacity(0.8),
                          )
                        : const SizedBox(),
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
                  ],
                ),
              ),
            )
          // else if (bottomIndex == 2)
          //   const AddImagePage()
        ],
      ),
    );
  }

  double _value = 360;
  addTextPage() {
    return Container();
  }

  controlPage() {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.008),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Bounce(
            duration: const Duration(milliseconds: 500),
            onPressed: () {},
            child: GestureDetector(
              onLongPress: () {},
              child: Container(
                height: Get.width * 0.09,
                width: Get.width * 0.09,
                decoration: BoxDecoration(
                    color: Color(AppColor.white).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(Get.width * 0.05)),
                child: Icon(Icons.keyboard_arrow_left_rounded,
                    color: Color(AppColor.orange)),
              ),
            ),
          ),
          Bounce(
            duration: const Duration(milliseconds: 500),
            onPressed: () {},
            child: GestureDetector(
              onLongPress: () {},
              child: Container(
                height: Get.width * 0.09,
                width: Get.width * 0.09,
                decoration: BoxDecoration(
                    color: Color(AppColor.white).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(Get.width * 0.05)),
                child: Icon(Icons.keyboard_arrow_up_rounded,
                    color: Color(AppColor.orange)),
              ),
            ),
          ),
          Bounce(
            duration: const Duration(milliseconds: 500),
            onPressed: () {},
            child: GestureDetector(
              onLongPress: () {},
              child: Container(
                height: Get.width * 0.09,
                width: Get.width * 0.09,
                decoration: BoxDecoration(
                    color: Color(AppColor.white).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(Get.width * 0.05)),
                child: Icon(Icons.keyboard_arrow_down_rounded,
                    color: Color(AppColor.orange)),
              ),
            ),
          ),
          Bounce(
            duration: const Duration(milliseconds: 500),
            onPressed: () {
              print('ontap');
            },
            child: GestureDetector(
              onLongPress: () {
                print("onLongPress");
              },
              child: Container(
                height: Get.width * 0.09,
                width: Get.width * 0.09,
                decoration: BoxDecoration(
                    color: Color(AppColor.white).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(Get.width * 0.05)),
                child: Icon(Icons.keyboard_arrow_right_rounded,
                    color: Color(AppColor.orange)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  rotationPage() {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.008),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: Get.height * 0.045,
            width: Get.height * 0.045,
            decoration: BoxDecoration(
                color: Color(AppColor.white).withOpacity(0.8),
                borderRadius: BorderRadius.circular(Get.width * 0.05)),
            child:
                Icon(Icons.rotate_left_rounded, color: Color(AppColor.orange)),
          ),
          SizedBox(
            height: Get.height * 0.045,
            width: Get.width * 0.7,
            child: Slider(
              min: 0.0,
              max: 360.0,
              activeColor: Color(AppColor.white).withOpacity(0.8),
              inactiveColor: Color(AppColor.white).withOpacity(0.5),
              thumbColor: Color(AppColor.white),
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
            ),
          ),
          Container(
            height: Get.height * 0.045,
            width: Get.height * 0.045,
            decoration: BoxDecoration(
                color: Color(AppColor.white).withOpacity(0.8),
                borderRadius: BorderRadius.circular(Get.width * 0.05)),
            child:
                Icon(Icons.rotate_right_rounded, color: Color(AppColor.orange)),
          ),
        ],
      ),
    );
  }

  sizeViewPage() {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.008),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: Get.height * 0.045,
            width: Get.height * 0.045,
            decoration: BoxDecoration(
                color: Color(AppColor.white).withOpacity(0.8),
                borderRadius: BorderRadius.circular(Get.width * 0.05)),
            child: Center(
              child: Text(
                '+1',
                style: GoogleFonts.fredoka(
                    color: Color(AppColor.orange),
                    fontWeight: FontWeight.w500,
                    fontSize: Get.height * 0.025),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.045,
            width: Get.width * 0.7,
            child: Slider(
              min: 0.0,
              max: 360.0,
              activeColor: Color(AppColor.white).withOpacity(0.8),
              inactiveColor: Color(AppColor.white).withOpacity(0.5),
              thumbColor: Color(AppColor.white),
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
            ),
          ),
          Container(
            height: Get.height * 0.045,
            width: Get.height * 0.045,
            decoration: BoxDecoration(
                color: Color(AppColor.white).withOpacity(0.8),
                borderRadius: BorderRadius.circular(Get.width * 0.05)),
            child: Center(
              child: Text(
                '-1',
                style: GoogleFonts.fredoka(
                    color: Color(AppColor.orange),
                    fontWeight: FontWeight.w500,
                    fontSize: Get.height * 0.025),
              ),
            ),
          ),
        ],
      ),
    );
  }

  fontPage() {
    return Container();
  }

  colorPage() {
    return Container();
  }

  shadowPage() {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.008),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: Get.height * 0.045,
          width: Get.height * 0.045,
          padding: EdgeInsets.all(Get.width * 0.01),
          decoration: BoxDecoration(
              color: Color(AppColor.white).withOpacity(0.8),
              borderRadius: BorderRadius.circular(Get.width * 0.05)),
          child: Center(
              child: Image.asset("${AssetPath.appbar}shadow.png",
                  color: Color(AppColor.orange))),
        ),
        SizedBox(
          height: Get.height * 0.045,
          width: Get.width * 0.7,
          child: Slider(
            min: 0.0,
            max: 360.0,
            activeColor: Color(AppColor.white).withOpacity(0.8),
            inactiveColor: Color(AppColor.white).withOpacity(0.5),
            thumbColor: Color(AppColor.white),
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ),
      ]),
    );
  }

  textWidthPage() {
    return Padding(
       padding: EdgeInsets.only(top: Get.height * 0.008),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            height: Get.height * 0.045,
            width: Get.height * 0.045,
            padding: EdgeInsets.all(Get.width * 0.01),
            decoration: BoxDecoration(
                color: Color(AppColor.white).withOpacity(0.8),
                borderRadius: BorderRadius.circular(Get.width * 0.05)),
            child: Image.asset("${AssetPath.appbar}textwidth.png",
                color: Color(AppColor.orange))),
        SizedBox(
          height: Get.height * 0.045,
          width: Get.width * 0.7,
          child: Slider(
            min: 0.0,
            max: 360.0,
            activeColor: Color(AppColor.white).withOpacity(0.8),
            inactiveColor: Color(AppColor.white).withOpacity(0.5),
            thumbColor: Color(AppColor.white),
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ),
      ]),
    );
  }

  textHegihtPage() {
    return Padding(
    padding: EdgeInsets.only(top: Get.height * 0.008),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            height: Get.height * 0.045,
            width: Get.height * 0.045,
            padding: EdgeInsets.all(Get.width * 0.01),
            decoration: BoxDecoration(
                color: Color(AppColor.white).withOpacity(0.8),
                borderRadius: BorderRadius.circular(Get.width * 0.05)),
            child: Image.asset("${AssetPath.appbar}textHeight.png",
                color: Color(AppColor.orange))),
        SizedBox(
          height: Get.height * 0.045,
          width: Get.width * 0.7,
          child: Slider(
            min: 0.0,
            max: 360.0,
            activeColor: Color(AppColor.white).withOpacity(0.8),
            inactiveColor: Color(AppColor.white).withOpacity(0.5),
            thumbColor: Color(AppColor.white),
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ),
      ]),
    );
  }

  splitHorizontalPage() {
    return Padding(
   padding: EdgeInsets.only(top: Get.height * 0.008),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            height: Get.height * 0.045,
            width: Get.height * 0.045,
            decoration: BoxDecoration(
                color: Color(AppColor.white).withOpacity(0.8),
                borderRadius: BorderRadius.circular(Get.width * 0.05)),
            child: Icon(
              Icons.border_horizontal_rounded,
              color: Color(AppColor.orange),
            )),
        SizedBox(
          height: Get.height * 0.045,
          width: Get.width * 0.7,
          child: Slider(
            min: 0.0,
            max: 360.0,
            activeColor: Color(AppColor.white).withOpacity(0.8),
            inactiveColor: Color(AppColor.white).withOpacity(0.5),
            thumbColor: Color(AppColor.white),
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ),
      ]),
    );
  }

  splitverticolPage() {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.008),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            height: Get.height * 0.045,
            width: Get.height * 0.045,
            decoration: BoxDecoration(
                color: Color(AppColor.white).withOpacity(0.8),
                borderRadius: BorderRadius.circular(Get.width * 0.05)),
            child: Icon(
              Icons.border_vertical_rounded,
              color: Color(AppColor.orange),
            )),
        SizedBox(
          height: Get.height * 0.045,
          width: Get.width * 0.7,
          child: Slider(
            min: 0.0,
            max: 360.0,
            activeColor: Color(AppColor.white).withOpacity(0.8),
            inactiveColor: Color(AppColor.white).withOpacity(0.5),
            thumbColor: Color(AppColor.white),
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ),
      ]),
    );
  }

  Widget iconButton(
      {currentInd, selectedind, String ?iconImg, String ?iconName}) {
    return GestureDetector(
        onTap: () {
          selectedIndex(selectedind);
          setState(() {
            if (bottomIndex == 0) {
              selected != selected;
            }
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(bottomIndex == currentInd ? 2 : 5),
              height: 30,
              width: 30,
              // color: Color(AppColor.grey),
              child: Image.asset(
                "${AssetPath.editBottomNavBar}$iconImg",
                color: Color(AppColor.white),
              ),
            ),
            Text(
              iconName! ,
              style: GoogleFonts.fredoka(
                  fontSize: bottomIndex == currentInd ? 12 : 10,
                  fontWeight: bottomIndex == currentInd
                      ? FontWeight.w500
                      : FontWeight.w400,
                  color: Color(AppColor.white)),
            )
            // : const SizedBox(),
          ],
        ));
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> addTextButton <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget bottomnavbar() {
    return Container(
      height: bottomIndex == 0 ? 0 : Get.height * 0.085,
      decoration: BoxDecoration(
        color: Color(AppColor.bgcolor),
        borderRadius: const BorderRadius.only(
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
          currentInd: 1,
          iconImg: 'text.png',
          iconName: 'Add Text',
          selectedind: 1,
        ),
        iconButton(
          currentInd: 2,
          iconImg: 'image.png',
          iconName: 'Add Image',
          selectedind: 2,
        ),
        iconButton(
          currentInd: 3,
          iconImg: 'backround.png',
          iconName: 'Backround',
          selectedind: 3,
        ),
        iconButton(
          currentInd: 4,
          iconImg: 'shapes.png',
          iconName: 'Shapes',
          selectedind: 4,
        ),
        iconButton(
          currentInd: 5,
          iconImg: 'sticker.png',
          iconName: 'Sticker',
          selectedind: 5,
        ),
        iconButton(
          currentInd: 6,
          iconImg: 'graphic.png',
          iconName: 'Graphic',
          selectedind: 6,
        ),
        // iconButton(
        //   currentInd: 0,
        //   iconImg: 'QRcode.png',
        //   iconName: 'QR Code',
        //   selectedind: 0,
        // ),
      ]),
    );
  }
}
