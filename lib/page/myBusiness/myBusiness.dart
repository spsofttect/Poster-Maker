// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poster_maker/page/EditBusiness/editBusiness.dart';

import '../../Helper/utlity.dart';
import '../addBusiness/addBusiness.dart';

class MyBusinessPage extends StatefulWidget {
  const MyBusinessPage({Key? key}) : super(key: key);

  @override
  State<MyBusinessPage> createState() => _MyBusinessPageState();
}

class _MyBusinessPageState extends State<MyBusinessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appbar(
                context: context,
                onTap: () {
                  Get.to(const AddBusiness());
                }),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(
                    height: 30,
                  ),
                  selectBusiness(),
                  const SizedBox(
                    height: 20,
                  ),
                  unselectedBusiness(),
                  const SizedBox(
                    height: 20,
                  ),
                  unselectedBusiness(),
                  const SizedBox(
                    height: 20,
                  ),
                  unselectedBusiness(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> - AppBar - <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //

  Widget appbar({context, onTap}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Image.asset(
              '${AssetPath.language}back.png',
              height: 25,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          'My Business',
          style: GoogleFonts.fredoka(
            color: Theme.of(context).textTheme.headline1!.color,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(right: 15),
            child: Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFA7F08), Color(0xFFF24405)]),
              ),
              child: Icon(
                Icons.add,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget selectBusiness() {
    return Stack(
      alignment: const Alignment(0, -1.4),
      children: [
        Container(
          height: Get.height * 0.12,
          width: Get.width * 0.9,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(AppColor.grey).withOpacity(0.7),
              border: Border.all(
                  color: Color(
                    AppColor.orange,
                  ),
                  width: 2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: Get.height * 0.044,
                backgroundColor: Color(AppColor.orange),
                backgroundImage: AssetImage("${AssetPath.homepage}profile.gif"),
              ),
              Text(
                "Your Business Name",
                style: GoogleFonts.fredoka(
                  color: Theme.of(context).textTheme.headline1!.color,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                ),
                child: PopupMenuButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(AppColor.orange)),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  color: Color(AppColor.white),
                  itemBuilder: (context) => [
                    // PopupMenuItem 1
                    PopupMenuItem(
                        value: 1,
                        height: 25,
                        onTap: () async {
                          final navigator = Navigator.of(context);
                          await Future.delayed(Duration.zero);
                          navigator.push(
                            MaterialPageRoute(
                                builder: (_) => const EditBusiness()),
                          );
                        },
                        // row with 2 children
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Edit",
                              style: GoogleFonts.fredoka(
                                color: Color(AppColor.orange),
                               fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            Divider(
                              color: Color(AppColor.orange),
                              thickness: 1,
                            ),
                            // Container(
                            //   color: Colors.red,
                            //   height: 1,
                            //   width: double.infinity,
                            // )
                          ],
                        )),
                    // PopupMenuItem 2
                    PopupMenuItem(
                        height: 25,
                        value: 2,
                        onTap: () {},
                        // row with 2 children
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delete",
                              style: GoogleFonts.fredoka(
                                color: Color(AppColor.orange),
                      fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            Divider(
                              color: Color(AppColor.orange),
                              thickness: 1,
                            ),
                            // Container(
                            //   color: Colors.red,
                            //   height: 1,
                            //   width: double.infinity,
                            // )
                          ],
                        )),
                    PopupMenuItem(
                        height: 25,
                        value: 3,

                        // row with 2 children
                        child: Text(
                          "Remove From Default",
                          style: GoogleFonts.fredoka(
                            color: Color(AppColor.orange),
                          fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 30,
          width: Get.width * 0.3,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(AppColor.white),
            border: Border.all(
                color: Color(
                  AppColor.orange,
                ),
                width: 2),
          ),
          alignment: Alignment.center,
          child: Text(
            "Default",
            style: GoogleFonts.fredoka(
              color: Color(AppColor.orange),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget unselectedBusiness() {
    return Container(
      height: Get.height * 0.12,
      width: Get.width * 0.9,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(AppColor.grey).withOpacity(0.7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: Get.height * 0.044,
            backgroundColor: Color(AppColor.orange),
            backgroundImage: AssetImage("${AssetPath.homepage}profile.gif"),
          ),
          Text(
            "Your Business Name",
            style: GoogleFonts.fredoka(
              color: Theme.of(context).textTheme.headline1!.color,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            child: PopupMenuButton(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(AppColor.orange)),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              color: Color(AppColor.white),
              itemBuilder: (context) => [
                // PopupMenuItem 1
                PopupMenuItem(
                    value: 1,
                    height: 25,
                    onTap: () async {
                      final navigator = Navigator.of(context);
                      await Future.delayed(Duration.zero);
                      navigator.push(
                        MaterialPageRoute(builder: (_) => const EditBusiness()),
                      );
                    },
                    // row with 2 children
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Edit",
                          style: GoogleFonts.fredoka(
                            color: Color(AppColor.orange),
                          fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        Divider(
                          color: Color(AppColor.orange),
                          thickness: 1,
                        ),
                        // Container(
                        //   color: Colors.red,
                        //   height: 1,
                        //   width: double.infinity,
                        // )
                      ],
                    )),
                // PopupMenuItem 2
                PopupMenuItem(
                    height: 25,
                    value: 2,
                    onTap: () {},
                    // row with 2 children
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delete",
                          style: GoogleFonts.fredoka(
                            color: Color(AppColor.orange),
                       fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        Divider(
                          color: Color(AppColor.orange),
                          thickness: 1,
                        ),
                        // Container(
                        //   color: Colors.red,
                        //   height: 1,
                        //   width: double.infinity,
                        // )
                      ],
                    )),
                PopupMenuItem(
                    height: 25,
                    value: 3,

                    // row with 2 children
                    child: Text(
                      "Add From Default",
                      style: GoogleFonts.fredoka(
                        color: Color(AppColor.orange),
                    fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
