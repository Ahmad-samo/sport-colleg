import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sport2/moudle/stu_name_mou.dart';
import 'dart:async';

class Stu_name {
  static Future<List<StuNameMou>> Fetchallstu() async {
    http.Response response = await http.get(
        'https://ophidian-forms.000webhostapp.com/index.php/get%20api%20student.php');
    List<StuNameMou> stuNameMou;
    if (response.statusCode == 200) {
      stuNameMou = stuNameMouFromJson(response.body);
      return stuNameMou;
    }
    {
      return null;
    }
  }
}
