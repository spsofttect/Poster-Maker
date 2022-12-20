// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, non_constant_identifier_names, unused_import, file_names

import 'dart:async';

import 'package:cached_video_player/cached_video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poster_maker/Helper/commanlist/list.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/page/editBottomNavBar/EditBottomNavbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../Helper/commanwidget.dart';
import '../appbar/Appbar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // int _currentPage = 0;
  int posterIndex = 0;
  CachedVideoPlayerController controller;

  // Timer _timer;
  TabController _tabController;
  // PageController controller =
  //     PageController(viewportFraction: 0.8, keepPage: true, initialPage: 0);
  // PageController pagecontroll =
  //     PageController(viewportFraction: 1, keepPage: true);

  @override
  void initState() {
    super.initState();
    isScroll.value = false;
    _tabController = TabController(
      length: 4,
      vsync: this,
      animationDuration: Duration(microseconds: 1),
    );
    _tabController.addListener(() {
      currentIndex.value = _tabController.index;
    });
    homePageController.addListener(() {
      if (homePageController.position.pixels > Get.height * 0.1) {
        isScroll.value = true;
      } else {
        isScroll.value = false;
      }
    });
    // _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
    //   if (_currentPage < banner.length) {
    //     _currentPage;
    //   } else {
    //     _currentPage = 0;
    //   }

    //   // controller.animateToPage(
    //   //   _currentPage,
    //   //   duration: Duration(milliseconds: 350),
    //   //   curve: Curves.easeInCubic,
    //   // );
    // });
  }

  RxInt currentIndex = 0.obs;

  @override
  void dispose() {
    super.dispose();
    // _timer?.cancel();
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        controller: homePageController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              automaticallyImplyLeading: false,
              pinned: true,
              centerTitle: false,
              toolbarHeight: Get.height * 0.08,
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(Get.height * 0.02),
                  child: homeAppbar(
                      draweronTap: _handleMenuButtonPressed, context: context)),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      bannerView(),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: posterImage
                              .map((e) =>
                                  indicator(index: posterImage.indexOf(e)))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverAppBar(
              toolbarHeight: Get.height * 0.003,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              pinned: true,
              automaticallyImplyLeading: false,
              bottom: tabBarView(),
            ),
          ];
        },
        body: TabBarView(
            controller: _tabController,
            physics: BouncingScrollPhysics(),
            children: [
              New(),
              Banner(),
              Post(),
              Story(),
            ]),
      ),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>NewpageView<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget New() {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.only(bottom: Get.height * 0.09),
      crossAxisCount: 2,
      padding: EdgeInsets.only(bottom: Get.height * 0.1),
      itemCount: item3.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Bounce(
          duration: Duration(milliseconds: 200),
          onPressed: () {
            Get.to(EditBottomNavBar());
          },
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: (item3[index].isVideo)
                  ? DynamicVideoPlayer(
                      url: item3[index].url,
                      index: index,
                    )
                  : Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.asset(item3[index].url),
                        InkWell(
                          onTap: () {
                            item3[index].isLike = !item3[index].isLike;
                            setState(() {});
                            if (item3[index].isLike) {
                              favourit.add(item3[index]);
                            } else {
                              favourit.remove(item3[index]);
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Color(AppColor.black),
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(
                              Icons.favorite,
                              color: (!item3[index].isLike)
                                  ? Color(AppColor.white)
                                  : Color(AppColor.red),
                            ),
                          ),
                        ),
                      ],
                    )),
        ),
      ),
      staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>BannerView<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget Banner() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      padding: EdgeInsets.only(bottom: Get.height * 0.1),
      itemCount: banner.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Bounce(
          duration: Duration(milliseconds: 200),
          onPressed: () {
            Get.to(EditBottomNavBar());
          },
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Image.asset(banner[index])),
        ),
      ),
      staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
    );

    // GridView.custom(
    //   shrinkWrap: true,
    //   padding: EdgeInsets.all(15),
    //   // gridDelegate: SliverQuiltedGridDelegate(
    //   //   crossAxisCount: 2,
    //   //   mainAxisSpacing: 10,
    //   //   crossAxisSpacing: 10,
    //   //   repeatPattern: QuiltedGridRepeatPattern.inverted,
    //   //   pattern: const [
    //   //     QuiltedGridTile(1, 2),
    //   //     QuiltedGridTile(1, 2),
    //   //   ],
    //   // ),
    //   childrenDelegate: SliverChildBuilderDelegate(
    //     (context, index) {
    //       var currentObj = item2[index];
    //       return Container(
    //         decoration: BoxDecoration(
    //             // boxShadow: [
    //             //   BoxShadow(
    //             //       blurRadius: 5,
    //             //       color: isdarkMode.value
    //             //           ? Colors.transparent
    //             //           : Color(AppColor.grey))
    //             // ],
    //             image: DecorationImage(
    //                 image: AssetImage(currentObj), fit: BoxFit.fill),
    //             borderRadius: BorderRadius.circular(15),
    //             color: Color(AppColor.yellow).withOpacity(0.8)),
    //       );
    //     },
    //     childCount: item2.length,
    //   ),
    // );

    // Container(
    //     margin: EdgeInsets.all(15),
    //     height: Get.height,
    //     width: Get.width,
    //     // color: Color(AppColor.orange).withOpacity(0.1),
    //     child: GridView.builder(
    //       physics: BouncingScrollPhysics(),
    //       itemCount: 25,
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           crossAxisSpacing: 10.0,
    //           mainAxisSpacing: 10.0,
    //           mainAxisExtent: 80.0),
    //       itemBuilder: (BuildContext context, int index) {
    //         return Container(
    //           width: Get.width * 0.4,
    //           decoration: BoxDecoration(
    //               color: Color(AppColor.yellow),
    //               borderRadius: BorderRadius.circular(15)),
    //           child: Center(child: Text("${index}")),
    //         );
    //       },
    //     ));
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Postview<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget Post() {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.only(bottom: Get.height * 0.09),
      crossAxisCount: 2,
      padding: EdgeInsets.only(bottom: Get.height * 0.1),
      itemCount: item.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Bounce(
          duration: Duration(milliseconds: 200),
          onPressed: () {
            Get.to(EditBottomNavBar());
          },
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Image.asset(item[index])),
        ),
      ),
      staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
    );

    // GridView.custom(
    //   padding: EdgeInsets.all(15),
    //   shrinkWrap: true,
    //   physics: const BouncingScrollPhysics(),
    //   // gridDelegate: SliverQuiltedGridDelegate(
    //   //   crossAxisCount: 2,
    //   //   mainAxisSpacing: 16,
    //   //   crossAxisSpacing: 16,
    //   //   repeatPattern: QuiltedGridRepeatPattern.inverted,
    //   //   pattern: const [
    //   //     QuiltedGridTile(1, 1),
    //   //     // QuiltedGridTile(1, 1),
    //   //     // QuiltedGridTile(1, 1),
    //   //     // QuiltedGridTile(1, 2),
    //   //   ],
    //   // ),
    //   childrenDelegate: SliverChildBuilderDelegate(
    //     (context, index) {
    //       var currentObj = item[index];
    //       return Container(
    //         decoration: BoxDecoration(
    //             // boxShadow: [
    //             //   BoxShadow(
    //             //       blurRadius: 5,
    //             //       color: isdarkMode.value
    //             //           ? Colors.transparent
    //             //           : Color(AppColor.grey))
    //             // ],
    //             image: DecorationImage(
    //                 image: AssetImage(currentObj), fit: BoxFit.fill),
    //             borderRadius: BorderRadius.circular(15),
    //             color: Color(AppColor.yellow).withOpacity(0.8)),
    //       );
    //     },
    //     childCount: item.length,
    //   ),
    // );

    // Container(
    //     margin: EdgeInsets.all(15),
    //     height: Get.height,
    //     width: Get.width,
    //     // color: Color(AppColor.orange).withOpacity(0.1),
    //     child: GridView.builder(
    //       physics: BouncingScrollPhysics(),
    //       itemCount: 25,
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           crossAxisSpacing: 10.0,
    //           mainAxisSpacing: 10.0,
    //           mainAxisExtent: 150.0),
    //       itemBuilder: (BuildContext context, int index) {
    //         return Container(
    //           width: Get.width * 0.4,
    //           decoration: BoxDecoration(
    //               color: Color(AppColor.orange),
    //               borderRadius: BorderRadius.circular(15)),
    //           child: Center(child: Text("${index}")),
    //         );
    //       },
    //     ));
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>StoryView<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget Story() {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.only(bottom: Get.height * 0.09),
      crossAxisCount: 2,
      itemCount: item2.length,
      padding: EdgeInsets.only(bottom: Get.height * 0.1),
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Bounce(
          duration: Duration(milliseconds: 200),
          onPressed: () {
            Get.to(EditBottomNavBar());
          },
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Image.asset(item2[index])),
        ),
      ),
      staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
    );

    // GridView.custom(
    //   padding: EdgeInsets.all(15),
    //   shrinkWrap: true,
    //   physics: const BouncingScrollPhysics(),
    //   // gridDelegate: SliverQuiltedGridDelegate(
    //   //   crossAxisCount: 2,
    //   //   mainAxisSpacing: 10,
    //   //   crossAxisSpacing: 10,
    //   //   repeatPattern: QuiltedGridRepeatPattern.inverted,
    //   //   pattern: const [
    //   //     QuiltedGridTile(1, 1),
    //   //     // QuiltedGridTile(2, 1),
    //   //     // QuiltedGridTile(1, 2),
    //   //     // QuiltedGridTile(1, 1),
    //   //     // QuiltedGridTile(1, 1),
    //   //     // QuiltedGridTile(1, 2),
    //   //   ],
    //   // ),
    //   childrenDelegate: SliverChildBuilderDelegate(
    //     (context, index) {
    //       var currentObj = item2[index];
    //       return Container(
    //         decoration: BoxDecoration(
    //             // boxShadow: [
    //             //   BoxShadow(
    //             //       blurRadius: 5,
    //             //       color: isdarkMode.value
    //             //           ? Colors.transparent
    //             //           : Color(AppColor.grey))
    //             // ],
    //             image: DecorationImage(
    //                 image: AssetImage(currentObj), fit: BoxFit.fill),
    //             // borderRadius: BorderRadius.circular(15),
    //             color: Color(AppColor.yellow).withOpacity(0.8)),
    //       );
    //     },
    //     childCount: item.length,
    //   ),
    // );

    // Container(
    //     margin: EdgeInsets.all(15),
    //     height: Get.height,
    //     width: Get.width,
    //     // color: Color(AppColor.orange).withOpacity(0.1),
    //     child: GridView.builder(
    //       physics: BouncingScrollPhysics(),
    //       itemCount: 25,
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           crossAxisSpacing: 16.0,
    //           mainAxisSpacing: 16.0,
    //           mainAxisExtent: 200.0),
    //       itemBuilder: (BuildContext context, int index) {
    //         return Container(
    //           width: Get.width * 0.4,
    //           decoration: BoxDecoration(
    //               color: Colors.red.withOpacity(0.4),
    //               borderRadius: BorderRadius.circular(15)),
    //           child: Center(child: Text("${index}")),
    //         );
    //       },
    //     ));
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>TabButton<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //

  Widget tabButton({Widget page, currentInd, selectedind, String textName}) {
    return Obx(
      () => Container(
        width: Get.width * 0.25,
        // padding: EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.transparent),
        child: Center(
          child: Text(
            textName,
            style: GoogleFonts.fredoka(
              fontSize: Get.width * 0.022,
              color: currentIndex.value == currentInd
                  ? Color(AppColor.white)
                  : Color(0xFFC3A1B5),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Indicator<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget indicator({index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: CircleAvatar(
        radius: (index != posterIndex) ? 3 : 4,
        backgroundColor: (index != posterIndex)
            ? Color(AppColor.grey)
            : Color(AppColor.orange),
      ),
    );

    // SmoothPageIndicator(
    //   controller: controller,
    //   count: banner.length,
    //   effect: ScrollingDotsEffect(
    //     activeStrokeWidth: 2.6,
    //     activeDotScale: 1.3,
    //     activeDotColor: Color(AppColor.yellow),
    //     dotColor: Color(AppColor.grey),
    //     dotHeight: 7,
    //     dotWidth: 7,
    //     // type: WormType.thin,
    //     // strokeWidth: 5,
    //   ),
    // );
  }

//>>>>>>>>>>>>>>>>>>>>>>> BannerView <<<<<<<<<<<<<<<<<<<<<<<<
  Widget bannerView() {
    return CarouselSlider.builder(
      itemCount: posterImage.length,
      options: CarouselOptions(
          aspectRatio: 3.0,
          autoPlay: true,
          onPageChanged: (i, _) {
            setState(() {
              posterIndex = i;
            });
          }),
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(posterImage[itemIndex]), fit: BoxFit.fill)),
      ),
    );
  }

// TABBARVIEW
  tabBarView() {
    return TabBar(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return Colors.transparent;
          },
        ),
        indicatorWeight: 1,
        labelColor: Color(AppColor.white),
        unselectedLabelColor: Theme.of(context).cardColor,
        labelStyle: GoogleFonts.fredoka(
          fontSize: Get.width * 0.03,
          fontWeight: FontWeight.w600,
        ),
        indicatorPadding:
            EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(8), //
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(AppColor.orange), Color(AppColor.red)]),
        ),
        // indicatorColor: Colors.white,
        controller: _tabController,
        onTap: (val) {
          currentIndex.value = val;
        },
        tabs: [
          Tab(
            text: "NEW",
          ),
          Tab(
            text: "BANNER",
          ),
          Tab(
            text: "POST",
          ),
          Tab(
            text: "STORY",
          ),
        ]);
  }

  Widget tab({item}) {
    return SizedBox(
      // margin: EdgeInsets.all(5),
      height: 30,
      width: Get.width * 0.25,
      child: item,
    );
  }
}
