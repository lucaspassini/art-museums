import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:app_art_museums/api/strings.dart';
import 'package:app_art_museums/api/model/artInfo.dart';

class ArtAPI {
  Future<Record> getArt() async {
    var client = http.Client();
    var records;

    try {
      var response = await client.get(Strings.image_url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        records = Record.fromJson(jsonMap);
      }
    } catch (Exception) {
      return records;
    }
    return records;
  }
}
