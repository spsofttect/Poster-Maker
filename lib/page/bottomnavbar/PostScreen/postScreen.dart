// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/commanlist/list.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';
import 'package:poster_maker/page/bottomnavbar/bottomnavbar.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        commanAppbar(
            ontap: () {
              Get.offAll(BottomNavBarScreen());
            },
            pageName: 'My Post'),
        GridView.custom(
          padding: EdgeInsets.all(15),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          // gridDelegate: SliverQuiltedGridDelegate(
          //   crossAxisCount: 4,
          //   mainAxisSpacing: 10,
          //   crossAxisSpacing: 10,
          //   repeatPattern: QuiltedGridRepeatPattern.inverted,
          //   pattern: const [
          //     QuiltedGridTile(1, 2),
          //     QuiltedGridTile(2, 2),
          //     QuiltedGridTile(2, 2),
          //     QuiltedGridTile(1, 2),
          //     QuiltedGridTile(2, 2),
          //     QuiltedGridTile(1, 2),
          //     QuiltedGridTile(2, 2),
          //     QuiltedGridTile(1, 2),
          //   ],
          // ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              var currentObj = favourit.reversed.toList()[index];
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(currentObj), fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(15),
                        color: Color(AppColor.grey)),
                    // child: Center(
                    //   child: Text("$index"),
                    // ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(right: 10, top: 10),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black38,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.favorite,
                            size: 20,
                            color: Color(AppColor.orange),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
            childCount: favourit.length,
          ),
        ),
      ],
    );
  }
}
