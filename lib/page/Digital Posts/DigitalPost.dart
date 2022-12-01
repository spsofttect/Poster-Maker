// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/commanlist/list.dart';
import 'package:poster_maker/Helper/commanwidget.dart';
import 'package:poster_maker/page/Digital%20Posts/viewAllCategory.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';

class DigitalPost extends StatelessWidget {
  const DigitalPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          commanAppbar(
              pageName: "Digital Posts",
              ontap: () {
                Get.back();
              }),
          Expanded(
            child: ListView(
              children: [
                title(title: 'Instagram Post'),
                customListView(
                  onTap: () {},
                  listindex: item2,
                  itemCount: item2.length,
                  boxfit: BoxFit.fitHeight,
                  height: 160,
                  width: 120,
                  scrollDirection: Axis.horizontal,
                ),
                // Youtube Banner
                title(title: 'Youtube Banner'),
                customListView(
                    listindex: item.reversed.toList(),
                    itemCount: item.length,
                    boxfit: BoxFit.cover,
                    height: 120,
                    width: 200,
                    scrollDirection: Axis.horizontal),
                // Festival
                title(
                    title: 'Festival',
                    onTap: () {
                      Get.to(ViewAllCatagory());
                    }),
                customListView(
                    onTap: () {},
                    listindex: item,
                    itemCount: item.length,
                    boxfit: BoxFit.cover,
                    height: 120,
                    width: 120,
                    scrollDirection: Axis.horizontal),
                // FaceBook Post
                title(title: 'FaceBook Post'),
                customListView(
                    listindex: item2.reversed.toList(),
                    itemCount: item2.length,
                    boxfit: BoxFit.fitHeight,
                    height: 180,
                    width: 130,
                    scrollDirection: Axis.horizontal),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
