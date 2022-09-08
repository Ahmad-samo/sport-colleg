import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sport2/moudle/spo_name_mou.dart';

class Spo_name {
  static Future<List<SpoNameMou>> fetchallspo() async {
    http.Response response = await http.get(
        'https://ophidian-forms.000webhostapp.com/index.php/get%20api%20sport.php');
    List<SpoNameMou> sponamemou;
    if (response.statusCode == 200) {
      sponamemou = spoNameMouFromJson(response.body);
      return sponamemou;
    } else {
      return null;
    }
  }
}
