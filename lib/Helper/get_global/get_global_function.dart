import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

RxBool isAnimatedPage = false.obs;

void animatePageEffectOver() {
  Timer(const Duration(milliseconds: 100), () {
    isAnimatedPage.value = false;
  });
}

Widget heroWidgetAnimatePage({required String img}) {
  return Hero(
    tag: img,
    child: CachedNetworkImage(
      imageUrl: img,
      placeholder: (context, url) => const SizedBox(),
    ),
  );
}
