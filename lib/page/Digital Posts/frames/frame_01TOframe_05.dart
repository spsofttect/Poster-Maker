// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/commanwidget.dart';
import 'package:poster_maker/Helper/utlity.dart';

class Frame_01 extends StatelessWidget {
  const Frame_01({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(left: 20, top: 20),
              height: Get.height * 0.04,
              width: Get.height * 0.04,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('${AssetPath.splash}logo.png'))),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 20, top: 20),
              child:
                  text(text: 'Milan Vaghasiya', fontSize: Get.height * 0.015)),
        ],
      ),
      const Spacer(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: Get.height * 0.015),
            height: Get.height * 0.03,
            width: Get.width * 0.3,
            color: const Color(0xFF176939),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email_outlined,
                    size: Get.width * 0.025,
                  ),
                  SizedBox(width: Get.width * 0.005),
                  SizedBox(
                    width: Get.width * 0.2,
                    child: Text(
                      'gd546954@gmail.com',
                      style: TextStyle(
                          // fontFamily: AppFont.Regular,
                          fontSize: Get.width * 0.02),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ]),
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(bottom: Get.height * 0.015),
            padding: EdgeInsets.only(top: Get.height * 0.006),
            height: Get.height * 0.06,
            width: Get.width * 0.38,
            decoration: BoxDecoration(
                // color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("${AssetPath.frame}f11_center.png"),
                    fit: BoxFit.fill)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.tablet_mac_sharp,
                  size: Get.width * 0.020,
                ),
                SizedBox(width: Get.width * 0.005),
                Text(
                  '8866091904',
                  style: TextStyle(
                      // fontFamily: AppFont.Regular,
                      fontSize: Get.width * 0.02),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: Get.height * 0.015),
            height: Get.height * 0.03,
            width: Get.width * 0.3,
            color: const Color(0xFF176939),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: Get.width * 0.2,
                  child: Text(
                    '8866091904',
                    style: TextStyle(
                        // fontFamily: AppFont.Regular,
                        fontSize: Get.width * 0.02),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(width: Get.width * 0.005),
                Icon(
                  Icons.blur_circular,
                  size: Get.width * 0.020,
                ),
              ],
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Icon(Icons.pin_drop_outlined, size: Get.height * 0.02),
          const SizedBox(width: 5),
          Text(
            '3 Bhramaniya para Santkabir Road rajkot',
            style: TextStyle(fontSize: Get.height * 0.013),
          )
        ],
      )
    ]);
  }
}



class Frame_02 extends StatelessWidget {
  const Frame_02({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                    height: Get.height * 0.02,
                    width: Get.width * 0.35,
                    margin: EdgeInsets.only(top: 20),
                    child: text(
                        text: 'Milan Vaghasiya', fontSize: Get.height * 0.015)),
                Container(
                  height: Get.height * 0.02,
                  width: Get.width * 0.35,
                  decoration: BoxDecoration(
                      color: Color(0xFFF1592A),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(30))),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(right: 20, top: 20),
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('${AssetPath.splash}logo.png'))),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.height * 0.08,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: Get.height * 0.08,
                    width: Get.width * 0.35,
                    decoration: BoxDecoration(
                        color: Color(0xFFF1592A),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(35),
                        )),
                    child:
                        text(text: 'Contact me', fontSize: Get.height * 0.015),
                  ),
                  Container(
                    height: Get.height * 0.08,
                    width: Get.width * 0.35,
                    decoration: BoxDecoration(
                        color: Color(0xFFF1592A),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                        )),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    padding: EdgeInsets.only(top: Get.height * 0.005),
                    height: Get.height * 0.06,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(0xFF3A3A3C),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                        )),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: Get.width * 0.001),
                        Row(
                          children: [
                            icon(
                                icon: Icons.tablet_mac_sharp,
                                color: Color(AppColor.orange)),
                            SizedBox(
                              width: 3,
                            ),
                            text(
                                text: '8866091904',
                                fontSize: Get.height * 0.013)
                          ],
                        ),
                        Row(
                          children: [
                            icon(
                                icon: Icons.email_outlined,
                                color: Color(AppColor.orange)),
                            SizedBox(
                              width: 3,
                            ),
                            text(
                                text: 'gd546954@gmail.com',
                                fontSize: Get.height * 0.013)
                          ],
                        ),
                        Row(
                          children: [
                            icon(
                                icon: Icons.blur_circular,
                                color: Color(AppColor.orange)),
                            SizedBox(width: 3),
                            text(
                                text: 'website@gmail.com',
                                fontSize: Get.height * 0.013)
                          ],
                        ),
                      ],
                    )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    alignment: Alignment.center,
                    height: Get.height * 0.03,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(0xFF58585A),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(150),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icon(
                            icon: Icons.pin_drop_sharp,
                            color: Color(AppColor.orange)),
                        SizedBox(width: 3),
                        text(
                            text: '3 Bhramaniya para Santkabir Road rajkot',
                            fontSize: Get.height * 0.015),
                      ],
                    )),
              )
            ],
          ),
        )
      ],
    ); 
  }
}


