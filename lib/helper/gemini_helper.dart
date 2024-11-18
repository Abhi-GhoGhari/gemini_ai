import 'dart:convert';

import 'package:http/http.dart' as http;

class GeminiHelper {
  GeminiHelper._();
  static final instance = GeminiHelper._();
  String apiLink =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyAJKegZ00hiJ-8yn5Z2XxmiqZYm69I-7-o";

  Map<String, String> header = {"Content-Type": "application/json"};

  Future<void> fetchData({required String prompt}) async {
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
    } catch (e) {
      print(
        "Gemini Call Error$e",
      );
    }
  }
}
