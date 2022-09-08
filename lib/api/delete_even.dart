import 'dart:convert';

import 'package:http/http.dart' as http;

class Del_even {
  static Future<bool> Deleteeven(int id) async {
    Map<String, dynamic> param = {"id": id};
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
