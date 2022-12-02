// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, file_names, prefer_final_fields, unused_import, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'dart:ffi';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/app_theme.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';

import 'frame_01TOframe_05.dart';



class SelecteFrames extends StatefulWidget {
  const SelecteFrames({
    Key key,
    // this.pickerColor,
    this.onColorChanged,
  }) : super(key: key);
  // final Color pickerColor;
  final ValueChanged<Color> onColorChanged;

  @override
  State<SelecteFrames> createState() => _SelecteFramesState();
}

class _SelecteFramesState extends State<SelecteFrames> {
  var currentIndex = 0;

  Color pickerColor = Color(0xFFffffff);
  // final ValueChanged<Color> onColorChanged;
  selectedIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var hW = Get.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          commanAppbar(
              pageName: 'Framepage',
              ontap: () {
                Get.back();
              }),
          Container(
            height: hW,
            width: hW,
            decoration: BoxDecoration(
                color: Colors.white10,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images.news18.com/ibnlive/uploads/2022/07/happy-sawan-2022-images-and-wishes-2.jpg'),
                    fit: BoxFit.cover)),
            // ? Frame_02()
            // : currentIndex == 2
            //     ? Frame_03()
            //     : currentIndex == 3
            //         ? Frame_04()
            //         : currentIndex == 4
            //             ? Frame_05()
            //             : currentIndex == 5
            //                 ? Frame_06(hW)
            //                 : currentIndex == 6
            //                     ? Frame_07()
            //                     : currentIndex == 7
            //                         ? Frame_08(hW)
            //                         : currentIndex == 8
            //                             ? Frame_09()
            //                             : Frame_10()
          ),
          SizedBox(height: Get.height * 0.02),
          Expanded(
              child: ListView(
                   physics: BouncingScrollPhysics(),
            children: [
              logoAndColorBTN(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  frameBTN(),
                ],
              ),
              frameListView()
            ],
          ))
        ]),
      ),
    );
  }

  Widget frameListView() {
    return SizedBox(
      height: Get.height * 0.1,
      width: double.infinity,
      child: ListView.builder(
           physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: Frame.length,
        itemBuilder: ((context, index) {
          var currentObj = Frame[index];
          return Bounce(
            duration: Duration(microseconds: 200),
            onPressed: () {
              selectedIndex(index);
            },
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: index == 0 ? 15 : 5,
                      right: index == Frame.length - 1 ? 15 : 5),
                  width: Get.height * 0.1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.news18.com/ibnlive/uploads/2022/07/happy-sawan-2022-images-and-wishes-2.jpg')),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: index == 0 ? 15 : 5,
                      right: index == Frame.length - 1 ? 15 : 5),
                  width: Get.height * 0.1,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(currentObj)),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2,
                          color: currentIndex == index
                              ? Color(AppColor.orange)
                              : Color(AppColor.grey))),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget frameBTN() {
    return Container(
        margin:
            EdgeInsets.only(top: Get.height * 0.02, bottom: Get.height * 0.02),
        height: 25,
        width: Get.width * 0.16,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 1, color: Color(AppColor.yellow))),
        child: Center(
          child: Text(
            'Email',
            style: TextStyle(fontFamily: AppFont.SemiBold),
          ),
        ));
  }

  Widget logoAndColorBTN(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Bounce(
          duration: Duration(milliseconds: 200),
          onPressed: () {},
          child: Column(
            children: [
              Icon(
                Icons.bubble_chart_sharp,
                size: Get.height * 0.050,
              ),
              SizedBox(height: Get.height * 0.005),
              Text(
                "Logo",
                style: TextStyle(
                    fontFamily: AppFont.Regular, fontSize: Get.height * 0.02),
              )
            ],
          ),
        ),
        SizedBox(
          width: Get.width * 0.1,
        ),
        Bounce(
          duration: Duration(milliseconds: 200),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  titlePadding: const EdgeInsets.all(0),
                  contentPadding: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? const BorderRadius.vertical(
                            top: Radius.circular(500),
                            bottom: Radius.circular(100),
                          )
                        : const BorderRadius.horizontal(
                            right: Radius.circular(500)),
                  ),
                  content: SingleChildScrollView(
                    child: HueRingPicker(
                      pickerColor: pickerColor,
                      onColorChanged: (val) {
                        setState(() {
                          pickerColor = val;
                        });
                      },
                      enableAlpha: true,
                      displayThumbColor: true,
                    ),
                  ),
                );
              },
            );
            print(widget.onColorChanged);
          },
          child: Column(
            children: [
              Icon(
                Icons.format_color_text_sharp,
                size: Get.height * 0.045,
              ),
              SizedBox(height: Get.height * 0.01),
              Text(
                "Text Color",
                style: TextStyle(
                    fontFamily: AppFont.Regular, fontSize: Get.height * 0.02),
              )
            ],
          ),
        ),
      ],
    );
  }