class Frame_03 extends StatelessWidget {
  const Frame_03({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        image: AssetImage('${AssetPath.splash}logo.png'))),
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 20, top: 20),
                child: text(
                    text: 'Milan Vaghasiya', fontSize: Get.height * 0.015)),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: Get.width * 0.03),
              height: Get.height * 0.05,
              width: Get.width * 0.33,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // ignore: prefer_const_literals_to_create_immutables
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
                    Divider(
                      height: 1.5,
                      thickness: 1.5,
                      color: Colors.black,
                    ),
                    SizedBox(height: Get.height * 0.017)
                  ]),
            ),
            Container(
              height: Get.height * 0.05,
              width: Get.width * 0.33,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Get.height * 0.05),
                  border: Border.all(width: 1)),
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
              padding: EdgeInsets.only(right: Get.width * 0.03),
              height: Get.height * 0.05,
              width: Get.width * 0.33,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
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
                    Divider(
                      height: 1.5,
                      thickness: 1.5,
                      color: Colors.black,
                    ),
                    SizedBox(height: Get.height * 0.017)
                  ]),
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.005),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon(icon: Icons.pin_drop_sharp, color: Colors.white),
            SizedBox(width: 3),
            text(
                text: '3 Bhramaniya para Santkabir Road rajkot',
                fontSize: Get.height * 0.015),
          ],
        ),
        SizedBox(height: 3),
      ],
    );
  }
}


class Frame_04 extends StatelessWidget {
  const Frame_04({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        image: AssetImage('${AssetPath.splash}logo.png'))),
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 20, top: 20),
                child: text(
                    text: 'Milan Vaghasiya', fontSize: Get.height * 0.015)),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Container(
              height: Get.height * 0.15,
              width: Get.width * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('${AssetPath.frame}f14_left.png'),
                      fit: BoxFit.fill)),
              child: Padding(
                padding: EdgeInsets.only(
                  left: Get.width * 0.025,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
            ),
          ],
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: Get.height * 0.025,
          width: double.infinity,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon(icon: Icons.pin_drop_sharp, color: Colors.white),
              SizedBox(width: 3),
              text(
                  text: '3 Bhramaniya para Santkabir Road rajkot',
                  fontSize: Get.height * 0.015),
            ],
          ),
        ),
      ],
    );
  }
}



class Frame_05 extends StatelessWidget {
  const Frame_05({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                      image: AssetImage('${AssetPath.splash}logo.png'))),
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 20, top: 20),
              child:
                  text(text: 'Milan Vaghasiya', fontSize: Get.height * 0.015)),
        ],
      ),
      Spacer(),
      Stack(children: [
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(
                left: Get.width * 0.085, right: Get.width * 0.085),
            margin: EdgeInsets.only(top: Get.height * 0.005),
            height: Get.height * 0.03,
            width: double.infinity,
            color: Color(0xFF28A04B),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                text(text: 'gd546954@gmail.com', fontSize: Get.height * 0.013),
                Row(
                  children: [
                    icon(
                        icon: Icons.blur_circular,
                        color: Color(AppColor.white)),
                    SizedBox(width: 3),
                    text(
                        text: 'website@gmail.com', fontSize: Get.height * 0.013)
                  ],
                ),
                text(text: '8866090904', fontSize: Get.height * 0.013)
              ],
            )),
        Container(
          alignment: Alignment.center,
          height: Get.height * 0.04,
          width: Get.width * 0.08,
          decoration: BoxDecoration(
              color: Color(0xFFF6941D),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Get.height * 0.015),
                  bottomRight: Radius.circular(Get.height * 0.015))),
          child: icon(icon: Icons.email_outlined, color: Color(AppColor.white)),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            alignment: Alignment.center,
            height: Get.height * 0.04,
            width: Get.width * 0.08,
            decoration: BoxDecoration(
                color: Color(0xFFF6941D),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Get.height * 0.015),
                    bottomLeft: Radius.circular(Get.height * 0.015))),
            child: icon(
                icon: Icons.tablet_mac_sharp, color: Color(AppColor.white)),
          ),
        ),
      ]),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon(icon: Icons.pin_drop_sharp, color: Colors.white),
          SizedBox(width: 3),
          text(
              text: '3 Bhramaniya para Santkabir Road rajkot',
              fontSize: Get.height * 0.015),
        ],
      ),
      SizedBox(height: 5)
    ]);
  }
}