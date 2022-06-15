import 'dart:convert';
import 'dart:io';

import 'package:astro/controller/common/baseurl.dart';
import 'package:astro/controller/common/errormassage.dart';
import 'package:astro/model/astrologer.dart';
import 'package:astro/model/question.dart';

import 'package:http/http.dart' as http;

class QuestionApiServices {
  Future<QuestionM> question() async {
    var responseJson;
    try {
      var uri = Uri.https(
        baseurl,
        'astro/question.json',
      );

      var response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);
        responseJson = QuestionM.fromJson(jsonBody);
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
