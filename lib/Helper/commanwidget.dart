// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/commanlist/list.dart';
import 'package:poster_maker/Helper/utlity.dart';

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>editAppBar<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
editAppBar({BuildContext context, String name}) {
  return
      // ignore: prefer_const_literals_to_create_immutables
      Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
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
          name,
          style: TextStyle(fontFamily: AppFont.Medium, fontSize: 20),
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
          style: TextStyle(color: color ? Color(AppColor.orange) : Color(AppColor.white), fontFamily: AppFont.Medium, fontSize: 15),
        )),
        SizedBox(height: 5),
        Divider(thickness: 3, color: color ? Color(AppColor.orange) : Colors.transparent)
      ]),
    ),
  );
}

Widget gridView({itemCount, arr, item}) {
  return GridView.custom(
    padding: EdgeInsets.all(15),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    // gridDelegate: SliverQuiltedGridDelegate(
    //   crossAxisCount: 4,
    //   mainAxisSpacing: 10,
    //   crossAxisSpacing: 10,
    //   repeatPattern: QuiltedGridRepeatPattern.inverted,
    //   pattern: const [
    //     QuiltedGridTile(1, 1),
    //     QuiltedGridTile(1, 1),
    //   ],
    // ),
    childrenDelegate: SliverChildBuilderDelegate(
      (context, index) {
        return Container(
          decoration: BoxDecoration(
              // image: DecorationImage(
              //     image: NetworkImage(arr[index]), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
              color: Color(AppColor.grey).withOpacity(0.2)),
        );
      },
      childCount: 99,
    ),
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

Widget customListView({double height, double width, itemCount, listindex, boxfit, onTap, scrollDirection}) {
  return Container(
      margin: EdgeInsets.only(top: 15),
      height: height,
      width: double.infinity,
      child: ListView.builder(
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
                      height: height - 40,
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
                        child: Center(child: Text("Index $index"))),
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
          style: TextStyle(
            fontFamily: AppFont.SemiBold,
            fontSize: 18,
            color: Theme.of(context).textTheme.headline1.color,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'View all',
            style: TextStyle(
              fontFamily: AppFont.Medium,
              fontSize: 15,
              color: Theme.of(context).textTheme.headline1.color,
            ),
          ),
        ),
      ],
    ),
  );
}

// Text frame page
text({String text, double fontSize, color, maxLine, textAlign}) {
  return Text(
    text,
    style: TextStyle(fontSize: fontSize, color: color),
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

class DynamicVideoPlayer extends StatefulWidget {
  DynamicVideoPlayer({Key key, this.url, this.index}) : super(key: key);
  String url;
  int index;
  @override
  State<DynamicVideoPlayer> createState() => _DynamicVideoPlayerState();
}

class _DynamicVideoPlayerState extends State<DynamicVideoPlayer> {
  CachedVideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = CachedVideoPlayerController.network(widget.url);
    controller.initialize().then((value) {
      controller.setLooping(true);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CachedVideoPlayer(controller),
                GestureDetector(
                    onTap: () {
                      (controller.value.isPlaying) ? controller.pause() : controller.play();
                      setState(() {});
                    },
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: const [Color(0xFFFA7F08), Color(0xFFF24405)]),
                            color: Color(AppColor.orange),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20))),
                        child: Icon(
                          (!controller.value.isPlaying) ? Icons.play_arrow : Icons.pause,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ))),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      item3[widget.index].isLike = !item3[widget.index].isLike;

                      if (item3[widget.index].isLike) {
                        favourit.add(item3[widget.index]);
                      } else {
                        favourit.remove(item3[widget.index]);
                      }
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(8)),
                      child: Icon(
                        Icons.favorite,
                        color: (!item3[widget.index].isLike) ? Colors.white : Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ))
        : const SizedBox();
  }
}
