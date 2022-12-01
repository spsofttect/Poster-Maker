// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print, file_names

import 'dart:convert';

import 'package:get/get.dart';
import 'package:poster_maker/Helper/apiprovider.dart';
import 'package:poster_maker/Helper/url.dart';

import 'package:poster_maker/Model/image.dart';

class AddImageController extends GetxController {
  var photoList = <Photo>[].obs;
  @override
  void onInit() {
    getPhoto();
    super.onInit();
  }

  void getPhoto() {
    ApiProvider apiProvider = ApiProvider();

    apiProvider.getApiCall(ApiUrl.photo).then((value) {
      var photoList = json.decode(value.body);
      print(photoList);

      var responsedata = photoList['download_url'];
      photoList = Photo.getData(responsedata);

      print(photoList.length);
    });
  }
}
