import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Helper/commanlist/list.dart';
import '../../../Helper/commanwidget.dart';
import '../../../Helper/get_global/get_global_function.dart';
import 'multiple_json_controller.dart';

class MultipleJson extends StatefulWidget {
  const MultipleJson({Key? key, required this.homePageImage}) : super(key: key);

  final Map homePageImage;
  @override
  State<MultipleJson> createState() => _MultipleJsonState();
}

class _MultipleJsonState extends State<MultipleJson> {
  late Future<List> allMultipleJsonData;
  @override
  void initState() {
    super.initState();
    animatePageEffectOver();
    callApi();
  }

  void callApi() {
    allMultipleJsonData = MultipleJsonPageAPIHelper.multipleJsonPageAPIHelper.fetchMultipleJsonData(posterId: widget.homePageImage['poster_id']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), body: (isAnimatedPage.value) ? Center(child: heroWidgetAnimatePage(img: widget.homePageImage['image'])) : multipleJsonSize());
  }

  Widget multipleJsonSize() {
    return FutureBuilder(
      future: allMultipleJsonData,
      builder: (BuildContext context, AsyncSnapshot snapShot) {
        if (snapShot.hasData) {
          List myMultipleJsonData = snapShot.data[0]['poster_json'];
          return StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            padding: EdgeInsets.only(bottom: Get.height * 0.1),
            itemCount: myMultipleJsonData.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Bounce(
                duration: const Duration(milliseconds: 200),
                onPressed: () {
                  isAnimatedPage.value = true;
                  Navigator.of(context).push(
                    PageRouteBuilder(
                        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                          return AnimatedBuilder(
                              animation: animation,
                              builder: (BuildContext context, Widget? child) {
                                return Opacity(
                                  opacity: animation.value,
                                  child: MultipleJson(
                                    homePageImage: myMultipleJsonData[index],
                                  ),
                                );
                              });
                        },
                        transitionDuration: const Duration(milliseconds: 600)),
                  );
                  // Get.to(MultipleJson(
                  //   homePageImage: myNewData[index],
                  // ));
                  // Get.to(EditBottomNavBar());
                },
                child: Hero(
                  tag: "${myMultipleJsonData[index]['image']}",
                  child: Card(
                    color: Colors.transparent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        child: CachedNetworkImage(
                          imageUrl: myMultipleJsonData[index]['image'],
                          placeholder: (context, url) => shimmerImage(
                            context: context,
                            ratio:
                                // (myMultipleJsonData[index]['type'] == "Banner")
                                //     ? 1.78
                                //     : (myNewData[index]['type'] == "Post")
                                //         ? 1
                                //         :
                                0.56,
                          ),
                          errorWidget: (context, url, error) => shimmerImage(
                            context: context,
                            ratio:
                                // (myNewData[index]['type'] == "Banner")
                                //     ? 1.78
                                //     : (myNewData[index]['type'] == "Post")
                                //         ? 1
                                //         :
                                0.56,
                          ),
                        )),
                  ),
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
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
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
}
