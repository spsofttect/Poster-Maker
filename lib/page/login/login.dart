// ignore_for_file: implementation_imports, unnecessary_import, prefer_const_constructors, sized_box_for_whitespace, avoid_print

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:poster_maker/Helper/apiprovider.dart';
import 'package:poster_maker/Helper/commanwidget.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/Helper/widget.dart';
import 'package:poster_maker/page/bottomnavbar/bottomnavbar.dart';
import 'package:poster_maker/page/login/Auth_Service.dart';
import 'package:poster_maker/page/login/number_varification/varification.dart';

String yourCountryCode = "";
int currentpage = 0;
int start = 60;
String smsCode = "";
TextEditingController otpbox = TextEditingController();
AuthClass authClass = AuthClass();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  String buttonName = "Resend";
  String verificationIdFinal = "";
  bool otpVisibility = false;
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  AuthClass authClass = AuthClass();
  TextEditingController otpbox = TextEditingController();
  // Telephony telephony = Telephony.instance;
  AnimationController storyAnimationController;
  Timer _timer;

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
    storyAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    storyAnimationController.repeat();
    // DeviceOrientation
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  startTimer() {
    const onsec = Duration(seconds: 1);
    _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          _timer.cancel();
          // wait = false;
        });
      } else {
        if (start > 0) {
          setState(() {
            start--;
          });
        }
      }
    });
  }

  setData(verificationId) {
    verificationIdFinal = verificationId;
    startTimer();
  }

  selectedIndex(index) {
    setState(() {
      currentpage = index;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    startTimer;
    storyAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (currentpage == 1) {
            Get.back();
            Get.back();
            currentpage = 0;
            Get.to(LoginScreen());
          }

          return false;
        },
        child: Scaffold(
          // backgroundColor: Get.isDarkMode ? Colors.white : Color(AppColor.bgcolor),
          body: SafeArea(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                if (currentpage == 0)
                  login(context)
                else if (currentpage == 1)
                  verification()
              ],
            ),
          ),
        ));
  }

  Widget login(BuildContext context) {
    return Column(
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
          style: GoogleFonts.fredoka(
              // color: Get.isDarkMode
              //     ? Color(AppColor.grey)
              //     : Color(AppColor.white),
              fontWeight: FontWeight.w400,
              fontSize: 40),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
        SizedBox(
          child: Center(
            child: Text(
              'Enter Your Mobile Number To \nReceive A Verification Code',
              style: GoogleFonts.fredoka(
                  fontWeight: FontWeight.w400,
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
                    onTap: () async {
                      if (phoneController.text.isNotEmpty) {
                        setState(() {
                          start = 60;
                          // wait = true;
                          buttonName = "Resend";
                        });
                        loding();
                        authClass.verifyPhoneNumber(
                            "$yourCountryCode}", context, setData);
                        // _introController.device();
                        await selectedIndex(1);
                      } else if (phoneController.text.isEmpty) {
                        await selectedIndex(0);
                        showTostMessage(message: 'Enter Your PhoneNumber');
                        print('>>>>>>>>>>>>>Emply<<<<<<<<<<<<');
                      }
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
        //       style: GoogleFonts.fredoka(
        //           fontSize: Get.height * 0.02,
        //           color: Color(AppColor.yellow),
        //           fontFamily: AppFont.robotoBold)),
        //   TextSpan(
        //       text: 'Sign In',
        //       style: GoogleFonts.fredoka(
        //           fontSize: Get.height * 0.02,
        //           color: Color(AppColor.orange),
        //           fontFamily: AppFont.robotoBold))p
        // ]))
      ],
    );
  }

  Widget verification() {
    return Column(
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
          style: GoogleFonts.fredoka(
              // color: Get.isDarkMode
              //     ? Color(AppColor.grey)
              //     : Color(AppColor.white),
              fontWeight: FontWeight.w400,
              fontSize: 40),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
        SizedBox(
          child: Center(
            child: Text(
              'Enter A 4 Digit Number That \n Was Sent To ${yourCountryCode.split(phoneController.text)[0]} ${phoneController.text}',
              style: GoogleFonts.fredoka(
                  fontWeight: FontWeight.w400,
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
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(AppColor.black).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: otpbox,
                      cursorColor: Color(AppColor.orange),
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
                SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Send OTP again in ",
                            style: GoogleFonts.fredoka(
                                fontSize: 12, color: Colors.grey),
                          ),
                          TextSpan(
                            text: "00:$start",
                            style: GoogleFonts.fredoka(
                                fontSize: 14, color: Colors.grey),
                          ),
                          TextSpan(
                            text: " sec ",
                            style: GoogleFonts.fredoka(
                                fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      )),
                      SizedBox(height: 5),
                      GestureDetector(
                        onTap:
                            // wait
                            //       ? null
                            //       :
                            () async {
                          setState(() {
                            start = 60;
                            // wait = true;
                            buttonName = "Resend";
                          });

                          authClass.verifyPhoneNumber(
                              "$yourCountryCode ${phoneController.text.trim()}",
                              context,
                              setData);
                        },
                        child: Center(
                            child: Text("$buttonName !",
                                style: GoogleFonts.fredoka(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w500))),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                CommanWidget().nextButton(
                    // margin: EdgeInsets.only(left: 15,right: 15),
                    onTap: () {
                      loding();
                      authClass.signInwithPhoneNumber(
                          verificationIdFinal, smsCode, context);
                    },
                    radius: 10.0,
                    text: 'Verify',
                    height: 45,
                    width: double.infinity)
              ]),
        ),
      ],
    );
  }

  Widget mobileNumberBox() {
    return Column(
      children: [
        Container(
          // margin: EdgeInsets.only(top: 7),
          height: 50,
          decoration: BoxDecoration(
              color: Color(AppColor.black).withOpacity(0.5),
              borderRadius: BorderRadius.circular(15)),
          alignment: Alignment.center,
          child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              yourCountryCode = number.phoneNumber;
            },
            onInputValidated: (bool value) {
              print(value);
            },
            onSaved: (PhoneNumber number) {
              print('On Saved: $number');
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
              hintStyle: GoogleFonts.fredoka(
                color: Color(AppColor.white).withOpacity(0.3),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
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
            textStyle: GoogleFonts.fredoka(
              color: Color(AppColor.white),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            initialValue: number,
            textFieldController: phoneController,
            formatInput: false,
            textAlignVertical: TextAlignVertical.bottom,
            selectorTextStyle: GoogleFonts.fredoka(
              color: Color(AppColor.white),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            // keyboardType:
            //     TextInputType.numberWithOptions(signed: true, decimal: true),
            keyboardType: TextInputType.number,
            inputBorder: InputBorder.none,
            onFieldSubmitted: (val) {
              print("-----------------Your Number--------------$val");
            },
          ),
        ),
      ],
    );
  }

  Future<dynamic> loding() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: AnimatedBuilder(
                animation: storyAnimationController,
                builder: (BuildContext context, Widget child) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    height: Get.width * 0.25,
                    width: Get.width * 0.25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("${AssetPath.splash}loader.gif"),
                            fit: BoxFit.contain)),
                  );
                  // Stack(
                  //   alignment: Alignment.center,
                  //   children: [
                  //     Transform.rotate(
                  //       angle: storyAnimationController.value * 2 * pi,
                  //       child:
                  //       Container(
                  //         height: Get.width * 0.25,
                  //         width: Get.width * 0.25,
                  //         decoration: BoxDecoration(
                  //             shape: BoxShape.circle,
                  //             image: DecorationImage(
                  //                 image: AssetImage(
                  //                     "${AssetPath.splash}loader.gif"),
                  //                 fit: BoxFit.cover)),
                  //       ),
                  //     ),
                  //     Container(
                  //       height: Get.width * 0.11,
                  //       width: Get.width * 0.11,
                  //       decoration: BoxDecoration(
                  //           image: DecorationImage(
                  //               image: AssetImage(
                  //                   "${AssetPath.splash}logobgLoader.png"),
                  //               fit: BoxFit.cover)),
                  //     ),
                  //   ],
                  // );
                },
              ),
            ),
          );
        });
  }
}
