import 'package:http/http.dart' as http;
import 'package:app_art_museums/api/strings.dart';

class API {
  void getArt() async {
    var client = http.Client();

    var response = await client.get(Strings.image_url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
    }
  }
}
