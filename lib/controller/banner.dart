import 'dart:convert';
import 'dart:io';

import 'package:astro/controller/common/baseurl.dart';
import 'package:astro/controller/common/errormassage.dart';

import 'package:astro/model/banner.dart';

import 'package:http/http.dart' as http;

class BannerApiServices {
  Future<BannerM> question() async {
    var responseJson;
    try {
      var uri = Uri.https(
        baseurl,
        'astro/banner.json',
      );

      var response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);
        responseJson = BannerM.fromJson(jsonBody);
      } else {
        final jsonBody = json.decode(response.body);

        responseJson = jsonBody;
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}
