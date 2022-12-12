// ignore_for_file: prefer_function_declarations_over_variables, file_names, avoid_print

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/apiprovider.dart';
import 'package:poster_maker/page/bottomnavbar/bottomnavbar.dart';

String yourCountryCode = "";
int currentpage = 0;
RxInt start = 60.obs;
String buttonName = "Resend";
String verificationIdFinal = "";
String smsCode = "";
bool otpVisibility = false;
String initialCountry = 'IN';
AuthClass authClass = AuthClass();
TextEditingController otpbox = TextEditingController();
AnimationController storyAnimationController;
TextEditingController phoneController = TextEditingController();
Timer _timer;

startTimer() {
  const onsec = Duration(seconds: 1);
  _timer = Timer.periodic(onsec, (timer) {
    if (start.value == 0) {
      _timer.cancel();
      // wait = false;

    } else {
      if (start > 0) {
        start.value--;
      }
    }
  });
}

setData(verificationId) {
  verificationIdFinal = verificationId;
  startTimer();
}

selectedIndex(index) {
  currentpage = index;
}

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final storage = const FlutterSecureStorage();

  Future<void> signOut({BuildContext context}) async {
    try {
      // await _googleSignIn.signOut();
      await _auth.signOut();
      await storage.delete(key: "token");
    } catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void storeTokenAndData(UserCredential userCredential) async {
    print("storing token and data");
    // await storage.write(
    //     key: "token", value: userCredential.credential!.token.toString());
    await storage.write(
        key: "usercredential", value: userCredential.toString());
  }

  Future<String> getToken() async {
    return await storage.read(key: "token");
  }

  Future<void> verifyPhoneNumber(
      String phoneNumber, BuildContext context, Function setData) async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      showTostMessage(message: "Verification Completed");
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      Get.back();
      showTostMessage(message: "FirebaseAuthException$exception");
    };
    PhoneCodeSent codeSent = (String verificationID, [forceResnedingtoken]) {
      showTostMessage(message: "Verification Code sent on the phone number");
      currentpage = 1;
      Get.back();
      setData(verificationID);
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationID) {
      // showTostMessage("Time out");
    };
    try {
      await _auth.verifyPhoneNumber(
          timeout: const Duration(seconds: 60),
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      // showTostMessage(e.toString());
      showTostMessage(message: 'Verification Failed');
    }
  }

  Future<void> signInwithPhoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      storeTokenAndData(userCredential);
      // loginApiCall();
      Get.offAll(const BottomNavBarScreen());
      showTostMessage(message: "logged In");
    } catch (e) {
      Get.back();
      Get.back();
      showTostMessage(message: "Incorrect OTP");
    }
  }
}