//Frame_06
  Widget Frame_06(double hW) {
    return DottedBorder(
        dashPattern: [10, 3, 3, 3],
        strokeWidth: 3,
        color: Color(AppColor.black),
        borderType: BorderType.RRect,
        child: Container(
            height: hW,
            width: hW,
            decoration: BoxDecoration(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(left: 20, top: 20),
                        height: Get.height * 0.04,
                        width: Get.height * 0.04,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('${AssetPath.splash}logo.png'))),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 20, top: 20),
                        child: text(
                            text: 'Milan Vaghasiya',
                            fontSize: Get.height * 0.015)),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: Get.width * 0.025,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                icon(
                                    icon: Icons.tablet_mac_sharp,
                                    color: Color(AppColor.white)),
                                SizedBox(width: 3),
                                text(
                                    text: '8866090904',
                                    fontSize: Get.height * 0.013)
                              ],
                            ),
                            SizedBox(height: Get.height * 0.007),
                            Row(
                              children: [
                                icon(
                                    icon: Icons.email_outlined,
                                    color: Color(AppColor.white)),
                                SizedBox(width: 3),
                                text(
                                    text: 'gd546954@gmail.com',
                                    fontSize: Get.height * 0.013)
                              ],
                            ),
                            SizedBox(height: Get.height * 0.007),
                            Row(
                              children: [
                                icon(
                                    icon: Icons.blur_circular,
                                    color: Color(AppColor.white)),
                                SizedBox(width: 3),
                                text(
                                    text: 'website@gmail.com',
                                    fontSize: Get.height * 0.013)
                              ],
                            ),
                            SizedBox(height: Get.height * 0.007),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                icon(
                                    icon: Icons.pin_drop_sharp,
                                    color: Colors.white),
                                SizedBox(width: 3),
                                text(
                                    text:
                                        '3 Bhramaniya para Santkabir Road rajkot',
                                    fontSize: Get.height * 0.015),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.007),
                          ]),
                    ),
                  ],
                ),
              ],
            )));
  }

