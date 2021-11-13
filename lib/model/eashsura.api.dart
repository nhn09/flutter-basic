import 'dart:convert';

import 'package:flutter_application_api/model/eachSurah.dart';
import 'package:flutter_application_api/pages/widgets/each.dart';
import 'package:http/http.dart' as http;

class EachSuraAPI {
  static int id = 0;
  static String details = "";

  static void setter(int a) {
    id = a;
  }

  static String getter() {
    return details;
  }

  static Future<InsideSurah?> getInsideSurah() async {
    var uri = Uri.https("api.quran.com", "/api/v4/chapters/$id/info");
    final response = await http.get(uri);

    Map data = jsonDecode(response.body);

    print(data['chapter_info']['short_text']);

    var _InsideSurah = new InsideSurah(
        details: data['chapter_info']['short_text'],
        namesimple: data['chapter_info']['id'].toString());

    details = data['chapter_info']['short_text'];
    Details.settext(details);

    return _InsideSurah;
  }
}
