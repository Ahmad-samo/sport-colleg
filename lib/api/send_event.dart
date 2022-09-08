import 'dart:convert';

import 'package:http/http.dart' as http;

class Send_even {
  static Future<bool> Sendeven(
      String name, String typee, String date, dynamic image) async {
    Map<String, dynamic> param = {
      "even_name": name,
      "type": typee,
      "date": date,
      "image": image
    };
    var _body = jsonEncode(param);
    print("the param is $param");
    http.Response response = await http.post(
        "https://ophidian-forms.000webhostapp.com/index.php/post%20api%20sporteven.php",
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
