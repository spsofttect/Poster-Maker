// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/Helper/widget.dart';
import 'package:poster_maker/page/editBottomNavBar/PosterEditingMenu.dart';

class StoryImagePage extends StatefulWidget {
  const StoryImagePage({Key? key}) : super(key: key);

  @override
  State<StoryImagePage> createState() => _StoryImagePageState();
}

class _StoryImagePageState extends State<StoryImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
           appBar(context: context, name: 'Story Image'),
        Container(
          height: Get.height * 0.4,
          width: double.infinity,
          color: Color(AppColor.white),
        ),
        Container()
      ]),
    );
  }

  appBar({BuildContext? context, String? name}) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context!);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
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
            name!,
            style:
                GoogleFonts.fredoka(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const Spacer(),
          CommanWidget().nextButton(
              height: 30,
              width: 80,
              onTap: () {
                Get.to(const PosterEditingMenu());
              },
              margin: const EdgeInsets.only(right: 20),
              text: 'Next',
              radius: 8)
        ],
      ),
    );
  }
}
