import 'package:http/http.dart' as http;

class Send_team {
  static Future<bool> Sendteam(String name) async {
    Map<String, dynamic> param = {
      "name_team": name,
    };
    print("the param is $param");
    http.Response response = await http.post(
        "https://ophidian-forms.000webhostapp.com/index.php/post%20api%20team.php",
        body: param);
    bool clgNameMou;
    print("the sd;lamsdl; ${response.statusCode}");
    if (response.statusCode == 200) {
      return true;
    }
    {
      return false;
    }
  }
}
