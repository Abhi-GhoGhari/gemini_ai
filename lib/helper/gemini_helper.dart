import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class GeminiHelper {
  GeminiHelper._();
  static final instance = GeminiHelper._();

  Map<String, String> header = {"Content-Type": "application/json"};

  Future<String> fetchData({required String prompt}) async {
    const String apiLink =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyAJKegZ00hiJ-8yn5Z2XxmiqZYm69I-7-o";

    const Map<String, String> headers = {"Content-Type": "application/json"};

    var body = {
      "contents": [
        {
          "parts": [
            {"text": prompt}
          ]
        }
      ]
    };

    try {
      http.Response response = await http.post(
        Uri.parse(apiLink),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        log(data.toString());
        return data['candidates'][0]['content']['parts'][0]['text'].toString();
      } else {
        log("Error: ${response.statusCode} - ${response.reasonPhrase}");
        return "Failed to fetch data. Status code: ${response.statusCode}";
      }
    } catch (e) {
      log("Error invoking Gemini API: $e");
      return "An error occurred: $e";
    }
  }
  /*Future<String> fetchData({required String prompt}) async {
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
        log(data['candidates'][0]['content']['parts'][0]['text'].toString());
        return "";
      }
    } catch (e) {
      var data = e;
      print(
        "Gemini Call Error$e",
      );
    }
    return "No Data Fetch !!!\nTry Again later";
  }
*/
}
