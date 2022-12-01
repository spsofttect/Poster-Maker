// ignore_for_file: prefer_const_constructors, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';
import 'package:poster_maker/page/bottomnavbar/bottomnavbar.dart';
import 'package:poster_maker/page/bottomnavbar/homepage/addBusiness/addBuisness.dart';

class CetegoryNameScreen extends StatefulWidget {
  const CetegoryNameScreen({Key key}) : super(key: key);

  @override
  State<CetegoryNameScreen> createState() => _CetegoryNameScreenState();
}

class _CetegoryNameScreenState extends State<CetegoryNameScreen> {
  @override
  Widget build(BuildContext context) {
    // DeviceOrientation
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
      body: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.down,
              color: Color(AppColor.orange),
              child: SafeArea(
                child: ListView(children: [
                  commanAppbar(
                      ontap: () {
                        Get.offAll(BottomNavBarScreen());
                      },
                      pageName: 'Ctegory Name'),
                  Container(
                    height: 35,
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                        top: 15, left: 10, right: 10, bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(AppColor.grey).withOpacity(0.5)),
                  ),
                  categoryList()
                ]),
              ))),
    );
  }

  Widget categoryList() {
    return SizedBox(
      height: Get.height * 0.8,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: ctegory.length,
          itemBuilder: (cotext, index) {
            var currentObj = ctegory[index];
            return Container(
              padding: const EdgeInsets.only(left: 25, right: 15),
              height: 45,
              width: double.infinity,
              margin:
                  const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(AppColor.grey).withOpacity(0.5)),
              child: Row(children: [
                Image.asset(
                  AssetPath.ctegory + currentObj.image,
                  height: 30,
                ),
                const SizedBox(width: 15),
                Text(
                  currentObj.name,
                  style: TextStyle(
                      fontFamily: AppFont.Medium,
                      fontSize: 16,
                      color: Color(AppColor.bgcolor)),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(AppColor.bgcolor),
                  size: 18,
                )
              ]),
            );
          }),
    );
  }
}

class Category {
  String image;
  String name;

  Category({this.image, this.name});
}

List<Category> ctegory = [
  Category(image: 'Acting.png', name: 'Acting Acedemy'),
  Category(image: 'Advertising.png', name: 'Advertising Consultancy'),
  Category(image: 'Advocate.png', name: 'Advocate'),
  Category(image: 'Agarbatti.png', name: 'Agarbatti'),
  Category(image: 'agriculture.png', name: 'Agriculture'),
  Category(image: 'ambulance.png', name: 'Ambulance'),
  Category(image: 'Architecture.png', name: 'Architecture Work'),
  Category(image: 'Design.png', name: 'Art & Design'),
  Category(image: 'astrology.png', name: 'Astrology'),
];
