// ignore_for_file: unnecessary_import, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:poster_maker/Helper/utlity.dart';

import '../bottomnavbar/appbar/Appbar.dart';

class FreeLanceView extends StatefulWidget {
  const FreeLanceView({Key key}) : super(key: key);

  @override
  State<FreeLanceView> createState() => _FreeLanceViewState();
}

class _FreeLanceViewState extends State<FreeLanceView>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              header(),
              tab(),
              tabBarView(),
            ],
          ),
        ),
      ),
    );
  }

//  appBar
  Widget header() {
    return Container(
      height: Get.height * 0.3,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(AppColor.yellow),
            Color(AppColor.orange),
          ],
        ),
      ),
      child: Stack(
        children: [
          appBar(),
          decorationImage(),
          customRow(),
        ],
      ),
    );
  }

  Widget decorationImage() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Image.asset(
          '${AssetPath.refer}decoration2.png',
          color: Color(AppColor.white),
          height: Get.height * 0.19,
        ),
      ),
    );
  }

  Widget customRow() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 15),
      child: Row(
        children: [
          const CircleAvatar(radius: 50, backgroundColor: Colors.black),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Earn Coins",
                style: TextStyle(fontFamily: AppFont.Medium, fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset("${AssetPath.refer}coin.png", height: 18),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "100 Coin",
                    style: TextStyle(fontFamily: AppFont.Medium, fontSize: 15),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  btm(
                      name: "Withdrawal",
                      color: Color(AppColor.bgcolor),
                      borderColor: Colors.transparent,
                      onTap: () {}),
                  const SizedBox(
                    width: 10,
                  ),
                  btm(
                      name: "Transaction",
                      borderColor: Color(AppColor.white),
                      onTap: () {}),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget btm({color, name, borderColor, onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          name,
          style: TextStyle(fontFamily: AppFont.Regular, fontSize: 12),
        ),
      ),
    );
  }

  Widget appBar() {
    return commanAppbar(
        color: Color(AppColor.white),
        pageName: "Freelance",
        ontap: () {
          Get.back();
        });
  }

// tab
  Widget tab() {
    return TabBar(
        padding: const EdgeInsets.all(8),
        indicatorWeight: 6,
        indicatorColor: Color(AppColor.orange),
        controller: tabController,
        tabs: const [
          Tab(
              icon: Icon(
            Icons.home,
            size: 30,
          )),
          Tab(
              icon: Icon(
            Icons.book,
            size: 30,
          )),
          Tab(
              icon: Icon(
            Icons.apps,
            size: 30,
          )),
          Tab(
              icon: Icon(
            Icons.deck,
            size: 30,
          )),
        ]);
  }

// tabBar View
  Widget tabBarView() {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: [
          container(count: 52, height: 100),
          container(count: 56, height: 100),
          container(count: 56, height: 130),
          container(count: 56, height: 130),
        ],
      ),
    );
  }

  // tabBar Page(Grid View)
  Widget container({count, double height}) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: height),
        itemCount: count,
        itemBuilder: (_, i) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(AppColor.grey)),
            ),
          );
        });
  }
}
