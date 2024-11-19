import 'dart:convert';

import 'package:http/http.dart' as http;

class GeminiHelper {
  GeminiHelper._();
  static final instance = GeminiHelper._();
  String apiLink =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyAJKegZ00hiJ-8yn5Z2XxmiqZYm69I-7-o";

  Map<String, String> header = {"Content-Type": "application/json"};

  Future<String> fetchData({required String prompt}) async {
    var body = {
      {
        "contents": [
          {
            "parts": [
              {"text": prompt}
            ]
          }
        ]
      }
    };
    try {
      http.Response response = await http.post(
        Uri.parse(apiLink),
        headers: header,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        return data['candidates'][0]['content']['parts'][0]['text'].toString();
      }
    } catch (e) {
      print(
        "Gemini Call Error$e",
      );
    }
    return "No Data Fetch !!!\nTry Again later";
  }
}
