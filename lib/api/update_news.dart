import 'dart:convert';

import 'package:http/http.dart' as http;

class Update_news_api {
  static Future<bool> Updatenews(
      int id, String adress, String text, String date, String name) async {
    Map<String, dynamic> param = {
      "id": id,
      "addres": adress,
      "text": text,
      "date": date,
      "name": name
    };
    var _body = jsonEncode(param);
    print("the param is $param");
    http.Response response = await http.post(
        "https://ophidian-forms.000webhostapp.com/index.php/post%20api%20news.php",
        body: _body);

    print("the sd;lamsdl; ${response.statusCode}");
    if (response.statusCode == 200) {
      return true;
    }
    {
      return false;
    }
  }
}
