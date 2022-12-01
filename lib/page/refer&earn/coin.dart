// ignore_for_file: prefer_const_constructors, must_be_immutable, sort_child_properties_last, prefer_const_declarations, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/commanlist/list.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';
import 'package:poster_maker/page/bottomnavbar/bottomnavbar.dart';
import 'package:poster_maker/page/refer&earn/Refer&EarnPage.dart';

import '../../Helper/widget.dart';

class CoinPageView extends StatefulWidget {
  CoinPageView({Key key}) : super(key: key);

  @override
  State<CoinPageView> createState() => _CoinPageViewState();
}

class _CoinPageViewState extends State<CoinPageView> {
  var basic = false.obs;

  var affordable = false.obs;

  var populer = false.obs;

  var currentIndex = 1;
  int val = 0;

  selectedIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            rewordCoin(),
            decorationImage(),
          ],
        ),
        // freelance(),
        // dropDownBtn(
        //   name: 'Basic',
        //   boolValue: basic,
        //   onTap: () {
        //     basic.value = !basic.value;
        //   },
        // ),
        // Obx(() => Visibility(
        //       visible: basic.value,
        //       child: dropdown(),
        //     )),
        // dropDownBtn(
        //   name: 'Affordable',
        //   boolValue: affordable,
        //   onTap: () {
        //     affordable.value = !affordable.value;
        //   },
        // ),
        // Obx(() => Visibility(
        //       visible: affordable.value,
        //       child: dropdown(),
        //     )),
        // dropDownBtn(
        //   name: 'Populer',
        //   boolValue: populer,
        //   onTap: () {
        //     populer.value = !populer.value;
        //   },
        // ),
        // Obx(() => Visibility(
        //       visible: populer.value,
        //       child: dropdown(),
        //     )),
        containerBtn(),
        SizedBox(
          height: 10,
        ),
        btnPage(),
      ],
    ));
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> freelance <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget decorationImage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Image.asset(
          '${AssetPath.refer}decoration2.png',
          color: Color(AppColor.white),
          height: Get.height * 0.18,
        ),
      ),
    );
  }

  Widget rewordCoin() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(AppColor.orange),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: SafeArea(
        child: Column(children: [
          commanAppbar(
              color: Color(AppColor.white),
              pageName: 'Coin',
              ontap: () {
                Get.offAll(BottomNavBarScreen());
              }),
          Row(
            children: [
              SizedBox(width: Get.width * 0.08),
              Image.asset(
                "${AssetPath.refer}1coin.png",
                height: Get.height * 0.12,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reword Coin",
                    style: TextStyle(
                        color: Color(AppColor.white),
                        fontFamily: AppFont.Medium),
                  ),
                  SizedBox(height: 10),
                  DottedBorder(
                    dashPattern: [10, 3, 2, 3],
                    strokeWidth: 2,
                    color: Color(AppColor.white),
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10),
                    child: Container(
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("${AssetPath.refer}coin.png", height: 20),
                          SizedBox(width: 10),
                          Text('100 Coin',
                              style: TextStyle(
                                  color: Color(AppColor.white),
                                  fontSize: 14,
                                  fontFamily: AppFont.Medium)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15),

          // refer & earn
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(Refer_EarnPage());
                },
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(AppColor.black).withOpacity(0.5)),
                  child: Center(
                      child: Text(
                    "Refer & Earn",
                    style: TextStyle(
                        color: Color(AppColor.white),
                        fontFamily: AppFont.Medium),
                  )),
                ),
              ),
              SizedBox(width: Get.width * 0.03),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Color(AppColor.white)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                  "Get Free Coin",
                  style: TextStyle(
                      color: Color(AppColor.white), fontFamily: AppFont.Medium),
                )),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget gridView({itemCount, arr, item}) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return DottedBorder(
            dashPattern: [10, 3, 2, 3],
            strokeWidth: 1.5,
            color: Color(AppColor.orange),
            borderType: BorderType.RRect,
            radius: Radius.circular(10),
            child: Container(
              decoration: BoxDecoration(),
              child: Column(
                children: [Text("index: $index"), horizontalDottedLine()],
              ),
            ));
      },
    );
  }

  Widget horizontalDottedLine() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 4.0;
        final dashHeight = 2;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: 5,
              height: 1.5,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Color(AppColor.orange)),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }

  Widget containerBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        containerButton(index: 0, name: "My Plan"),
        containerButton(index: 1, name: "Coin Transaction"),
      ],
    );
  }

  Widget containerButton({name, index}) {
    return GestureDetector(
      onTap: () {
        val = index;
        setState(() {});
      },
      child: Container(
        height: 40,
        width: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                val == index ? Color(AppColor.orange) : Color(AppColor.bgcolor),
            border: Border.all(color: Colors.white)),
        alignment: Alignment.center,
        child: Text(
          name,
          style: TextStyle(
              color: Color(AppColor.white), fontFamily: AppFont.Medium),
        ),
      ),
    );
  }

  Widget btnPage() {
    return Expanded(
      child: (val == 0)
          ? ListView(
              children: [
                msg(msg: 'Unlock 2000+ Templates'),
                msg(msg: 'Unlock 2000+ Stickers'),
                msg(msg: 'Unlock Every Week'),
                msg(msg: 'Get access of all festival & days posters.'),
                const SizedBox(height: 20),
                templates(
                  listindex: item2,
                  itemCount: item2.length,
                  boxfit: BoxFit.cover,
                  height: 140,
                  width: 140,
                ),
                Divider(
                  thickness: 3,
                  color: Color(AppColor.grey).withOpacity(0.5),
                ),
                const SizedBox(height: 10),
                Text(
                  'Choose Your plan',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: AppFont.Medium),
                ),
                SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //per Month
                      Container(
                          width: Get.width * 0.3,
                          decoration: BoxDecoration(
                              color: Color(AppColor.yellow),
                              borderRadius: BorderRadius.circular(10)),
                          child: GestureDetector(
                            onTap: () {
                              selectedIndex(0);
                            },
                            child: Container(
                              margin: EdgeInsets.all(3),
                              height: 150,
                              width: Get.width * 0.25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: currentIndex == 0
                                      ? Color(AppColor.white)
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: Color(AppColor.white),
                                      width: 1.5)),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(height: 10),
                                    text(
                                        text: '3 Day Free',
                                        currentind: 0,
                                        fontFamily: AppFont.Bold,
                                        fontSize: 15.0),
                                    text(
                                        text: 'Trial',
                                        currentind: 0,
                                        fontFamily: AppFont.Bold,
                                        fontSize: 15.0),
                                    SizedBox(height: 10),
                                    text(
                                        text: 'then ₹250.00/per',
                                        fontFamily: AppFont.Regular,
                                        fontSize: 11.0,
                                        currentind: 0),
                                    text(
                                      text: 'Mounth',
                                      currentind: 0,
                                      fontFamily: AppFont.Regular,
                                      fontSize: 11.0,
                                    ),
                                    SizedBox(height: 10)
                                  ]),
                            ),
                          )),
                      // 3 Month
                      Container(
                          width: Get.width * 0.3,
                          decoration: BoxDecoration(
                              color: Color(AppColor.yellow),
                              borderRadius: BorderRadius.circular(10)),
                          child: GestureDetector(
                            onTap: () {
                              selectedIndex(1);
                            },
                            child: Container(
                              margin: EdgeInsets.all(3),
                              height: 150,
                              width: Get.width * 0.25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: currentIndex == 1
                                      ? Color(AppColor.white)
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: Color(AppColor.white),
                                      width: 1.5)),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(height: 20),
                                    text(
                                        text: 'Start Today',
                                        currentind: 1,
                                        fontSize: 16,
                                        fontFamily: AppFont.SemiBold),
                                    text(
                                        text: '3 Month',
                                        currentind: 1,
                                        fontSize: 16,
                                        fontFamily: AppFont.SemiBold),
                                    text(
                                        text: '₹ 750.00',
                                        currentind: 1,
                                        fontSize: 14,
                                        fontFamily: AppFont.SemiBold),
                                    text(
                                        text: 'Per Month',
                                        currentind: 1,
                                        fontSize: 12,
                                        fontFamily: AppFont.Regular),
                                    SizedBox(height: 10)
                                  ]),
                            ),
                          )),
                      //  life Time
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            width: Get.width * 0.3,
                            decoration: BoxDecoration(
                                color: Color(AppColor.yellow),
                                borderRadius: BorderRadius.circular(10)),
                            child: GestureDetector(
                              onTap: () {
                                selectedIndex(2);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 3, left: 3, right: 3, bottom: 3),
                                height: 150,
                                width: Get.width * 0.25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: currentIndex == 2
                                        ? Color(AppColor.white)
                                        : Colors.transparent,
                                    border: Border.all(
                                        color: Color(AppColor.white),
                                        width: 1.5)),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(height: 20),
                                      text(
                                          text: 'Start Today',
                                          currentind: 2,
                                          fontSize: 15,
                                          fontFamily: AppFont.SemiBold),
                                      text(
                                          text: 'Forever',
                                          currentind: 2,
                                          fontSize: 16,
                                          fontFamily: AppFont.SemiBold),
                                      text(
                                          text: '₹ 820.00',
                                          currentind: 2,
                                          fontSize: 12,
                                          fontFamily: AppFont.SemiBold),
                                      text(
                                          text: '₹ 3000.00',
                                          currentind: 2,
                                          fontSize: 12,
                                          fontFamily: AppFont.SemiBold,
                                          decoration:
                                              TextDecoration.lineThrough),
                                      SizedBox(height: 10)
                                    ]),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -12,
                            child: Image.asset(
                              '${AssetPath.settingpage}hottest.png',
                              height: Get.height * 0.04,
                            ),
                          ),
                        ],
                        clipBehavior: Clip.none,
                      ),
                    ]),
                CommanWidget().nextButton(
                    height: 45,
                    margin: EdgeInsets.only(
                        left: 100, right: 100, top: 30, bottom: 30),
                    radius: 10,
                    text: 'Buy Now')
              ],
            )
          : ListView(
              children: [
                posterBuySendCoin(
                    coin: "20", date: "20-07-2022", isSendcoin: true),
                posterBuySendCoin(
                    coin: "30", date: "21-07-2022", isSendcoin: false),
                posterBuySendCoin(
                    coin: "40", date: "22-07-2022", isSendcoin: true),
                posterBuySendCoin(
                    coin: "10", date: "23-07-2022", isSendcoin: false),
                posterBuySendCoin(
                    coin: "20", date: "20-07-2022", isSendcoin: true),
                posterBuySendCoin(
                    coin: "30", date: "21-07-2022", isSendcoin: false),
                posterBuySendCoin(
                    coin: "40", date: "22-07-2022", isSendcoin: true),
                posterBuySendCoin(
                    coin: "10", date: "23-07-2022", isSendcoin: false),
              ],
            ),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> posterBuySendCoin <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget posterBuySendCoin({coin, date, isSendcoin}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSendcoin
                        ? Color(AppColor.orange)
                        : Color(AppColor.white),
                  ),
                  child: Icon(
                    isSendcoin
                        ? Icons.arrow_upward_rounded
                        : Icons.arrow_downward_rounded,
                    color: Color(AppColor.bgcolor),
                  )),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isSendcoin ? "Poster Send Coin" : "Buy Coin",
                    style: TextStyle(
                        color: isSendcoin
                            ? Color(AppColor.orange)
                            : Color(AppColor.white),
                        fontFamily: AppFont.Medium,
                        fontSize: 15),
                  ),
                  Text(
                    "10 min ago",
                    style: TextStyle(
                        color: Color(
                            isSendcoin ? AppColor.orange : AppColor.white),
                        fontFamily: AppFont.Medium,
                        fontSize: 9),
                  ),
                ],
              ),
              Spacer(),
              Column(children: [
                Text(
                  "$coin Coin",
                  style: TextStyle(
                      color:
                          Color(isSendcoin ? AppColor.orange : AppColor.white),
                      fontFamily: AppFont.Medium,
                      fontSize: 15),
                ),
                Text(
                  date,
                  style: TextStyle(
                      color:
                          Color(isSendcoin ? AppColor.orange : AppColor.white),
                      fontFamily: AppFont.Medium,
                      fontSize: 9),
                ),
              ]),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: List.generate(
                Get.width ~/ 3,
                (index) => Expanded(
                      child: Container(
                        color: index % 2 == 0
                            ? Colors.transparent
                            : Color(AppColor.orange).withOpacity(0.4),
                        height: 1,
                      ),
                    )),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> msg <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget msg({msg}) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20),
      child: Row(
        children: [
          Container(
            height: 13,
            width: 13,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(AppColor.grey)),
          ),
          const SizedBox(width: 20),
          Text(
            msg,
            style: TextStyle(
                fontSize: 14,
                fontFamily: AppFont.Medium,
                color: Color(AppColor.grey)),
          )
        ],
      ),
    );
  }

  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Templates <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget templates(
      {double height, double width, itemCount, listindex, boxfit}) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 20),
      height: height,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          var currentObj = listindex[index];
          return Container(
            margin: EdgeInsets.only(
                left: index == 0 ? 15 : 5,
                right: index == itemCount - 1 ? 15 : 5),
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(currentObj), fit: boxfit),
                      borderRadius: BorderRadius.circular(15),
                      color: Color(AppColor.grey)),
                  // child: Center(child: Text("$index")),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(AppColor.white)),
                    child: Center(
                        child: Text(
                      '2000 + Templates',
                      style: TextStyle(
                          color: Color(AppColor.bgcolor),
                          fontFamily: AppFont.Medium,
                          fontSize: 13),
                    )),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget text(
      {text, double fontSize, decoration, color, currentind, fontFamily}) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          decoration: decoration,
          color: currentIndex == currentind
              ? Color(AppColor.black)
              : Color(AppColor.white)),
      textAlign: TextAlign.center,
    );
  }
}
