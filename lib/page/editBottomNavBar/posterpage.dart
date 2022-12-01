import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poster_maker/page/bottomnavbar/appbar/Appbar.dart';

class PosterPage extends StatefulWidget {
  const PosterPage({Key key}) : super(key: key);

  @override
  State<PosterPage> createState() => _PosterPageState();
}

class _PosterPageState extends State<PosterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          commanAppbar(
              pageName: "PosterPage",
              ontap: () {
                Get.back();
              }),
              
        ],
      ),
    );
  }
}
