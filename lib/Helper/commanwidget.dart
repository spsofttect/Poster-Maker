// ignore_for_file: prefer_const_constructors, unused_local_variable, unused_import, missing_required_param, must_be_immutable

import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poster_maker/Helper/commanlist/list.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:shimmer/shimmer.dart';

TextEditingController phoneController = TextEditingController();

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>editAppBar<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
editAppBar({BuildContext? context, String? name}) {
  return
      // ignore: prefer_const_literals_to_create_immutables
      Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context!);
          },
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Image.asset(
              '${AssetPath.language}back.png',
              height: 25,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          name!,
          style: GoogleFonts.fredoka(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ],
    ),
  );
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>ListView<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //

Widget listView({itemCount, listindex, item}) {
  return Container(
      margin: const EdgeInsets.only(top: 15),
      width: double.infinity,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            var currentObj = listindex[index];
            return item;
          }));
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>> TabBarView SelectedItem <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //

Widget selectedItem({ontap, color, tabName}) {
  return GestureDetector(
    onTap: ontap,
    child: SizedBox(
      height: Get.height * 0.07,
      width: Get.width / 3,
      child: Column(children: [
        SizedBox(height: 5),
        Center(
            child: Text(
          tabName,
          style: GoogleFonts.fredoka(color: color ? Color(AppColor.orange) : Color(AppColor.white), fontWeight: FontWeight.w400, fontSize: 15),
        )),
        SizedBox(height: 5),
        Divider(thickness: 3, color: color ? Color(AppColor.orange) : Colors.transparent)
      ]),
    ),
  );
}

Widget gridView({itemCount, arr, item}) {
  return StaggeredGridView.countBuilder(
    crossAxisCount: 2,
    padding: EdgeInsets.only(bottom: Get.height * 0.1),
    itemCount: 99,
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) => Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(arr[index]), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10),
          color: Color(AppColor.grey).withOpacity(0.2)),
    ),
    staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
  );
}

Widget fastUpArrow() {
  return RotationTransition(
      turns: AlwaysStoppedAnimation(180 / 360),
      child: Image.asset(
        "${AssetPath.refer}fastdown.png",
        height: 20,
      ));
}

Widget fastDownArrow() {
  return Image.asset(
    "${AssetPath.refer}fastdown.png",
    height: 20,
  );
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>> category ListView <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //

Widget customListView({double? height, double? width, itemCount, listindex, boxfit, onTap, scrollDirection, indexColor}) {
  return Container(
      margin: EdgeInsets.only(top: 15),
      height: height,
      width: double.infinity,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: scrollDirection,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            var currentObj = listindex[index];
            return GestureDetector(
              onTap: onTap,
              child: Container(
                margin: EdgeInsets.only(left: index == 0 ? 15 : 5, right: index == itemCount - 1 ? 15 : 5),
                padding: EdgeInsets.only(top: 7, left: 7, right: 7),
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 2, color: Color(AppColor.orange).withOpacity(0.5)),
                ),
                child: Column(
                  children: [
                    Container(
                      height: height! - 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(currentObj), fit: boxfit),
                          borderRadius: BorderRadius.circular(15),
                          color: Color(AppColor.grey)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        height: 20,
                        // color: Colors.amber,
                        child: Center(
                            child: Text(
                          "Index $index",
                          style: GoogleFonts.fredoka(fontSize: 20, color: indexColor),
                        ))),
                  ],
                ),
              ),
            );
          }));
}

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>titleRow<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
Widget title({title, onTap, context}) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.fredoka(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Theme.of(context).textTheme.headline1!.color,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'View all',
            style: GoogleFonts.fredoka(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Theme.of(context).textTheme.headline1!.color,
            ),
          ),
        ),
      ],
    ),
  );
}

// Text frame page
text({String? text, double? fontSize, color, maxLine, textAlign}) {
  return Text(
    text!,
    style: GoogleFonts.fredoka(fontSize: fontSize, color: color),
    textAlign: textAlign,
    overflow: TextOverflow.ellipsis,
    maxLines: maxLine,
  );
}

// icon frame page
icon({icon, color}) {
  return Icon(
    icon,
    size: Get.width * 0.030,
    color: color,
  );
}

Widget shimmerImage({required double ratio, required BuildContext context}) {
  return Shimmer.fromColors(
      baseColor: Theme.of(context).splashColor,
      highlightColor: (Get.isDarkMode) ? Colors.white54 : Colors.grey.shade300,
      child: AspectRatio(
          aspectRatio: ratio,
          child: Container(
            color: Colors.red,
          )));
}

class DynamicVideoPlayer extends StatefulWidget {
  DynamicVideoPlayer({Key? key, this.url, this.index}) : super(key: key);
  String? url;
  int? index;
  @override
  State<DynamicVideoPlayer> createState() => _DynamicVideoPlayerState();
}

class _DynamicVideoPlayerState extends State<DynamicVideoPlayer> {
  CachedVideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
    controller = CachedVideoPlayerController.network(widget.url!);
    controller!.initialize().then((value) {
      controller!.setLooping(true);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return controller!.value.isInitialized
        ? AspectRatio(
            aspectRatio: controller!.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CachedVideoPlayer(controller!),
                GestureDetector(
                    onTap: () {
                      (controller!.value.isPlaying) ? controller!.pause() : controller!.play();
                      setState(() {});
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(AppColor.orange), Color(AppColor.yellow)]),
                            color: Color(AppColor.orange),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20))),
                        child: Icon(
                          (!controller!.value.isPlaying) ? Icons.play_arrow : Icons.pause,
                          color: Colors.white,
                        ))),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(8)),
                      child: Icon(
                        Icons.favorite,
                        color: (!homePageNewData[widget.index!].isLike!) ? Colors.white : Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ))
        : const SizedBox();
  }
}
