import 'dart:convert';

import 'package:http/http.dart' as http;

class Delete_news_api {
  static Future<bool> Deletenews(int id) async {
    Map<String, dynamic> param = {
      "id": id,
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
