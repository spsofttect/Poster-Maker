// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/Helper/widget.dart';
import 'package:poster_maker/page/login/Auth_Service.dart';

class VarificationScreen extends StatefulWidget {
  const VarificationScreen({Key key}) : super(key: key);

  @override
  State<VarificationScreen> createState() => _VarificationScreenState();
}

class _VarificationScreenState extends State<VarificationScreen> {
  OtpFieldController otpController = OtpFieldController();
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      // DeviceOrientation.landscapeLeft,
      // DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // DeviceOrientation
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    // Do not capture Screenshot and video
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    // Do not capture Screenshot and video
    return Scaffold(
      // backgroundColor: Get.isDarkMode ? Colors.white : Color(AppColor.bgcolor),
      body: SafeArea(
          child: ListView(
               physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
              // margin: EdgeInsets.only(
              //     top: Get.height * 0.02, bottom: Get.width * 0.03),
              height: MediaQuery.of(context).size.height * 0.4,
              child: Center(
                  child: SvgPicture.asset(
                '${AssetPath.login}Enter_OTP.svg',
                height: Get.height * 0.35,
              ))),
          SizedBox(height: 30),
          Text(
            'Varification',
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
                'Enter A 4 Digit Number That \n Was Sent To + (91) *****3210',
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
                  // OTPTextField(
                  //   length: 4,
                  //   width: MediaQuery.of(context).size.width,
                  //   fieldWidth: 20,
                  //   keyboardType: TextInputType.number,
                  //   style:
                  //       TextStyle(fontSize: 17, color: Color(AppColor.white)),
                  //   textFieldAlignment: MainAxisAlignment.spaceAround,
                  //   fieldStyle: FieldStyle.underline,
                  //   otpFieldStyle: OtpFieldStyle(
                  //       enabledBorderColor: Color(AppColor.white),
                  //       disabledBorderColor: Color(AppColor.white),
                  //       errorBorderColor: Colors.red,
                  //       focusBorderColor: Color(AppColor.orange)),
                  //   onCompleted: (pin) {
                  //     // ignore: unnecessary_brace_in_string_interps
                  //     print('Completed: ${pin}');
                  //   },
                  // ),
                  Container(
                      // padding: const EdgeInsets.all(5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(AppColor.black).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: otpbox,
                        cursorColor: Color(AppColor.white),
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        style: GoogleFonts.fredoka(
                            color: Color(AppColor.white), fontSize: 14),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter OTP",
                          focusColor: Color(AppColor.orange),
                          fillColor: Colors.transparent,
                          filled: true,
                        ),
                        onChanged: (pin) {
                          print("Completed: $pin");
                          setState(() {
                            smsCode = pin;
                          });
                        },
                      )),
                  // Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // children: List.generate(1, (index) {
                  //   return  Container(
                  //         // padding: const EdgeInsets.all(5),
                  //         width: double.infinity,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10),
                  //           border:
                  //           //  isDarkMode.value
                  //           //     ?
                  //               Border.all(
                  //                   color: const Color(0xff07336d),
                  //                   width: 1)
                  //               // : null,
                  //         ),
                  //         child: TextField(
                  //           textAlign: TextAlign.center,
                  //           controller: otpbox,
                  //           cursorColor: Color(AppColor.orange),
                  //           keyboardType: TextInputType.number,
                  //           maxLines: 6,
                  //           style: GoogleFonts.fredoka(
                  //               color: Color(AppColor.black), fontSize: 14),
                  //           decoration: InputDecoration(
                  //             border: InputBorder.none,
                  //             hintText: "Enter OTP",
                  //             focusColor: Color(AppColor.grey),
                  //             fillColor: Colors.transparent,
                  //             filled: true,
                  //           ),
                  //           onChanged: (pin) {
                  //             print("Completed: $pin");
                  //             setState(() {
                  //               smsCode = pin;
                  //             });
                  //           },
                  //         ),
                  //       );
                  // })),
                  CommanWidget().nextButton(
                      // margin: EdgeInsets.only(left: 15,right: 15),
                      onTap: () {
                        Get.toNamed('/languageScreen');
                      },
                      radius: 10.0,
                      text: 'Verify',
                      height: 45,
                      width: double.infinity)
                ]),
          ),
        ],
      )),
    );
  }
}
