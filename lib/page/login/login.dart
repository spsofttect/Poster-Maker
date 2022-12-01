// ignore_for_file: implementation_imports, unnecessary_import, prefer_const_constructors, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/Helper/widget.dart';
import 'package:poster_maker/page/login/number_varification/varification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number = await PhoneNumber.getRegionInfoFromPhoneNumber(
      phoneNumber,
      'IN',
    );
    setState(() {
      this.number = number;
    });
  }

  @override
  void initState() {
        super.initState();
    // DeviceOrientation
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Get.isDarkMode ? Colors.white : Color(AppColor.bgcolor),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
                // margin: EdgeInsets.only(
                //     top: Get.height * 0.02, bottom: Get.width * 0.03),
                height: MediaQuery.of(context).size.height * 0.4,
                child: Center(
                    child: SvgPicture.asset(
                  '${AssetPath.login}Mobile_login.svg',
                  height: Get.height * 0.35,
                ))),
            SizedBox(height: 30),
            Text(
              'Login',
              style: TextStyle(
                  // color: Get.isDarkMode
                  //     ? Color(AppColor.grey)
                  //     : Color(AppColor.white),
                  fontFamily: AppFont.Medium,
                  fontSize: 40),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            SizedBox(
              child: Center(
                child: Text(
                  'Enter Your Mobile Number To \nReceive A Verification Code',
                  style: TextStyle(
                      fontFamily: AppFont.Regular,
                      // color: Get.isDarkMode
                      //     ? Color(AppColor.grey)
                      //     : Color(AppColor.white),
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(Get.height * 0.03),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(AppColor.grey).withOpacity(0.6)),
              margin: EdgeInsets.all(20),
              height: Get.height * 0.25,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    mobileNumberBox(),
                    CommanWidget().nextButton(
                        onTap: () {
                          Get.to(VarificationScreen());
                        },
                        radius: 10.0,
                        text: 'Get Code',
                        height: 45.0,
                        width: double.infinity)
                  ]),
            ),
            // RichText(
            //     text: TextSpan(children: [,
            //   TextSpan(
            //       text: 'Don\'t Have Account ? ',
            //       style: TextStyle(
            //           fontSize: Get.height * 0.02,
            //           color: Color(AppColor.yellow),
            //           fontFamily: AppFont.robotoBold)),
            //   TextSpan(
            //       text: 'Sign In',
            //       style: TextStyle(
            //           fontSize: Get.height * 0.02,
            //           color: Color(AppColor.orange),
            //           fontFamily: AppFont.robotoBold))p
            // ]))
          ],
        ),
      ),
    );
  }

  Widget mobileNumberBox() {
    return Column(
      children: [
        Container(
          // margin: EdgeInsets.only(top: 7),
          height: 50,
          decoration: BoxDecoration(
              color: Color(AppColor.white),
              borderRadius: BorderRadius.circular(15)),
          alignment: Alignment.center,
          child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              print(number.phoneNumber);
            },
            onInputValidated: (bool value) {
              print(value);
            },
            selectorConfig: SelectorConfig(
              showFlags: true,
              setSelectorButtonAsPrefixIcon: true,
              leadingPadding: 15,
              selectorType: PhoneInputSelectorType.DIALOG,
            ),
            ignoreBlank: false,

            inputDecoration: InputDecoration(
              hintText: "Phone Number",
              hintStyle: TextStyle(
                  color: Color(AppColor.black).withOpacity(0.3),
                  fontSize: 15,
                  fontFamily: AppFont.SemiBold),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    BorderSide(color: Color(AppColor.orange), width: 1.5),
              ),
            ),
            cursorColor: Color(AppColor.orange),
            spaceBetweenSelectorAndTextField: 0,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: TextStyle(
                color: Color(AppColor.black).withOpacity(0.5),
                fontSize: 15,
                fontFamily: AppFont.Medium),
            initialValue: number,

            // textFieldController: controller,
            formatInput: false,
            textAlignVertical: TextAlignVertical.bottom,
            textStyle: TextStyle(
                color: Color(AppColor.bgcolor),
                fontSize: 16,
                fontFamily: AppFont.Regular),
            // keyboardType:
            //     TextInputType.numberWithOptions(signed: true, decimal: true),
            keyboardType: TextInputType.number,
            inputBorder: InputBorder.none,

            onSaved: (PhoneNumber number) {
              print('On Saved: $number');
            },
          ),
        ),
      ],
    );
  }
}
