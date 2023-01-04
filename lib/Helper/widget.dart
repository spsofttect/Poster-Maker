// ignore_for_file: prefer_const_constructors, unused_import, avoid_print, missing_return, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poster_maker/Helper/app_theme.dart';
import 'package:poster_maker/Helper/utlity.dart';

import 'comman_function/commanFunction.dart';

class CommanWidget {
  Widget nextButton(
      {double? height,
      double? width,
      double? radius,
      text,
      EdgeInsets? margin,
      onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius!),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(AppColor.orange), Color(AppColor.yellow)])),
        child: Center(
            child: Text(text,
                style: GoogleFonts.fredoka(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Color(AppColor.white),
                ))),
      ),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>> profile image picker<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget profileImagePicker({
    required double sizedBoxHeight,
    required double sizedBoxWidth,
    required double imageheigth,
    required double imagewidth,
    required double iconheigth,
    required double iconwidth,
    required double iconRadius,
    required double imageRadius,
  }) {
    return Obx(
      () => SizedBox(
        height: sizedBoxHeight,
        width: sizedBoxWidth,
        // color: Colors.white10,
        child: GestureDetector(
            onTap: () {
              getImages(source: ImageSource.gallery);
            },
            child: Stack(children: [
              Center(
                child: Container(
                  height: imageheigth,
                  width: imagewidth,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: const [
                          Color.fromARGB(172, 242, 68, 5),
                          Color.fromARGB(203, 250, 129, 8),
                        ]),

                    image: isImgaeSelected.value
                        ? DecorationImage(
                            image: FileImage(image.value), fit: BoxFit.cover)
                        : DecorationImage(
                            image:
                                AssetImage('${AssetPath.homepage}profile.gif'),
                            fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(imageRadius),
                    // color: Get.isDarkMode
                    //     ? Color(AppColor.grey)
                    //     : Color(AppColor.white),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.all(5),
                  height: iconheigth,
                  width: iconheigth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(iconRadius),
                      boxShadow: [
                        BoxShadow(color: Color(AppColor.yellow), blurRadius: 3)
                      ],
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(AppColor.orange),
                            Color(AppColor.yellow)
                          ])),
                  child: Image.asset('${AssetPath.addbusiness}pencil.png',
                      color: Color(AppColor.white)),
                ),
              ),
            ])),
      ),
    );
  }

  // Widget Print({String?text}) {
  //   print('\x1B[33m$text\x1B[0m');
  // }
}
