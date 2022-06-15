import 'dart:convert';
import 'dart:io';

import 'package:astro/controller/common/baseurl.dart';
import 'package:astro/controller/common/errormassage.dart';
import 'package:astro/model/astrologer.dart';
import 'package:astro/model/reportsm.dart';

import 'package:http/http.dart' as http;

class ReportsApiServices {
  Future<ReportsM> reports() async {
    var responseJson;
    try {
      var uri = Uri.https(
        baseurl,
        'astro/reports.json',
      );

      var response = await http.get(uri);
      final jsonBody = jsonDecode(response.body);
      responseJson = ReportsM.fromJson(jsonBody);

      if (response.statusCode == 200) {
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
