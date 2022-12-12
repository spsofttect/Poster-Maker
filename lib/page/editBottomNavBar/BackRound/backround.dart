// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, missing_required_param, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/commanwidget.dart';
import 'package:poster_maker/Helper/utlity.dart';

class BackRoundPage extends StatefulWidget {
  const BackRoundPage({Key key}) : super(key: key);

  @override
  State<BackRoundPage> createState() => _BackRoundPageState();
}

class _BackRoundPageState extends State<BackRoundPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);

    // _tabController.addListener(_setActiveTabIndex);
  }

  // void _setActiveTabIndex() {
  //   setState(() {
  //     tabIndex = _tabController.index;
  //     print('\x1B[33m$tabIndex\x1B[0m');
  //   });
  // }

  @override
  Widget build(BuildContext context) {



      _tabController.addListener(() {
      // if (_tabController.indexIsChanging) {
        setState(() {
          tabIndex = _tabController.index;
        });

    });

    return SafeArea(
        child: Column(
      children: [
        editAppBar(context: context, name: 'BackRound'),
        // listView(),
        tab(),
        // gridView(),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            grid(),
            grid(),
            grid(),
            grid(),
            grid(),
            grid(),
            grid(),
          ]),
        )
      ],
    ));
  }

  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>TabButton<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  var currentIndex = 0;

  selectedIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget gridView() {
    return Expanded(
      child: GridView.custom(
        padding: EdgeInsets.all(15),
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        // gridDelegate: SliverQuiltedGridDelegate(
        //   crossAxisCount: 4,
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        //   repeatPattern: QuiltedGridRepeatPattern.inverted,
        //   pattern: const [
        //     QuiltedGridTile(1, 1),
        //     QuiltedGridTile(1, 1),

        //     // QuiltedGridTile(2, 1),
        //     // QuiltedGridTile(1, 2),
        //     // QuiltedGridTile(1, 1),
        //     // QuiltedGridTile(1, 1),
        //     // QuiltedGridTile(1, 2),
        //   ],
        // ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            // var currentObj = item2[index];
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                  //   BoxShadow(
                  //       blurRadius: 5,
                  //       color: isdarkMode.value
                  //           ? Colors.transparent
                  //           : Color(AppColor.grey))
                  // ],
                  // image: DecorationImage(
                  //     image: AssetImage(currentObj), fit: BoxFit.fill),
                  // borderRadius: BorderRadius.circular(15),
                  color: Color(AppColor.grey).withOpacity(0.2)),
            );
          },
          childCount: 99,
        ),
      ),
    );
  }

  Widget tab() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      labelColor: Color(AppColor.orange),
      unselectedLabelColor: Color(AppColor.shadow),
      indicatorColor: Color(AppColor.orange),
      tabs: [
        Tab(child: tabContainer(index: 0)),
        Tab(child: tabContainer(index: 1)),
        Tab(child: tabContainer(index: 2)),
        Tab(child: tabContainer(index: 3)),
        Tab(child: tabContainer(index: 4)),
        Tab(child: tabContainer(index: 5)),
        Tab(child: tabContainer(index: 6)),
      ],
    );
  }

  Widget tabButton(
      {currentInd, selectedind, String textName, EdgeInsets margin}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            selectedIndex(selectedind);
          },
          child: Container(
            margin: margin,
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: currentIndex == currentInd
                    ? Color(AppColor.orange)
                    : Color(AppColor.orange).withOpacity(0.2)),
            child: Center(
              child: Text(
                textName,
                style: TextStyle(
                    fontSize: 12,
                    color: currentIndex == currentInd
                        ? Color(AppColor.white)
                        : Color(AppColor.shadow),
                    fontFamily: AppFont.Medium),
              ),
            ),
          ),
        ),
      ],
    );
  }
  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>ListView<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //

  Widget listView({itemCount}) {
    return SizedBox(
        height: 40,
        width: double.infinity,
        child: ListView.builder(
             physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: backroundName.length,
            itemBuilder: (context, index) {
              var currentObj = backroundName[index];
              return GestureDetector(
                  onTap: () {
                    selectedIndex(index);
                  },
                  child: GestureDetector(
                    onTap: () {
                      selectedIndex(index);
                    },
                    child: tabButton(
                      margin: EdgeInsets.only(
                          left: index == 0 ? 15 : 5,
                          right: index == backroundName.length - 1 ? 15 : 5),
                      selectedind: index,
                      currentInd: index,
                      textName: currentObj,
                    ),
                  ));
            }));
  }

  List backroundName = [
    'PICK YOUR OWN',
    'COLOR',
    'GREDIANT',
    'PIXABAY',
    'FEMALE MODEL',
    'MALE MODEL',
    'LOGOS',
  ];

  Widget tabContainer({index}) {
    return Text(
      backroundName[index],
      style: TextStyle(
          fontSize: Get.height * 0.015, fontFamily: AppFont.Medium,),
    );
  }

  Widget grid() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 8, crossAxisSpacing: 8),
          itemCount: 99,
          itemBuilder: (_, i) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(AppColor.grey).withOpacity(0.2)),
            );
          }),
    );
  }
}
