import 'dart:convert';

import 'package:http/http.dart' as http;

class SendStudent {
  static Future<bool> sendStudent(String name, String number, String age,
      String nameteam, String sport) async {
    Map<String, dynamic> param = {
      "student_name": name,
      "num": int.parse(number),
      "age": int.parse(age),
      "name_team": nameteam,
      "sport_name": sport
    };
    var _body = jsonEncode(param);
    print("the param is $param");
    http.Response response = await http.post(
        "https://ophidian-forms.000webhostapp.com/index.php/post%20api%20student.php",
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
