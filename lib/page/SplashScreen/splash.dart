import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:poster_maker/Helper/utlity.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('${AssetPath.splash}s1.mp4')
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            _videoPlayerController.play();
          });
    //   // DeviceOrientation
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    // getSelectedLanguage();
    Timer(const Duration(seconds: 5), () async {
      var isIntroduction = await Preferences.preferences.getBool(
          key: PrefernceKey.isIntroductionScreenLoaded, defValue: false);

      if (isIntroduction == true) {
        // introduction screen appears ,go to home if true else login

        Get.offNamed('/loginScreen');
        _toggleScreenShot();
      } else {
        Get.offNamed('/introScreen');
      }
    });
  }

  VideoPlayerController _videoPlayerController;
  bool startedPlaying = true;
  @override
  void dispose() {
    // _videoPlayerController;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      // DeviceOrientation.landscapeLeft,
      // DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  // Future<bool> started() async {
  //   await _videoPlayerController.initialize();
  //   await _videoPlayerController.play();
  //   startedPlaying = true;
  //   return true;
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color(AppColor.bgcolor),
        body: Center(
          child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: VideoPlayer(_videoPlayerController))),
        ));
  }

  bool _isSecureScreen = false;
  Future<void> _toggleScreenShot() async {
    if (_isSecureScreen == true) {
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    } else {
      await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
    }

    setState(() {
      _isSecureScreen = !_isSecureScreen;
    });
  }
}
