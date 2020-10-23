import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:app_art_museums/services/artInfo.dart';
import 'package:app_art_museums/services/strings.dart';

class ArtAPI {
  Future<HarvardArtMuseums> getArt() async {
    var client = http.Client();
    var _getArt;

    try {
      var response = await client.get(Strings.imageURL);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        _getArt = HarvardArtMuseums.fromJson(jsonMap);
      }
    } catch (Exception) {
      return _getArt;
    }
    return _getArt;
  }
}
