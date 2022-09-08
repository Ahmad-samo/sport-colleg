import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sport2/moudle/response_mou.dart';

class Responseapi {
  static Future<List<ResponseMou>> Fetchallresponse() async {
    http.Response response = await http.get(
        'https://ophidian-forms.000webhostapp.com/index.php/get%20api%20respons.php');

    List<ResponseMou> responseMou;
    if (response.statusCode == 200) {
      responseMou = responseMouFromJson(response.body);
      return responseMou;
    } else {
      return null;
    }
  }
}
