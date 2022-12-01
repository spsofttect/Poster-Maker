// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, invalid_use_of_protected_member, library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/commanlist/list.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';
import 'package:poster_maker/page/bottomnavbar/bottomnavbar.dart';

import '../../../Helper/commanwidget.dart';
import '../../editBottomNavBar/EditBottomNavbar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

GlobalKey<_FavoriteScreenState> textGlobalKey =
    GlobalKey<_FavoriteScreenState>();

class _FavoriteScreenState extends State<FavoriteScreen> {
  // CountryController controller = Get.put(CountryController());

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   appBar: appbar(),
        //   key: textGlobalKey,
        //   body: SingleChildScrollView(
        //     child: Column(
        //       children: [
        SafeArea(
      child: Column(
        children: [
          commanAppbar(
              ontap: () {
                Get.offAll(BottomNavBarScreen());
              },
              pageName: 'Favorite',textColor: Theme.of(context).textTheme.headline1.color,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: (favourit.isEmpty)?Center(child: Text("No Data"),):StaggeredGridView.countBuilder(
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
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.circular(8)),
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
          )

          // GridView.custom(
          //   padding: EdgeInsets.all(15),
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   // gridDelegate: SliverQuiltedGridDelegate(
          //   //   crossAxisCount: 4,
          //   //   mainAxisSpacing: 10,
          //   //   crossAxisSpacing: 10,
          //   //   repeatPattern: QuiltedGridRepeatPattern.inverted,
          //   //   pattern: const [
          //   //     QuiltedGridTile(2, 2),
          //   //     QuiltedGridTile(1, 2),
          //   //     QuiltedGridTile(2, 2),
          //   //     QuiltedGridTile(1, 2),
          //   //     QuiltedGridTile(2, 2),
          //   //     QuiltedGridTile(1, 2),
          //   //     QuiltedGridTile(1, 2),
          //   //   ],
          //   // ),
          //   childrenDelegate: SliverChildBuilderDelegate(
          //     (context, index) {
          //       var currentObj = favourit[index];
          //       return Stack(
          //         children: [
          //           Container(
          //             decoration: BoxDecoration(
          //                 image: DecorationImage(
          //                     image: AssetImage(currentObj), fit: BoxFit.fill),
          //                 borderRadius: BorderRadius.circular(15),
          //                 color: Color(AppColor.grey)),
          //             // child: Center(
          //             //   child: Text("$index"),
          //             // ),
          //           ),
          //           Align(
          //             alignment: Alignment.topRight,
          //             child: GestureDetector(
          //               onTap: () {},
          //               child: Container(
          //                 margin: EdgeInsets.only(right: 10, top: 10),
          //                 height: 30,
          //                 width: 30,
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(8),
          //                   color: Colors.black38,
          //                 ),
          //                 child: Center(
          //                   child: Icon(
          //                     Icons.favorite,
          //                     size: 20,
          //                     color: Color(AppColor.orange),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           )
          //         ],
          //       );
          //     },
          //     childCount: favourit.length,
          //   ),
          // ),
        ],
      ),
    );
    // GetBuilder<CountryController>(
    //   builder: (controller) {
    //     return GridView.builder(
    //         padding: EdgeInsets.only(
    //             right: 15, left: 15, top: 15, bottom: 15),
    //         itemCount: controller.favouriteNewslist.value.length,
    //         shrinkWrap: true,
    //         physics: NeverScrollableScrollPhysics(),
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           mainAxisSpacing: 15,
    //           crossAxisSpacing: 15,
    //         ),
    //         itemBuilder: (_, ind) {
    //           var curruntObject =
    //               controller.favouriteNewslist.value[ind];
    //               return Container();
    //           // return NewsCard(
    //           //   newslist: curruntObject,
    //           //   selctedcountryIndex: curruntObject.countryId!,
    //           //   mainindex: curruntObject.newsId!,
    //           //   notifyParent: refresh,
    //           // );
    //         });
    //   },
    // ),
    //       ],
    //     ),
    //   ),
    // );
  }

  refresh() {
    setState(() {});
  }
}