//Frame_07
  Widget Frame_07() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              height: Get.height * 0.04,
              width: Get.height * 0.04,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('${AssetPath.splash}logo.png'))),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
              margin: EdgeInsets.only(right: 20, top: 20),
              child:
                  text(text: 'Milan Vaghasiya', fontSize: Get.height * 0.015)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: Get.height * 0.025,
                width: double.infinity,
                color: Color(0xFF333231),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          icon(
                              icon: Icons.email_outlined,
                              color: Color(AppColor.white)),
                          SizedBox(width: 3),
                          text(
                              text: 'gd546954@gmail.com',
                              fontSize: Get.height * 0.013)
                        ],
                      ),
                      Row(
                        children: [
                          icon(
                              icon: Icons.tablet_mac_sharp,
                              color: Color(AppColor.white)),
                          SizedBox(width: 3),
                          text(text: '8866090904', fontSize: Get.height * 0.013)
                        ],
                      ),
                      Row(
                        children: [
                          icon(
                              icon: Icons.blur_circular,
                              color: Color(AppColor.white)),
                          SizedBox(width: 3),
                          text(
                              text: 'website@gmail.com',
                              fontSize: Get.height * 0.013)
                        ],
                      ),
                    ]),
              ),
              Container(
                height: 2,
                width: double.infinity,
                color: Color(0xFFffffff),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: Get.height * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('${AssetPath.frame}f17_img.png'),
                        fit: BoxFit.fill)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon(icon: Icons.pin_drop_sharp, color: Colors.black),
                    SizedBox(width: 3),
                    text(
                      text: '3 Bhramaniya para Santkabir Road rajkot',
                      fontSize: Get.height * 0.015,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

//Frame_08
  Widget Frame_08(double hW) {
    return Stack(children: [
      Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            height: Get.height * 0.04,
            width: Get.height * 0.04,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('${AssetPath.splash}logo.png'))),
          ),
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Container(
            margin: EdgeInsets.only(right: 20, top: 20),
            child: text(text: 'Milan Vaghasiya', fontSize: Get.height * 0.015)),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              height: Get.height * 0.03,
              width: Get.width * 0.33,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 41, 40, 40),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Get.height * 0.02),
                      topLeft: Radius.circular(Get.height * 0.02))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon(
                      icon: Icons.email_outlined, color: Color(AppColor.white)),
                  SizedBox(width: 3),
                  text(text: 'gd546954@gmail.com', fontSize: Get.height * 0.013)
                ],
              ),
            ),
            Container(
              height: Get.height * 0.03,
              width: Get.width * 0.26,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 41, 40, 40),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Get.height * 0.02),
                      topLeft: Radius.circular(Get.height * 0.02))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon(
                      icon: Icons.tablet_mac_sharp,
                      color: Color(AppColor.white)),
                  SizedBox(width: 3),
                  text(text: '8866090904', fontSize: Get.height * 0.013)
                ],
              ),
            ),
            Container(
              height: Get.height * 0.03,
              width: Get.width * 0.33,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 41, 40, 40),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Get.height * 0.02),
                      topLeft: Radius.circular(Get.height * 0.02))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon(icon: Icons.blur_circular, color: Color(AppColor.white)),
                  SizedBox(width: 3),
                  text(text: 'website@gmail.com', fontSize: Get.height * 0.013)
                ],
              ),
            ),
          ]),
          Container(
            height: Get.height * 0.03,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(AppColor.orange),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Get.height * 0.02),
                    topLeft: Radius.circular(Get.height * 0.02))),
          )
        ]),
      )
    ]);
  }

//Frame_09
  Widget Frame_09() {
    return Stack(
      children: [],
    );
  }

//Frame_10
  Widget Frame_10() {
    return Stack(
      children: [],
    );
  }

// Text
  text({
    String text,
    double fontSize,
    textAlign,
  }) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: pickerColor),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }

  icon({icon, color}) {
    return Icon(
      icon,
      size: Get.width * 0.030,
      color: color,
    );
  }
}

List Frame = [
  '${AssetPath.frame}f11.png',
  '${AssetPath.frame}f2.png',
  '${AssetPath.frame}f13.png',
  '${AssetPath.frame}f14.png',
  '${AssetPath.frame}f15.png',
  '${AssetPath.frame}f16.png',
  '${AssetPath.frame}f17.png',
  '${AssetPath.frame}f18.png',
  '${AssetPath.frame}f19.png',
  '${AssetPath.frame}f20.png',
];
List<Widget> FramePage = [
  Frame_01(),
  Frame_02(),
  Frame_03(),
  Frame_04(),
  Frame_05(),
  // Frame_06(),
  // Frame_07(),
  // Frame_08(),
  // Frame_09(),
  // Frame_10(),
  // Frame_11(),
  // Frame_12(),
  // Frame_13(),
  // Frame_14(),
  // Frame_15(),
  // Frame_16(),
  // Frame_17(),
  // Frame_18(),
  // Frame_19(),
  // Frame_20(),
];
