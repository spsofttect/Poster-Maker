import 'dart:convert';

var basicAuth = 'Basic ${base64Encode(utf8.encode('user:password'))}';

class ApiUrl {
  static const String homePageApi = "https://spsofttech.com/projects/postermaker2023/api/homescreen_list";
  static const String homePageBannerApi = "https://spsofttech.com/projects/postermaker2023/api/banners";
}
