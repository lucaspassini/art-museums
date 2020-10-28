import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:app_art_museums/services/strings.dart';
import 'package:app_art_museums/services/artInfo.dart';

class ArtAPI {
  Future<HarvardArtMuseums> getArt() async {
    var client = http.Client();
    var harvardArtMuseums;

    try {
      var response = await client.get(Strings.imageurl);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        harvardArtMuseums = HarvardArtMuseums.fromJson(jsonMap);
      }
    } catch (Exception) {
      return harvardArtMuseums;
    }
    return harvardArtMuseums;
  }
}
