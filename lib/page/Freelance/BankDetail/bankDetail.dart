// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/Helper/widget.dart';
import 'package:poster_maker/page/Freelance/BankDetail/bankdetailList.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';

class BankDetails extends StatefulWidget {
  const BankDetails({Key key}) : super(key: key);

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          commanAppbar(
              ontap: () {
                Get.back();
              },
              pageName: 'Bank Details'),
          Expanded(
              child: ListView(
            children: [
              title(text: 'Add Bank Account'),
              textfield(hintText: 'EMPLOYEE NAME(AS PER BANK DETAILS)'),
              textfield(hintText: 'IFSC CODE'),
              textfield(hintText: 'BANK NAME'),
              textfield(hintText: 'BANK A/C NUMBER'),
              textfield(hintText: 'CONFIRM BANK A/C NUMBER'),
              textfield(hintText: 'ACCOUNT TYPE'),
              textfield(hintText: 'BRANCH NAME'),
              CommanWidget().nextButton(
                  height: 45,
                  text: 'Submit',
                  radius: 10,
                  margin: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 50, right: 50),
                  onTap: () {
                    Get.to(BankDetailList());
                  })
            ],
          ))
        ]),
      ),
    );
  }

  // Titel
  Widget title({text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 20.0, bottom: 10.0),
      child: Row(
        children: [
          Text(
            text,
            textAlign: TextAlign.start,
            style: TextStyle(fontFamily: AppFont.Medium, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget textfield({String hintText}) {
    return Container(
        margin: EdgeInsets.only(left: 30, right: 30, top: 25),
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(AppColor.grey).withOpacity(0.5),
        ),
        child: TextField(
          cursorColor: Color(AppColor.orange),
          style: TextStyle(
              // color:
              // Get.isDarkMode ? Color(AppColor.grey) : Color(AppColor.white),
              fontSize: 15,
              fontFamily: AppFont.SemiBold),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
                // color: Get.isDarkMode
                // ? Color(AppColor.grey)
                // : Color(AppColor.white),
                fontSize: 15,
                fontFamily: AppFont.SemiBold),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(AppColor.orange), width: 1.5),
            ),
          ),
        ));
  }
}
