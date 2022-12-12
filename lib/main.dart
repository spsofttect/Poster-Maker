// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, unused_import, prefer_const_constructors_in_immutables

import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'Helper/app_theme.dart';
import 'Helper/route.dart';

GetIt locator = GetIt.instance;
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // foundation Error
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };

  runApp(MyApp());
  // DeviceOrientation
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //  Do not capture Screenshot and video
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Do not capture Screenshot and video
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    return GetMaterialApp(
      //  translations: AppLocalization(),
      // darkTheme: ThemeData.dark(),
      // themeMode: ThemeMode.dark,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: AppTheme.getCurrentTheme(),
      locale: Get.deviceLocale,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.circularReveal,
      getPages: RouterForApp.route,
      initialRoute: '/splashView',
    );
  }
}

// Future<void> secureScreen() async {
//   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
// }
