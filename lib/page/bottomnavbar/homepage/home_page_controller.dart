import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../url/url.dart';

class HomePageAPIHelper {
  HomePageAPIHelper._();
  static final HomePageAPIHelper homePageAPIHelper = HomePageAPIHelper._();

  Future<List> fetchHomePageBannerList() async {
    http.Response res = await http.post(
      Uri.parse(ApiUrl.homePageBannerApi),
      headers: <String, String>{'authorization': basicAuth},
      body: {},
    );

    List allData = [];
    if (res.statusCode == 200) {
      Map homepageData = await jsonDecode(res.body);
      allData = homepageData['data'];
    }
    return allData;
  }

  Future<List> fetchHomePageNewData() async {
    http.Response res = await http.post(
      Uri.parse(ApiUrl.homePageApi),
      headers: <String, String>{'authorization': basicAuth},
      body: {
        "type": "0",
        "page": "1",
      },
    );

    List allData = [];
    if (res.statusCode == 200) {
      Map homepageData = await jsonDecode(res.body);
      allData = homepageData['data'];
    }
    return allData;
  }

  Future<List> fetchHomePageBannerData() async {
    http.Response res = await http.post(
      Uri.parse(ApiUrl.homePageApi),
      headers: <String, String>{'authorization': basicAuth},
      body: {
        "type": "1",
        "page": "1",
      },
    );

    List allData = [];
    if (res.statusCode == 200) {
      Map homepageData = await jsonDecode(res.body);
      allData = homepageData['data'];
    }
    return allData;
  }

  Future<List> fetchHomePagePostData() async {
    http.Response res = await http.post(
      Uri.parse(ApiUrl.homePageApi),
      headers: <String, String>{'authorization': basicAuth},
      body: {
        "type": "2",
        "page": "1",
      },
    );

    List allData = [];
    if (res.statusCode == 200) {
      Map homepageData = await jsonDecode(res.body);
      allData = homepageData['data'];
    }
    return allData;
  }

  Future<List> fetchHomePageStoryData() async {
    http.Response res = await http.post(
      Uri.parse(ApiUrl.homePageApi),
      headers: <String, String>{'authorization': basicAuth},
      body: {
        "type": "3",
        "page": "1",
      },
    );

    List allData = [];
    if (res.statusCode == 200) {
      Map homepageData = await jsonDecode(res.body);
      allData = homepageData['data'];
    }
    return allData;
  }
}
