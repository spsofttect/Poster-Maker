// ignore_for_file: prefer_const_constructors, deprecated_member_use, unrelated_type_equality_checks, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poster_maker/Helper/utlity.dart';

bool isdarkMode = true;

class AppTheme {
  static ThemeMode getCurrentTheme() {
    var brightness = isdarkMode;
    bool isDarkMode = brightness == Brightness.dark;
    bool isLightMode = brightness == Brightness.light;
    return isdarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  static final light = ThemeData.light().copyWith(
    drawerTheme: DrawerThemeData(backgroundColor: isdarkMode.value ? Color(AppColor.bgcolor) : Color(AppColor.white)),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color.fromARGB(255, 235, 235, 235),
    // textSelectionColor: Color(AppColor.bgcolor),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Color(AppColor.bgcolor)),
    iconTheme: IconThemeData(color: Color(AppColor.bgcolor)),
    backgroundColor: Color(AppColor.bgcolor),
    appBarTheme: AppBarTheme(backgroundColor: Color(AppColor.bgcolor)),
    textTheme: TextTheme(
      headline1: GoogleFonts.fredoka(color: Color(AppColor.bgcolor)),
      headline2: GoogleFonts.fredoka(color: Color(AppColor.bgcolor)),
    ),
//animation text label color
    splashColor: const Color(0xffF0F0F3),
    cardColor: Color(AppColor.bgcolor),

    dialogTheme: DialogTheme(backgroundColor: Color(AppColor.bgcolor)),
    primaryColorLight: Color(AppColor.bgcolor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Color(AppColor.bgcolor), selectedItemColor: Color(AppColor.yellow)),
  );
  static final dark = ThemeData.dark().copyWith(
      drawerTheme: DrawerThemeData(backgroundColor: isdarkMode.value ? Color(AppColor.bgcolor) : Color(AppColor.white)),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: Color(AppColor.bgcolor)),
      drawerTheme: DrawerThemeData(
          backgroundColor:
              isdarkMode ? Color(AppColor.bgcolor) : Color(AppColor.white)),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Color(AppColor.bgcolor)),
      scaffoldBackgroundColor: Color(AppColor.bgcolor),
      // textSelectionColor: Color(AppColor.white),
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Color(AppColor.white)),
      backgroundColor: Color(AppColor.white),
      appBarTheme: AppBarTheme(backgroundColor: Color(AppColor.bgcolor)),
      primaryColorLight: Color(0xff191A22),
      dialogTheme: DialogTheme(backgroundColor: Color(AppColor.bgcolor)),
      textTheme: TextTheme(
        headline1: GoogleFonts.fredoka(color: Color(AppColor.white)),
        headline2: GoogleFonts.fredoka(color: Color(AppColor.white)),
      ),
      //animation text label color
      cardColor: Colors.white60,
      splashColor: const Color(0xff2C2F33),

      // accentColor: Colors.white60,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Color(AppColor.bgcolor), selectedItemColor: Color(AppColor.yellow)));
}

// class AppTheme {
//   static ThemeData themeData(bool isDarkTheme, BuildContext context) {
//     return ThemeData(
//       scaffoldBackgroundColor: isDarkTheme
//           ? Color(AppColor.bgcolor)
//           : Color.fromARGB(255, 233, 234, 234),
//       cursorColor: Color(AppColor.orange),
//       splashColor: isDarkTheme
//           ? Color(AppColor.bgcolor)
//           : Color.fromARGB(255, 233, 234, 234),
//       bottomAppBarColor:
//           isDarkTheme ? Color(0xFF201c1c) : Color.fromARGB(255, 233, 234, 234),
//       primarySwatch: Colors.red,
//       primaryColor: isDarkTheme
//           ? Color(AppColor.bgcolor)
//           : Color.fromARGB(255, 233, 234, 234),
//       backgroundColor: isDarkTheme
//           ? Color(AppColor.bgcolor)
//           : Color.fromARGB(255, 214, 215, 216),
//       indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
//       buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
//       hintColor: isDarkTheme ? Color(AppColor.grey) : Color(0xffEECED3),
//       highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
//       hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
//       focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
//       disabledColor: Color(AppColor.grey),
//       textSelectionColor: isDarkTheme ? Colors.white : Colors.bgcolor,
//       cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
//       canvasColor: isDarkTheme ? Colors.bgcolor : Colors.grey[50],
//       brightness: isDarkTheme ? Brightness.dark : Brightness.light,
//       buttonTheme: Theme.of(context).buttonTheme.copyWith(
//           colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
//       appBarTheme: AppBarTheme(
//         elevation: 0.0,
//       ),
//     );
//   }
// }
