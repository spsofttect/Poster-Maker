// ignore_for_file: prefer_const_constructors, file_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/commanlist/list.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/page/Digital%20Posts/DigitalPostSlider.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';

class ViewAllCatagory extends StatelessWidget {
  const ViewAllCatagory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          commanAppbar(
              pageName: 'fastival',
              ontap: () {
                Get.back();
              }),
          Expanded(
            child: SingleChildScrollView(
              // child: AlignedGridView.count(
              //   padding: EdgeInsets.all(15),
              //   shrinkWrap: true,
              //   physics: BouncingScrollPhysics(),
              //   crossAxisCount: 3,
              //   mainAxisSpacing: 10,
              //   crossAxisSpacing: 10,
              //   itemCount: item2.length,
              //   itemBuilder: (context, index) {
              //     var currentObj = item2[index];
              //     return Bounce(
              //         duration: Duration(milliseconds: 200),
              //         onPressed: () {
              //           Get.to(DigitalPostSliderPage());
              //         },
              //         child: Stack(
              //           children: [
              //             Container(
              //               // margin: EdgeInsets.only(
              //               //     left: index == 0 ? 15 : 5,
              //               //     right: index == itemCount - 1 ? 15 : 5),
              //               padding: EdgeInsets.only(top: 7, left: 7, right: 7),
              //               width: Get.width * 0.33,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(15),
              //                 border: Border.all(
              //                     width: 2,
              //                     color:
              //                         Color(AppColor.orange).withOpacity(0.5)),
              //               ),
              //               child: Column(
              //                 children: [
              //                   Container(
              //                     height: 130,
              //                     decoration: BoxDecoration(
              //                         image: DecorationImage(
              //                             image: AssetImage(currentObj),
              //                             fit: BoxFit.fill),
              //                         borderRadius: BorderRadius.circular(15),
              //                         color: Color(AppColor.grey)),
              //                   ),
              //                   Container(
              //                       margin: EdgeInsets.only(top: 5, bottom: 5),
              //                       height: 20,
              //                       // color: Colors.amber,
              //                       child: Center(child: Text("Index $index"))),
              //                 ],
              //               ),
              //             ),
                         
              //           ],
              //         ));
              //   },
              // ),
            
            ),
          )
        ]),
      ),
    );
  }
}
