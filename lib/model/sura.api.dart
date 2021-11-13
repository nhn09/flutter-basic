import 'dart:convert';

import 'package:flutter_application_api/model/suraModel.dart';
import 'package:http/http.dart' as http;

class SuraAPI {
  static Future<List<Surah?>> getSurah() async {
    var uri = Uri.https("api.quran.com", "/api/v4/chapters");
    final response = await http.get(uri);
    Map data = jsonDecode(response.body);

    List<Surah?> _surah = (data['chapters'] as List)
        .map((e) =>
            e == null ? null : Surah?.fromJson(e as Map<String, dynamic>))
        .toList();

    return _surah;
  }
}
