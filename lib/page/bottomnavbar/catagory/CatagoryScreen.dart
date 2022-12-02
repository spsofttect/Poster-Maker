// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/commanlist/list.dart';
import 'package:poster_maker/Helper/commanwidget.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/page/bottomnavbar/bottomnavbar.dart';

class CatagoryScreen extends StatefulWidget {
  CatagoryScreen({Key key}) : super(key: key);

  @override
  State<CatagoryScreen> createState() => _CatagoryScreenState();
}

class _CatagoryScreenState extends State<CatagoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          SizedBox(height: 10),
          appbar(),
          // Instagram
          title(title: 'Instagram Post',context: context),
          customListView(
            
              listindex: item2,
              itemCount: item2.length,
              boxfit: BoxFit.fitHeight,
              height: 160,
              width: 120,
              scrollDirection: Axis.horizontal),
          // Youtube Banner
          title(title: 'Youtube Banner',context: context),
          customListView(
              listindex: item.reversed.toList(),
              itemCount: item.length,
              boxfit: BoxFit.cover,
              height: 120,
              width: 200,
              scrollDirection: Axis.horizontal),
          // Festival
          title(title: 'Festival',context: context),
          customListView(
              listindex: item,
              itemCount: item.length,
              boxfit: BoxFit.cover,
              height: 120,
              width: 120,
              scrollDirection: Axis.horizontal),
          // FaceBook Post
          title(title: 'FaceBook Post',context: context),
          customListView(
              listindex: item2.reversed.toList(),
              itemCount: item2.length,
              boxfit: BoxFit.fitHeight,
              height: 180,
              width: 130,
              scrollDirection: Axis.horizontal),
              SizedBox(height: Get.height*0.09,)
        ]),
      ),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>AppBar<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget appbar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Get.offAll(BottomNavBarScreen());
            },
            child: Container(
              margin: EdgeInsets.all(5),
              child: Image.asset(
                '${AssetPath.language}back.png',
                height: 25,
              ),
            ),
          ),
          Container(
            height: 35,
            width: Get.width * 0.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(AppColor.white)),
          ),
          Text(
            'Cancel',
            style: TextStyle(
              color: Color(AppColor.orange),
              fontFamily: AppFont.Regular,
            ),
          )
        ],
      );
}
