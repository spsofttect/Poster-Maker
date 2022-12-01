// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import 'package:get/get.dart';
import 'package:poster_maker/Helper/preferences.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/Helper/widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    // DeviceOrientation
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    // Do not capture Screenshot and video
    // Do not capture Screenshot and video
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    // Do not capture Screenshot and video
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('${AssetPath.splash}background.png'),
                fit: BoxFit.cover)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              pageViewContianer(),
              indicator(),
              CommanWidget().nextButton(
                  onTap: () {
                    if (pagecontroll.page == 5) {
                      Preferences.preferences.saveBool(
                          key: PrefernceKey.isIntroductionScreenLoaded,
                          value: true);
                      Get.offNamed('/loginScreen');

                      // Login page
                    } else {
                      //updateLocal();
                      pagecontroll.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.decelerate);
                    }
                  },
                  height: 50,
                  width: 300,
                  radius: 15,
                  text: 'Next',
                  margin: EdgeInsets.only(top: 20)),
              GestureDetector(
                onTap: () {
                  Get.offNamed('/loginScreen');
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  // color: Color(AppColor.grey),
                  height: 30,
                  child: Center(
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontFamily: AppFont.Regular,
                        // color: Get.isDarkMode
                        //     ? Color(AppColor.grey)
                        //     : Color(AppColor.white),
                      ),
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }

  Widget pageview({text, subtitel, imageurl}) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
        height: Get.height * 0.45,
        width: Get.width,
        child: Image.asset(AssetPath.intro + imageurl),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 20, top: 20),
        // color: Color(AppColor.grey),
        width: 300,
        child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(AppColor.orange),
                fontSize: 20,
                fontFamily: AppFont.freeh)),
      ),
      Container(
        margin: EdgeInsets.only(right: 20, left: 20),

        // color: Color(AppColor.grey),
        width: 330,
        child: Text(
          subtitel,
          style: TextStyle(
            fontFamily: AppFont.Regular,
            fontSize: 15,
            // color:
            //     Get.isDarkMode ? Color(AppColor.grey) : Color(AppColor.white),
          ),
          maxLines: 3,
          textAlign: TextAlign.center,
        ),
      ),
    ]);
  }

  Widget pageViewContianer() {
    return SizedBox(
      height: Get.height * 0.70,
      child: PageView(
        controller: pagecontroll,
        children: [
          pageview(
              text: 'Instagram / Facebook Story',
              subtitel:
                  'Create Social Media Post/Story We’ve readymade templates that can be used to instantly create any kind of story. Just add pics, description and you’re done!s',
              imageurl: 'intro_1.png'),
          pageview(
              text: 'Business Post/Story',
              subtitel:
                  'Create a fantastic poster of your business or story of a product to promote it on social networks with10000+ Readymade templates and Boost your sales.',
              imageurl: 'intro_2.png'),
          pageview(
              text: 'Beautiful Stories for Events & Festivals',
              subtitel:
                  'Create Social Media Post/Story We’ve readymade templates that can be used to instantly create any kind of story. Just add pics, description and you’re done!s',
              imageurl: 'intro_3.png'),
          pageview(
              text: 'Online Graphic Design App',
              subtitel:
                  'Create a fantastic poster of your business or story of a product to promote it on social networks with10000+ Readymade templates and Boost your sales.',
              imageurl: 'intro_4.png'),
          pageview(
              text: 'Simple and user-friendly interface.',
              subtitel:
                  'Create a fantastic poster of your business or story of a product to promote it on social networks with10000+ Readymade templates and Boost your sales.',
              imageurl: 'intro_5.png'),
          pageview(
              text: 'Social media marketing made easy and affordable.',
              subtitel:
                  'Create a fantastic poster of your business or story of a product to promote it on social networks with10000+ Readymade templates and Boost your sales.',
              imageurl: 'intro_6.png'),
        ],
      ),
    );
  }

  PageController pagecontroll =
      PageController(viewportFraction: 1, keepPage: true);
  Widget indicator() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: SmoothPageIndicator(
        controller: pagecontroll,
        count: 6,
        effect: CustomizableEffect(
            spacing: 10.0,
            activeDotDecoration: DotDecoration(
              width: 15,
              height: 15,
              color: Color(AppColor.orange),
              rotationAngle: 180,
              dotBorder: DotBorder(color: Color(AppColor.orange), padding: 3.0),
              verticalOffset: 1,
              borderRadius: BorderRadius.circular(2),
            ),
            dotDecoration: DotDecoration(
                width: 15,
                height: 15,
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(2),
                dotBorder: DotBorder(color: Color(0xFF707070)))),
      ),
    );
  }
}
