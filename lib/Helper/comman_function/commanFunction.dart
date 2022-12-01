// ignore_for_file: deprecated_member_use, unused_import, avoid_print, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>Get Image<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
final picker = ImagePicker();
var isImgaeSelected = false.obs;
var isPanSelected = false.obs;
var isFrontSelected = false.obs;
var isBackSelected = false.obs;
var image = File("").obs;
var pancard = File("").obs;
var aadharFront = File("").obs;
var aadharBack = File("").obs;

Future getImages({source}) async {
  final pickedFile = await picker.getImage(source: source);

  if (pickedFile != null) {
    isImgaeSelected.value = true;
    image.value = File(pickedFile.path);
  } else {
    print('No image selected.');
  }
}

Future getAadharFront() async {
  final pickedFile = await picker.getImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    isFrontSelected.value = true;
    aadharFront.value = File(pickedFile.path);
  } else {
    print('No image selected.');
  }
}

Future getPancard() async {
  final pickedFile = await picker.getImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    isPanSelected.value = true;
    pancard.value = File(pickedFile.path);
  } else {
    print('No image selected.');
  }
}

Future getAadharBack() async {
  final pickedFile = await picker.getImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    isBackSelected.value = true;
    aadharBack.value = File(pickedFile.path);
  } else {
    print('No image selected.');
  }
}
