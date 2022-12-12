// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/commanlist/list.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import '../../../Helper/commanwidget.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';
import 'package:poster_maker/page/bottomnavbar/bottomnavbar.dart';

import '../../editBottomNavBar/EditBottomNavbar.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    isScroll.value = false;
    myPostPageController.addListener(() {
      if (myPostPageController.position.pixels > Get.height * 0.1) {
        isScroll.value = true;
      } else {
        isScroll.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          commanAppbar(
              ontap: () {
                Get.offAll(BottomNavBarScreen());
              },
              pageName: 'My Post'),
          Expanded(
            child: StaggeredGridView.countBuilder(
              controller: myPostPageController,
              crossAxisCount: 2,
              itemCount: favourit.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: Bounce(
                  duration: Duration(milliseconds: 200),
                  onPressed: () {
                    Get.to(EditBottomNavBar());
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: (favourit[index].isVideo)
                          ? DynamicVideoPlayer(
                              url: favourit[index].url,
                              index: index,
                            )
                          : Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Image.asset(favourit[index].url),
                                InkWell(
                                  onTap: () {
                                    favourit.remove(favourit[index]);
                                    // setState(() {});
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(8)),
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                ),
              ),
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            ),
          ),
        ],
      ),
    );
  }
}
