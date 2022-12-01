// ignore_for_file: unnecessary_import, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/Helper/widget.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';

class DevelopmentPage extends StatefulWidget {
  const DevelopmentPage({Key key}) : super(key: key);

  @override
  State<DevelopmentPage> createState() => _DevelopmentPageState();
}

class _DevelopmentPageState extends State<DevelopmentPage> {
  var currentIndex = 0;

  selectedIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context).settings.arguments;

    // DeviceOrientation
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // Do not capture Screenshot and video
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    // Do not capture Screenshot and video

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            settingPageAppbar(
              context: context,
              ontap: () {
                Get.back();
              },
            ),
           Expanded(child: ListView(children: [
             title(title: 'We also design:'),
                listView(args: args),
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 1.5, color: Color(AppColor.grey)),
                      borderRadius: BorderRadius.circular(15)),
                  child: Wrap(
                    spacing: 10.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: (args == "App")
                        ? development
                            .map((e) =>
                                (e.color) ? crossContainer(e) : Container())
                            .toList()
                        : (args == "Website")
                            ? webDevelopment
                                .map((e) =>
                                    (e.color) ? crossContainer(e) : Container())
                                .toList()
                            : graphicsDevelopment
                                .map((e) =>
                                    (e.color) ? crossContainer(e) : Container())
                                .toList(),
                  ),
                ),
                textfield(
                    hintText: 'Enter your Email-ID*',
                    height: 45,
                    keyboardtype: TextInputType.emailAddress),
                textfield(
                    hintText: 'Enter your Mobile*',
                    height: 45,
                    keyboardtype: TextInputType.number),
                textfield(
                    hintText: 'Enter your Text',
                    height: 120,
                    keyboardtype: TextInputType.text),
                CommanWidget().nextButton(
                    text: 'Submit',
                    radius: 10.0,
                    height: 45,
                    width: Get.width,
                    margin: const EdgeInsets.all(15))
           ],))
          ],
        ),
      ),
    );
  }

  Container listView({String args}) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Wrap(
          spacing: 10.0,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: (args == "App")
              ? development.map((e) => commanContainer(e)).toList()
              : (args == "Website")
                  ? webDevelopment.map((e) => commanContainer(e)).toList()
                  : graphicsDevelopment
                      .map((e) => commanContainer(e))
                      .toList()),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Title<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget title({title}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        title,
        style: TextStyle(
            color: Color(AppColor.white),
            fontFamily: AppFont.SemiBold,
            fontSize: 18),
      ),
    );
  }

  // >>>>>>>>>>>>>>>>>>>>>> Comman Container <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget commanContainer(e) {
    return GestureDetector(
      onTap: () {
        setState(() {
          e.color = !e.color;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
        decoration: BoxDecoration(
            color: e.color ? Color(AppColor.orange) : Colors.transparent,
            border: Border.all(
                color: e.color ? Colors.transparent : Color(AppColor.grey),
                width: 1),
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          e.name,
          style: TextStyle(
              color: e.color ? Color(AppColor.white) : Color(AppColor.grey),
              fontFamily: AppFont.Medium,
              fontSize: 14),
        ),
      ),
    );
  }

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Remove Container(Cross Button)   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //

  Widget crossContainer(e) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
      decoration: BoxDecoration(
          color: e.color ? Color(AppColor.orange) : Colors.transparent,
          border: Border.all(
              color: e.color ? Colors.transparent : Color(AppColor.grey),
              width: 1),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            e.name,
            style: TextStyle(
                color: e.color ? Color(AppColor.white) : Color(AppColor.grey),
                fontFamily: AppFont.Medium,
                fontSize: 14),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                e.color = !e.color;
              });
            },
            // ignore: prefer_const_constructors
            child: Icon(
              Icons.cancel,
              size: 15,
              color: Color(AppColor.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget textfield(
      {String hintText, double height, TextInputType keyboardtype}) {
    return Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(AppColor.grey).withOpacity(0.5),
        ),
        child: TextField(
          keyboardType: keyboardtype,
          maxLines: (height == 120) ? 6 : 1,
          cursorColor: Color(AppColor.orange),
          style: TextStyle(
              // color:
              // Get.isDarkMode ? Color(AppColor.grey) : Color(AppColor.white),
              fontSize: 15,
              fontFamily: AppFont.SemiBold),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 15, fontFamily: AppFont.SemiBold),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(AppColor.orange), width: 1.5),
            ),
          ),
        ));
  }
}

class Development {
  String name;
  bool color;
  Development({this.name, this.color});
}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> App Development List <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<//
List<Development> development = <Development>[
  Development(name: '3D Product Packaging Design Services', color: false),
  Development(name: 'hello', color: false),
  Development(name: 'Logo Designs', color: false),
  Development(name: 'Brochure Designs', color: false),
  Development(name: 'Print & Stationery design', color: false),
  Development(name: 'Layout and Formatting', color: false),
  Development(name: 'Book Layout Design Services', color: false),
  Development(name: 'hello', color: false),
  Development(name: 'Catalog Designs', color: false),
  Development(name: 'Letter Head Designs', color: false),
  Development(name: 'Banner Designs', color: false),
  Development(name: 'Brochure Designs', color: false),
];

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Website Development List <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<//

List<Development> webDevelopment = <Development>[
  Development(name: '3D web', color: false),
  Development(name: 'website', color: false),
  Development(name: 'webDevelopment', color: false),
  Development(name: 'websitedevelopment', color: false),
  Development(name: 'hello', color: false),
  Development(name: 'Layout and Formatting', color: false),
  Development(name: 'Book Layout Design Services', color: false),
  Development(name: 'hello', color: false),
  Development(name: 'Catalog Designs', color: false),
  Development(name: 'Letter Head Designs', color: false),
  Development(name: 'Banner Designs', color: false),
  Development(name: 'Brochure Designs', color: false),
];

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Graphics  Development List <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<//
List<Development> graphicsDevelopment = <Development>[
  Development(name: 'Graphics', color: false),
  Development(name: 'GraphicsDevelopment', color: false),
  Development(name: 'Hello', color: false),
  Development(name: 'Brochure Designs', color: false),
  Development(name: 'Print & Stationery design', color: false),
  Development(name: 'Layout and Formatting', color: false),
  Development(name: 'Book Layout Design Services', color: false),
  Development(name: 'hello', color: false),
  Development(name: 'Catalog Designs', color: false),
  Development(name: 'Letter Head Designs', color: false),
  Development(name: 'Banner Designs', color: false),
  Development(name: 'Brochure Designs', color: false),
];
