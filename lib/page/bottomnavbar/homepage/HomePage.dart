// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, non_constant_identifier_names, unused_import, file_names

import 'dart:async';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:poster_maker/page/bottomnavbar/homepage/home_page_controller.dart';
import 'package:poster_maker/page/editBottomNavBar/EditBottomNavbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shimmer/shimmer.dart';
import '../../../Helper/commanwidget.dart';
import '../appbar/Appbar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int posterIndex = 0;
  TabController _tabController;
  Future<List> allHomePageNewData;
  Future<List> allHomePageBannerData;
  Future<List> allHomePagePostData;
  Future<List> allHomePageStoryData;
  Future<List> allHomePageSBannerList;

  @override
  void initState() {
    super.initState();
    tabListener();
    isScrollOrNotificationListener();
    callHomePageApi();
  }

  void tabListener() {
    _tabController = TabController(
      length: 4,
      vsync: this,
      animationDuration: Duration(microseconds: 1),
    );
    _tabController!.addListener(() {
      currentIndex.value = _tabController!.index;
    });
  }

  void isScrollOrNotificationListener() {
    isScroll.value = false;
    homePageController.addListener(() {
      if (homePageController.position.pixels > Get.height * 0.1) {
        isScroll.value = true;
      } else {
        isScroll.value = false;
      }
    });
  }

  void callHomePageApi() {
    allHomePageNewData = HomePageAPIHelper.homePageAPIHelper.fetchHomePageNewData();
    allHomePageBannerData = HomePageAPIHelper.homePageAPIHelper.fetchHomePageBannerData();
    allHomePagePostData = HomePageAPIHelper.homePageAPIHelper.fetchHomePagePostData();
    allHomePageStoryData = HomePageAPIHelper.homePageAPIHelper.fetchHomePageStoryData();
    allHomePageSBannerList = HomePageAPIHelper.homePageAPIHelper.fetchHomePageBannerList();
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
    return FutureBuilder(
      future: allHomePageNewData,
      builder: (BuildContext context, AsyncSnapshot snapShot) {
        if (snapShot.hasData) {
          List myNewData = snapShot.data;
          return StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            padding: EdgeInsets.only(bottom: Get.height * 0.1),
            itemCount: myNewData.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                duration: Duration(milliseconds: 200),
                onPressed: () {
                  Get.to()
                  Get.to(EditBottomNavBar());
                },
                child: Card(
                  shadowColor: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          CachedNetworkImage(
                            imageUrl: myNewData[index]['image'],
                            placeholder: (context, url) => shimmerImage(
                              context: context,
                              ratio: (myNewData[index]['type'] == "Banner")
                                  ? 1.78
                                  : (myNewData[index]['type'] == "Post")
                                      ? 1
                                      : 0.56,
                            ),
                            errorWidget: (context, url, error) => shimmerImage(
                              context: context,
                              ratio: (myNewData[index]['type'] == "Banner")
                                  ? 1.78
                                  : (myNewData[index]['type'] == "Post")
                                      ? 1
                                      : 0.56,
                            ),
                          ),
                          Image.network(myNewData[index]['image']),
                          InkWell(
                            onTap: () {
                              homePageNewData[index].isLike = !homePageNewData[index].isLike;
                              setState(() {});
                              if (homePageNewData[index].isLike) {
                                favourit.add(homePageNewData[index]);
                              } else {
                                favourit.remove(homePageNewData[index]);
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(8)),
                              child: Icon(
                                Icons.favorite,
                                color: (!homePageNewData[index].isLike) ? Colors.white : Colors.red,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Theme.of(context).splashColor,
            highlightColor: (Get.isDarkMode) ? Colors.white54 : Colors.grey.shade300,
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              padding: EdgeInsets.only(bottom: Get.height * 0.1),
              itemCount: newShimmerRatio.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: AspectRatio(
                        aspectRatio: (newShimmerRatio[index]).toDouble(),
                        child: Container(
                          color: Colors.red,
                        )),
                  ),
                );
              },
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            ),
          );
        }
      },
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>BannerView<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget Banner() {
    return FutureBuilder(
      future: allHomePageBannerData,
      builder: (BuildContext context, AsyncSnapshot snapShot) {
        if (snapShot.hasData) {
          List myBannerData = snapShot.data;
          return StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            padding: EdgeInsets.only(bottom: Get.height * 0.1),
            itemCount: myBannerData.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                duration: Duration(milliseconds: 200),
                onPressed: () {
                  Get.to(EditBottomNavBar());
                },
                child: Card(
                  shadowColor: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          CachedNetworkImage(
                            imageUrl: myBannerData[index]['image'],
                            placeholder: (context, url) => shimmerImage(
                              context: context,
                              ratio: 1.78,
                            ),
                            errorWidget: (context, url, error) => shimmerImage(
                              context: context,
                              ratio: 1.78,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              homePageNewData[index].isLike = !homePageNewData[index].isLike;
                              setState(() {});
                              if (homePageNewData[index].isLike) {
                                favourit.add(homePageNewData[index]);
                              } else {
                                favourit.remove(homePageNewData[index]);
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(8)),
                              child: Icon(
                                Icons.favorite,
                                color: (!homePageNewData[index].isLike) ? Colors.white : Colors.red,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Theme.of(context).splashColor,
            highlightColor: (Get.isDarkMode) ? Colors.white54 : Colors.grey.shade300,
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              padding: EdgeInsets.only(bottom: Get.height * 0.1),
              itemCount: 20,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: AspectRatio(
                        aspectRatio: 1.78,
                        child: Container(
                          color: Colors.red,
                        )),
                  ),
                );
              },
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            ),
          );
        }
      },
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Postview<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget Post() {
    return FutureBuilder(
      future: allHomePagePostData,
      builder: (BuildContext context, AsyncSnapshot snapShot) {
        if (snapShot.hasData) {
          List myPostData = snapShot.data;
          return StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            padding: EdgeInsets.only(bottom: Get.height * 0.1),
            itemCount: myPostData.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                duration: Duration(milliseconds: 200),
                onPressed: () {
                  Get.to(EditBottomNavBar());
                },
                child: Card(
                  shadowColor: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          CachedNetworkImage(
                            imageUrl: myPostData[index]['image'],
                            placeholder: (context, url) => shimmerImage(
                              context: context,
                              ratio: 1,
                            ),
                            errorWidget: (context, url, error) => shimmerImage(
                              context: context,
                              ratio: 1,
                            ),
                          ),
                          Image.network(myPostData[index]['image']),
                          InkWell(
                            onTap: () {
                              homePageNewData[index].isLike = !homePageNewData[index].isLike;
                              setState(() {});
                              if (homePageNewData[index].isLike) {
                                favourit.add(homePageNewData[index]);
                              } else {
                                favourit.remove(homePageNewData[index]);
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(8)),
                              child: Icon(
                                Icons.favorite,
                                color: (!homePageNewData[index].isLike) ? Colors.white : Colors.red,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Theme.of(context).splashColor,
            highlightColor: (Get.isDarkMode) ? Colors.white54 : Colors.grey.shade300,
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              padding: EdgeInsets.only(bottom: Get.height * 0.1),
              itemCount: 10,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                Random r;
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          color: Colors.red,
                        )),
                  ),
                );
              },
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            ),
          );
        }
      },
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
    return FutureBuilder(
      future: allHomePageStoryData,
      builder: (BuildContext context, AsyncSnapshot snapShot) {
        if (snapShot.hasData) {
          List myStoryData = snapShot.data;
          return StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            padding: EdgeInsets.only(bottom: Get.height * 0.1),
            itemCount: myStoryData.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                duration: Duration(milliseconds: 200),
                onPressed: () {
                  Get.to(EditBottomNavBar());
                },
                child: Card(
                  shadowColor: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          CachedNetworkImage(
                            imageUrl: myStoryData[index]['image'],
                            placeholder: (context, url) => shimmerImage(
                              context: context,
                              ratio: 0.56,
                            ),
                            errorWidget: (context, url, error) => shimmerImage(
                              context: context,
                              ratio: 0.56,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              homePageNewData[index].isLike = !homePageNewData[index].isLike;
                              setState(() {});
                              if (homePageNewData[index].isLike) {
                                favourit.add(homePageNewData[index]);
                              } else {
                                favourit.remove(homePageNewData[index]);
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(8)),
                              child: Icon(
                                Icons.favorite,
                                color: (!homePageNewData[index].isLike) ? Colors.white : Colors.red,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Theme.of(context).splashColor,
            highlightColor: (Get.isDarkMode) ? Colors.white54 : Colors.grey.shade300,
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              padding: EdgeInsets.only(bottom: Get.height * 0.1),
              itemCount: 5,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: AspectRatio(
                        aspectRatio: 0.56,
                        child: Container(
                          color: Colors.red,
                        )),
                  ),
                );
              },
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            ),
          );
        }
      },
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

  Widget tabButton({Widget? page, currentInd, selectedind, String? textName}) {
    return Obx(
      () => Container(
        width: Get.width * 0.25,
        // padding: EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.transparent),
        child: Center(
          child: Text(
            textName!,
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
    return FutureBuilder(
      future: allHomePageSBannerList,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List myBannerData = snapshot.data;
          return CarouselSlider.builder(
            itemCount: myBannerData.length,
            options: CarouselOptions(
                aspectRatio: 3.0,
                autoPlay: true,
                onPageChanged: (i, _) {
                  setState(() {
                    posterIndex = i;
                  });
                }),
            itemBuilder: (BuildContext context, int index, int pageViewIndex) => Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: double.infinity,
              width: double.infinity,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: myBannerData[index]['image'],
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Theme.of(context).splashColor,
                  highlightColor: (Get.isDarkMode) ? Colors.white54 : Colors.grey.shade300,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                errorWidget: (context, url, error) => Shimmer.fromColors(
                  baseColor: Theme.of(context).splashColor,
                  highlightColor: (Get.isDarkMode) ? Colors.white54 : Colors.grey.shade300,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          );
        } else {
          return Shimmer.fromColors(
              baseColor: Theme.of(context).splashColor,
              highlightColor: (Get.isDarkMode) ? Colors.white54 : Colors.grey.shade300,
              child: CarouselSlider.builder(
                itemCount: 5,
                options: CarouselOptions(aspectRatio: 3.0, autoPlay: true, onPageChanged: (i, _) {}),
                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.red,
                ),
              ));
        }
      },
    );
  }

// TabbarView
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
              colors: [Color(AppColor.orange), Color(AppColor.yellow)]),
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
