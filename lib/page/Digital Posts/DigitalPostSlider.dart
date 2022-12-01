// ignore_for_file: prefer_const_constructors, unused_import, file_names

import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/commanlist/list.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/Helper/widget.dart';
import 'package:poster_maker/page/Digital%20Posts/frames/selecteFrame.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';
import 'package:poster_maker/page/bottomnavbar/homepage/addBusiness/addBuisness.dart';

class DigitalPostSliderPage extends StatefulWidget {
  const DigitalPostSliderPage({Key key}) : super(key: key);

  @override
  State<DigitalPostSliderPage> createState() => _DigitalPostSliderPageState();
}

class _DigitalPostSliderPageState extends State<DigitalPostSliderPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

  var currentind = 0;
  selectedIndex(index) {
    currentind = index;
  }

  var posterIndex = 0;
  var storyIndex = 0;
  var videoIndex = 0;
  var currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Image.asset(
                      '${AssetPath.language}back.png',
                      height: 25,
                    ),
                  ),
                ),
                Text(
                  'DigitalPoster',
                  style: TextStyle(fontFamily: AppFont.Medium, fontSize: 20),
                ),
                Spacer(),
                CommanWidget().nextButton(
                    onTap: () {
                      Get.to(SelecteFrames());
                    },
                    margin: EdgeInsets.only(right: 10),
                    height: 35,
                    width: 80,
                    radius: 10,
                    text: 'Edit')
              ],
            ),
            CarouselSlider.builder(
              itemCount: 3,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return Container(
                  // margin: EdgeInsets.only(left: 10, right: 10),
                  // height: 100,

                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      image: DecorationImage(
                        image: currentIndex == itemIndex
                            ? currentIndex == 0
                                ? AssetImage(
                                    item2[storyIndex].url,
                                  )
                                : currentIndex == 1
                                    ? AssetImage(
                                        posterImage[posterIndex],
                                      )
                                    : AssetImage(
                                        item[videoIndex],
                                      )
                            : AssetImage(''),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                );
              },
              options: CarouselOptions(
                onPageChanged: (value, oldValue) {
                  setState(() {});
                  currentIndex = value;
                },
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                height: Get.height * 0.35,
                initialPage: 1,
                enableInfiniteScroll: false,
              ),
            ),
            SizedBox(height: 20),
            selecteLanguage(),
            SizedBox(height: 10),
            if (currentIndex == 0)
              storygridView()
            else if (currentIndex == 1)
              postergridView()
            else if (currentIndex == 2)
              storygridView()
          ],
        ),
      ),
    );
  }

  Widget storygridView() {
    return Expanded(
      child: SingleChildScrollView(
        // child: AlignedGridView.count(
        //   padding: EdgeInsets.all(15),
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   crossAxisCount: 4,
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        //   itemCount: item2.length,
        //   itemBuilder: (context, index) {
        //     var currentObj = item2[index];
        //     return Bounce(
        //         duration: Duration(milliseconds: 200),
        //         onPressed: () {
        //           setState(() {
        //             storyIndex = index;
        //           });
          
        //         },
        //         child: Container(
        //           height: 100,
        //           decoration: BoxDecoration(
        //               image: DecorationImage(
        //                   image: AssetImage(currentObj), fit: BoxFit.fill),
        //               borderRadius: BorderRadius.circular(15),
        //               color: Color(AppColor.grey)),
        //         ));
        //   },
        // ),
      
      ),
    );
  }

  Widget postergridView() {
    return Expanded(
      child: SingleChildScrollView(
        // child: AlignedGridView.count(
        //   padding: EdgeInsets.all(15),
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   crossAxisCount: 4,
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        //   itemCount: posterImage.length,
        //   itemBuilder: (context, index) {
        //     var currentObj = posterImage[index];
        //     return Bounce(
        //         duration: Duration(milliseconds: 200),
        //         onPressed: () {
        //           setState(() {
        //             posterIndex = index;
        //           });
        //         },
        //         child: Container(
        //           height: 100,
        //           decoration: BoxDecoration(
        //               image: DecorationImage(
        //                   image: AssetImage(currentObj), fit: BoxFit.fill),
        //               borderRadius: BorderRadius.circular(15),
        //               color: Color(AppColor.grey)),
        //         ));
        //   },
        // ),
     
      ),
    );
  }

// selecteLanguage
  Widget selecteLanguage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        languageButton(
            text: 'English',
            color:
                currentind == 0 ? Color(AppColor.orange) : Color(AppColor.grey),
            onTap: () {
              setState(() {
                selectedIndex(0);
              });
            }),
        languageButton(
            text: 'हिंदी',
            color:
                currentind == 1 ? Color(AppColor.orange) : Color(AppColor.grey),
            onTap: () {
              setState(() {
                selectedIndex(1);
              });
            }),
        languageButton(
            text: 'मराठी',
            color:
                currentind == 2 ? Color(AppColor.orange) : Color(AppColor.grey),
            onTap: () {
              setState(() {
                selectedIndex(2);
              });
            }),
        languageButton(
            text: 'ગુજરાતી',
            color:
                currentind == 3 ? Color(AppColor.orange) : Color(AppColor.grey),
            onTap: () {
              setState(() {
                selectedIndex(3);
              });
            }),
      ],
    );
  }

// languageButton
  Widget languageButton({text, onTap, color}) {
    return Bounce(
        duration: Duration(milliseconds: 200),
        onPressed: onTap,
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            height: Get.height * 0.04,
            width: Get.height * 0.1,
            decoration: BoxDecoration(
                color: Color(AppColor.white).withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1.5, color: color)),
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: color, fontFamily: AppFont.Medium),
              ),
            ),
          ),
        ));
  }
}
