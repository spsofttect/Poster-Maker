import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:poster_maker/Helper/url.dart';

class MultipleJsonPageAPIHelper {
  MultipleJsonPageAPIHelper._();
  static final MultipleJsonPageAPIHelper multipleJsonPageAPIHelper = MultipleJsonPageAPIHelper._();

  Future<List> fetchMultipleJsonData({required String posterId}) async {
    http.Response res = await http.post(
      Uri.parse(ApiUrl.multiplePageApi),
      headers: <String, String>{'authorization': basicAuth},
      body: {
        "poster_id": posterId,
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
