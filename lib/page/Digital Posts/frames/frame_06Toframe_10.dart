// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/commanwidget.dart';
import 'package:poster_maker/Helper/utlity.dart';

// class Frame_06 extends StatelessWidget {
//   const Frame_06({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DottedBorder(
//         dashPattern: [10, 3, 3, 3],
//         strokeWidth: 3,
//         color: Color(AppColor.black),
//         borderType: BorderType.RRect,
//         child: Container(
//             height: hW,
//             width: hW,
//             decoration: BoxDecoration(),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                       onTap: () {},
//                       child: Container(
//                         margin: EdgeInsets.only(left: 20, top: 20),
//                         height: Get.height * 0.04,
//                         width: Get.height * 0.04,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image:
//                                     AssetImage('${AssetPath.splash}logo.png'))),
//                       ),
//                     ),
//                     Container(
//                         margin: EdgeInsets.only(right: 20, top: 20),
//                         child: text(
//                             text: 'Milan Vaghasiya',
//                             fontSize: Get.height * 0.015)),
//                   ],
//                 ),
//                 Spacer(),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(
//                         left: Get.width * 0.025,
//                       ),
//                       child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 icon(
//                                     icon: Icons.tablet_mac_sharp,
//                                     color: Color(AppColor.white)),
//                                 SizedBox(width: 3),
//                                 text(
//                                     text: '8866090904',
//                                     fontSize: Get.height * 0.013)
//                               ],
//                             ),
//                             SizedBox(height: Get.height * 0.007),
//                             Row(
//                               children: [
//                                 icon(
//                                     icon: Icons.email_outlined,
//                                     color: Color(AppColor.white)),
//                                 SizedBox(width: 3),
//                                 text(
//                                     text: 'gd546954@gmail.com',
//                                     fontSize: Get.height * 0.013)
//                               ],
//                             ),
//                             SizedBox(height: Get.height * 0.007),
//                             Row(
//                               children: [
//                                 icon(
//                                     icon: Icons.blur_circular,
//                                     color: Color(AppColor.white)),
//                                 SizedBox(width: 3),
//                                 text(
//                                     text: 'website@gmail.com',
//                                     fontSize: Get.height * 0.013)
//                               ],
//                             ),
//                             SizedBox(height: Get.height * 0.007),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 icon(
//                                     icon: Icons.pin_drop_sharp,
//                                     color: Colors.white),
//                                 SizedBox(width: 3),
//                                 text(
//                                     text:
//                                         '3 Bhramaniya para Santkabir Road rajkot',
//                                     fontSize: Get.height * 0.015),
//                               ],
//                             ),
//                             SizedBox(height: Get.height * 0.007),
//                           ]),
//                     ),
//                   ],
//                 ),
//               ],
//             )));
//   }
// }