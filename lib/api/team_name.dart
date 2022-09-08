import 'package:http/http.dart' as http;
import 'package:sport2/moudle/tam_stu_mou.dart';
import 'dart:convert';

import 'package:sport2/moudle/team_name_mou.dart';

class Teamstu_name {
  static Future<List<TemStuMou>> fetchallteam() async {
    http.Response response = await http.get(
        'https://ophidian-forms.000webhostapp.com/index.php/get%20api%20testud.php');
    List<TemStuMou> temStuMou;
    if (response.statusCode == 200) {
      temStuMou = temStuMouFromJson(response.body);
      return temStuMou;
    } else {
      return null;
    }
  }
}
