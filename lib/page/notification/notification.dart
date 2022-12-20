// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';

class NotificationPageView extends StatefulWidget {
  const NotificationPageView({Key key}) : super(key: key);

  @override
  State<NotificationPageView> createState() => _NotificationPageViewState();
}

class _NotificationPageViewState extends State<NotificationPageView> {
  @override
  Widget build(BuildContext context) {
    // DeviceOrientation
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            commanAppbar(
                textColor: Theme.of(context).textTheme.headline1.color,
                pageName: "Notification",
                ontap: () {
                  Get.back();
                }),
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15, top: 15, right: 10),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(color: Color(AppColor.grey).withOpacity(0.3), borderRadius: BorderRadius.circular(5)),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            height: 80,
                            width: Get.width * 0.68,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lorem Ipsum',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.fredoka(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          .color),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  style: GoogleFonts.fredoka(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          .color),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '22/01/2022  2:30PM',
                          style: GoogleFonts.fredoka(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                      )
                    ],
                  );
                },
                itemCount: 12000,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Color(AppColor.grey),
                    thickness: 2,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
