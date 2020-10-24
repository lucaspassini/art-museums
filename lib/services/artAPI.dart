import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_art_museums/services/artInfo.dart';

class ArtAPI {
  static const String url =
      'https://api.harvardartmuseums.org/image?apikey=4a57a5f5-426f-4dc1-b8c9-8a17cde9d86a';

  static Future<List<Record>> getArt() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Record> list = parseArt(response.body);
      }
    } catch (e) {
      throw new Exception(e.toString());
    }
  }

  static List<Record> parseArt(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Record>((json) => Record.fromJson(json)).toList();
  }
}
