// ignore_for_file: prefer_const_constructors, unused_import

import 'package:get/get.dart';
import 'package:poster_maker/page/Intro/introScreen.dart';
import 'package:poster_maker/page/Preferred_Language/Language.dart';
import 'package:poster_maker/page/SplashScreen/splash.dart';
import 'package:poster_maker/page/bottomnavbar/bottomnavbar.dart';
import 'package:poster_maker/page/bottomnavbar/homepage/addBusiness/addBuisness.dart';
import 'package:poster_maker/page/editBottomNavBar/EditBottomNavbar.dart';
import 'package:poster_maker/page/login/login.dart';
import 'package:poster_maker/page/login/number_varification/varification.dart';
import 'package:poster_maker/page/settingpage/settingScreen.dart';

class RouterForApp {
  static final route = [
    GetPage(
      name: '/splashView',
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/introScreen',
      page: () => IntroScreen(),
    ),
    GetPage(
      name: '/loginScreen',
      page: () => LoginScreen(),
    ),
    GetPage(
      name: '/varificationScreen',
      page: () => VarificationScreen(),
    ),
    GetPage(
      name: '/languageScreen',
      page: () => LanguageScreen(),
    ),
    GetPage(
      name: '/bottomNavBar',
      page: () => BottomNavBarScreen(),
    ),
    // GetPage(
    //   name: '/settingPage',
    //   page: () => SettingPage(),
    // ),
    // GetPage(
    //   name: '/editBottomNavBar',
    //   page: () => EditBottomNavBar(),
    // ),
    // GetPage(
    //   name: '/addBusinessPage',
    //   page: () => AddBusinessPage(),
    // ),

  ];
}
