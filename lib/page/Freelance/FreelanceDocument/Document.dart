// ignore_for_file: file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/comman_function/commanFunction.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/Helper/widget.dart';
import 'package:poster_maker/page/Freelance/BankDetail/bankDetail.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';

class DocumentPageView extends StatefulWidget {
  const DocumentPageView({Key key}) : super(key: key);

  @override
  State<DocumentPageView> createState() => _DocumentPageViewState();
}

class _DocumentPageViewState extends State<DocumentPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          commanAppbar(
              pageName: 'Freelance Document',
              ontap: () {
                Get.back();
              }),
          Expanded(
              child: ListView(
            children: [
              title(text: 'Pan Card'),
              Obx(() => PanCard()),
              title(text: 'AadharCard'),
              Wrap(
                children: [
                  Obx(() => aadharcardFront()),
                  Obx(() => aadharcardBack()),
                ],
              ),
              CommanWidget().nextButton(
                  margin: EdgeInsets.all(20),
                  radius: 10,
                  onTap: () {
                    Get.to(BankDetails());
                  },
                  height: 45,
                  text: 'Upload')
            ],
          ))
        ]),
      ),
    );
  }

  Widget PanCard() {
    return GestureDetector(
        onTap: () {
          getPancard();
        },
        child: dottedCon(
            margin: EdgeInsets.only(left: 20, right: 20),
            widget: Container(
              height: isPanSelected.value ? 150 : 80,
              width: isPanSelected.value ? 200 : 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: isPanSelected.value
                      ? FileImage(pancard.value)
                      : AssetImage('${AssetPath.refer}pan.png'),
                ),
              ),
            )));
  }

  Widget aadharcardFront() {
    return GestureDetector(
        onTap: () {
          getAadharFront();
        },
        child: dottedCon(
            margin: EdgeInsets.only(left: 20, right: 20),
            widget: Container(
              height: isFrontSelected.value ? 150 : 80,
              width: isFrontSelected.value ? 200 : 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: isFrontSelected.value
                      ? FileImage(aadharFront.value)
                      : AssetImage('${AssetPath.refer}front.png'),
                ),
              ),
            )));
  }

  Widget aadharcardBack() {
    return GestureDetector(
        onTap: () {
          getAadharBack();
        },
        child: dottedCon(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            widget: Container(
              height: isBackSelected.value ? 150 : 80,
              width: isBackSelected.value ? 200 : 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: isBackSelected.value
                      ? FileImage(aadharBack.value)
                      : AssetImage('${AssetPath.refer}back.png'),
                ),
              ),
            )));
  }

  Widget dottedCon({widget, margin}) {
    return Container(
      margin: margin,
      child: DottedBorder(
        dashPattern: [10, 3, 2, 3],
        strokeWidth: 2,
        padding: EdgeInsets.all(15),
        color: Color(AppColor.yellow),
        borderType: BorderType.RRect,
        radius: Radius.circular(10),
        child: SizedBox(
          width: double.infinity,
          child: widget,
        ),
      ),
    );
  }

// Titel
  Widget title({text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, bottom: 10.0),
      child: Row(
        children: [
          Text(
            text,
            textAlign: TextAlign.start,
            style: TextStyle(fontFamily: AppFont.SemiBold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
