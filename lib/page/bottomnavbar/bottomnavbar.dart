// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_string_interpolations, sort_child_properties_last, avoid_unnecessary_containers, unused_import

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/app_theme.dart';
import 'package:poster_maker/Helper/commanlist/list.dart';
import 'package:poster_maker/Helper/commanwidget.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/page/bottomnavbar/CustomScreen/customScreen.dart';
import 'package:poster_maker/page/bottomnavbar/FavoritScreen/FavoritScreen.dart';
import 'package:poster_maker/page/bottomnavbar/PostScreen/postScreen.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';
import 'package:poster_maker/page/bottomnavbar/catagory/CatagoryScreen.dart';
import 'package:poster_maker/page/bottomnavbar/drawer.dart';
import 'package:poster_maker/page/bottomnavbar/homepage/HomePage.dart';
import 'package:poster_maker/page/notification/notification.dart';
import 'package:poster_maker/page/settingpage/settingScreen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() async {
  //   super.dispose();
  //   await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  var currentIndex = 0;

  selectedIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  moveUp() {
    if (currentIndex == 0) {
      homePageController.animateTo(0, curve: Curves.linear, duration: Duration(milliseconds: 500));
    } else if (currentIndex == 1) {
      categoryPageController.animateTo(0, curve: Curves.linear, duration: Duration(milliseconds: 500));
    } else if (currentIndex == 2) {
      customPageController.animateTo(0, curve: Curves.linear, duration: Duration(milliseconds: 500));
    } else if (currentIndex == 3) {
      favouritePageController.animateTo(0, curve: Curves.linear, duration: Duration(milliseconds: 500));
    } else {
      myPostPageController.animateTo(0, curve: Curves.linear, duration: Duration(milliseconds: 500));
    }
  }

  @override
  Widget build(BuildContext context) {
    // DeviceOrientationd
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // Do not capture Screenshot and video
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    // Do not capture Screenshot and video
    return AdvancedDrawer(
      controller: advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      backdropColor: Color(AppColor.bgcolor),
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),

      child: Scaffold(
        body: Stack(
          children: [
            if (currentIndex == 0)
              HomePage()
            else if (currentIndex == 1)
              CatagoryScreen()
            else if (currentIndex == 2)
              CustomScreen()
            else if (currentIndex == 3)
              FavoriteScreen()
            else if (currentIndex == 4)
              PostScreen(),
            SizedBox(height: 80),
            // ScrollConfiguration(
            //     behavior: ScrollBehavior(),
            //     child: GlowingOverscrollIndicator(
            //         axisDirection: AxisDirection.down,
            //         color: Color(AppColor.orange),
            //         child: NotificationListener<ScrollNotification>(
            //             // ignore: missing_return
            //             onNotification: (scroll) {
            //               if (scroll.metrics.pixels != 0.0) {
            //                 isScroll.value = true;
            //               } else if (scroll.metrics.pixels == 100.0) {
            //                 isScroll.value = false;
            //               } else {
            //                 isScroll.value = false;
            //               }
            //             },
            //             child: Column(
            //               // controller: scrollController,
            //               children: [
            //                 if (currentIndex == 0)
            //                   HomePage()
            //                 else if (currentIndex == 1)
            //                   CatagoryScreen()
            //                 else if (currentIndex == 2)
            //                   CustomScreen()
            //                 else if (currentIndex == 3)
            //                   FavoriteScreen()
            //                 else if (currentIndex == 4)
            //                   PostScreen(),
            //                 SizedBox(height: 80)
            //               ],
            //             )))),
            flottingButton(),
            Align(alignment: Alignment.bottomCenter, child: bottomnavbar()),
          ],
        ),
      ),
      drawer: SafeArea(child: DrawerPage()),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> flottingButton <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget flottingButton() {
    return GestureDetector(
      onTap: () {
        if (isScroll.value) {
          moveUp();
        } else {
          Get.to(NotificationPageView());
        }
      },
      child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: Get.height * 0.12, right: Get.height * 0.03),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Color(AppColor.white))],
              border: Border.all(width: 2.5, color: Color(AppColor.white)),
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: const [Color(0xFFFA7F08), Color(0xFFF24405)]),
              // color: Color(AppColor.orange),
            ),
            child: Obx(
              () => Stack(
                alignment: Alignment.center,
                children: [
                  (isScroll.value)
                      ? Transform.rotate(
                          angle: 3.15,
                          child: Image.asset(
                            "${AssetPath.refer}fastdown.png",
                            colorBlendMode: BlendMode.srcIn,
                            color: Colors.white,
                            scale: 2,
                          ),
                        )
                      : Image.asset(
                          '${AssetPath.homepage}notification.png',
                          colorBlendMode: BlendMode.srcIn,
                          color: Colors.white,
                          scale: 1.5,
                        ),
                  (isScroll.value)
                      ? Container()
                      : Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.only(right: 5, top: 2),
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(AppColor.orange)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text('12', style: TextStyle(fontSize: 9, fontFamily: AppFont.Medium, color: Color(AppColor.orange))),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          )),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> bottomnavbar <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget bottomnavbar() {
    return Container(
      height: 55,
      margin: EdgeInsets.only(bottom: Get.height * 0.02, left: 30, right: 30),
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: const [Color(0xFFFA7F08), Color(0xFFF24405)]),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        iconButton(currentInd: 0, iconImg: 'home.png', iconName: 'Home', selectedind: 0),
        iconButton(currentInd: 1, iconImg: 'Category.png', iconName: 'Category', selectedind: 1),
        iconButton(currentInd: 2, iconImg: 'Custom.png', iconName: 'Custom', selectedind: 2),
        iconButton(currentInd: 3, iconImg: 'Favorite.png', iconName: 'Favorite', selectedind: 3),
        iconButton(currentInd: 4, iconImg: 'gallery.png', iconName: 'My Post', selectedind: 4),
      ]),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> iconButton <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget iconButton({currentInd, selectedind, String iconImg, String iconName}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 35,
          child: IconButton(
            hoverColor: Colors.transparent,
            color: Colors.transparent,
            autofocus: false,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            disabledColor: Colors.transparent,
            icon: Image.asset(
              "${AssetPath.bottomnavbar}$iconImg",
              color: Color(AppColor.white),
              height: 25,
            ),
            onPressed: () {
              isScroll.value = false;
              selectedIndex(selectedind);
            },
          ),
        ),
        currentIndex == currentInd
            ? Text(
                "$iconName",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: AppFont.Medium,
                  color: currentIndex == currentInd ? Color(AppColor.white) : Colors.transparent,
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

// class Controller extends GetxController {
//   var scaffoldKey = GlobalKey<ScaffoldState>();

//   void openDrawer() {
//     scaffoldKey.currentState.openDrawer();
//   }

//   void closeDrawer() {
//     scaffoldKey.currentState.openEndDrawer();
//   }
// }
