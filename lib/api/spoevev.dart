import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sport2/moudle/spoeven_mou.dart';

class SpoevenApi {
  static Future<List<SpoevenNameMou>> Fetchallsporeven() async {
    http.Response response = await http.get(
        'https://ophidian-forms.000webhostapp.com/index.php/get%20api%20sporteven.php');
    ;
    List<SpoevenNameMou> spoevenNameMou;
    if (response.statusCode == 200) {
      spoevenNameMou = spoevenNameMouFromJson(response.body);
      return spoevenNameMou;
    } else {
      return null;
    }
  }
}
