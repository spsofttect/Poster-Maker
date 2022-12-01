// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/widget.dart';
import 'package:poster_maker/page/Freelance/freelance..dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';

class BankDetailList extends StatelessWidget {
  const BankDetailList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        commanAppbar(
            pageName: 'Bank detail List',
            ontap: () {
              Get.back();
            }),
        Expanded(
            child: ListView(
          children: [
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (_, i) {
                  return Container(
                      margin: EdgeInsets.all(10),
                      height: 100,
                      width: 100,
                      color: Colors.red);
                }),
            CommanWidget().nextButton(
                radius: 10,
                height: 45,
                margin: EdgeInsets.all(20),
                text: 'Continue',
                onTap: () {
                  Get.to(FreeLanceView());
                })
          ],
        ))
      ])),
    );
  }
}
