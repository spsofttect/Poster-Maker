import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Helper/utlity.dart';
import '../../Helper/widget.dart';

class AddBusiness extends StatefulWidget {
  const AddBusiness({Key key}) : super(key: key);

  @override
  State<AddBusiness> createState() => _AddBusinessState();
}

class _AddBusinessState extends State<AddBusiness> {
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              appbar(),
              const SizedBox(
                height: 25,
              ),
              CommanWidget().profileImagePicker(
                  sizedBoxWidth: 90, sizedBoxHeight: 90, imageheigth: 90, imagewidth: 90, imageRadius: 75, iconheigth: 40, iconwidth: 40, iconRadius: 20),
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
                  gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFFFA7F08), Color(0xFFF24405)]),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Add",
                  style: TextStyle(fontFamily: AppFont.Medium, fontSize: 20, color: Color(AppColor.white)),
                ),
              ),
            ],
          ),
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
          'Add Business',
          style: TextStyle(fontFamily: AppFont.Medium, fontSize: 20),
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: Color(AppColor.orange))),
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
              style: TextStyle(fontSize: 15, fontFamily: AppFont.SemiBold),
              maxLength: maxLength,
              decoration: InputDecoration(
                border: InputBorder.none,
                counterText: '',
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 15, fontFamily: AppFont.SemiBold),
              ),
            ),
          ),
          Text(
            "$val/$maxLength",
            style: GoogleFonts.fredoka(color: hintColor),
          ),
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
