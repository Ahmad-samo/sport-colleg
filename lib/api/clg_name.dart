import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sport2/moudle/clg_name_mou.dart';

import 'dart:async';

class Clg_name {
  static Future<List<ClgNameMou>> Fetchallcolge() async {
    http.Response response = await http.get(
        'https://ophidian-forms.000webhostapp.com/index.php/get%20api%20colleg.php');
    List<ClgNameMou> clgNameMou;
    if (response.statusCode == 200) {
      clgNameMou = clgNameMouFromJson(response.body);

      return clgNameMou;
    }
    {
      return null;
    }
  }
}
