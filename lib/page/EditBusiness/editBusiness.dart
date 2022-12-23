// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Helper/utlity.dart';
import '../../Helper/widget.dart';

class EditBusiness extends StatefulWidget {
  const EditBusiness({Key key}) : super(key: key);

  @override
  State<EditBusiness> createState() => _EditBusinessState();
}

class _EditBusinessState extends State<EditBusiness> {
  TextEditingController addName = TextEditingController();
  TextEditingController addAddress = TextEditingController();
  TextEditingController addEmail = TextEditingController();
  TextEditingController addWebsite = TextEditingController();
  TextEditingController addPhoneNumber = TextEditingController();

  int business = 0;
  int number = 0;
  int email = 0;
  int website = 0;
  int address = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appbar(),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    CommanWidget().profileImagePicker(
                        sizedBoxWidth: 90,
                        sizedBoxHeight: 90,
                        imageheigth: 90,
                        imagewidth: 90,
                        imageRadius: 75,
                        iconheigth: 40,
                        iconwidth: 40,
                        iconRadius: 20),
                    Container(
                      margin: const EdgeInsets.only(top: 25),
                      height: 60,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(AppColor.grey).withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    allTextFieldUi(),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 60,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient:  LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(AppColor.orange), Color(AppColor.yellow)]),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Update",
                        style: GoogleFonts.fredoka(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color(AppColor.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//------------------------------- appBar -------------------------------------//
  appbar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
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
          'Edit Business',
          style: GoogleFonts.fredoka(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Theme.of(context).textTheme.headline1.color,
          ),
        ),
      ],
    );
  }

  //-------------------------- All Detail TextField -----------------------//
  Widget detailTextField({
    fontColor,
    hintColor,
    icon,
    onChanged,
    maxLength,
    hintText,
    val,
    controller,
    keyboardType,
    inputFormat,
  }) {
    return Container(
      height: 60,
      width: Get.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(AppColor.orange))),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Icon(
            icon,
            color: Color(AppColor.orange),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              inputFormatters: inputFormat,
              keyboardType: keyboardType,
              controller: controller,
              onChanged: onChanged,
              style: GoogleFonts.fredoka(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).textTheme.headline1.color,
              ),
              maxLength: maxLength,
              decoration: InputDecoration(
                border: InputBorder.none,
                counterText: '',
                hintText: hintText,
                hintStyle: GoogleFonts.fredoka(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Text("$val/$maxLength",
              style: GoogleFonts.fredoka(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).textTheme.headline1.color,
              )),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

//-------------------------- All TextField Ui-----------------------//
  Widget allTextFieldUi({hintColor, fontColor}) {
    return Column(
      children: [
        detailTextField(
          keyboardType: TextInputType.text,
          controller: addName,
          hintColor: hintColor,
          fontColor: fontColor,
          maxLength: 20,
          val: business,
          hintText: "Enter Your Business name*",
          icon: Icons.edit,
          onChanged: (val) {
            setState(() {
              business = val.length;
            });
          },
        ),
        const SizedBox(height: 25),
        detailTextField(
          inputFormat: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          keyboardType: TextInputType.number,
          controller: addPhoneNumber,
          hintColor: hintColor,
          fontColor: fontColor,
          maxLength: 12,
          val: number,
          hintText: "Business Mobile Number",
          icon: Icons.tablet_android_outlined,
          onChanged: (val) {
            setState(() {
              number = val.length;
            });
          },
        ),
        const SizedBox(height: 25),
        detailTextField(
          keyboardType: TextInputType.emailAddress,
          controller: addEmail,
          hintColor: hintColor,
          fontColor: fontColor,
          maxLength: 30,
          val: email,
          hintText: "Enter Your Business Email-ID*",
          icon: Icons.email,
          onChanged: (val) {
            setState(() {
              email = val.length;
            });
          },
        ),
        const SizedBox(height: 25),
        detailTextField(
          keyboardType: TextInputType.text,
          controller: addWebsite,
          hintColor: hintColor,
          fontColor: fontColor,
          maxLength: 30,
          val: website,
          hintText: "Enter Your Business Website*",
          icon: Icons.blur_circular,
          onChanged: (val) {
            setState(() {
              website = val.length;
            });
          },
        ),
        const SizedBox(height: 25),
        detailTextField(
          keyboardType: TextInputType.text,
          controller: addAddress,
          hintColor: hintColor,
          fontColor: fontColor,
          maxLength: 45,
          val: address,
          hintText: "Enter Your Business Address*",
          icon: Icons.location_on_rounded,
          onChanged: (val) {
            setState(() {
              address = val.length;
            });
          },
        ),
      ],
    );
  }
}
