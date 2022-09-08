import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:sport2/moudle/news_mou.dart';

class Newssportapi {
  static Future<List<NewsMou>> Fetchallnews() async {
    http.Response response = await http.get(
        'https://ophidian-forms.000webhostapp.com/index.php/get%20api%20news.php');
    List<NewsMou> newsMou;
    if (response.statusCode == 200) {
      newsMou = newsMouFromJson(response.body);

      return newsMou;
    }
    {
      return null;
    }
  }
}
