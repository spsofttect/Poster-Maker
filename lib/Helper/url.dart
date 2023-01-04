import 'dart:convert';

var basicAuth = 'Basic ${base64Encode(utf8.encode('user:password'))}';

class ApiUrl {
  static const String homePageApi = "https://spsofttech.com/projects/postermaker2023/api/homescreen_list";
  static const String homePageBannerApi = "https://spsofttech.com/projects/postermaker2023/api/banners";
  static const String multiplePageApi = "https://spsofttech.com/projects/postermaker2023/api/home_poster_json";
  static const BASE_URL = "https://spsofttech.com/projects/sample_api";
  static const String photo = "https://picsum.photos/v2/list";
}
