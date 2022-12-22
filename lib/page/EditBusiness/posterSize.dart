import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/Helper/widget.dart';
import 'package:poster_maker/page/editBottomNavBar/EditBottomNavbar.dart';

class PosterSize extends StatelessWidget {
  const PosterSize({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        appBar(context: context, name: 'Poster Name'),
      ]),
    );
  }

  appBar({BuildContext context, String name}) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
            name,
            style:
                GoogleFonts.fredoka(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const Spacer(),
          CommanWidget().nextButton(
              height: 30,
              width: 80,
              onTap: () {
                Get.to(const EditBottomNavBar());
              },
              margin: const EdgeInsets.only(right: 20),
              text: 'Next',
              radius: 8)
        ],
      ),
    );
  }
}
