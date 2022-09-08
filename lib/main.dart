import 'package:flutter/material.dart';
import 'package:sport2/screen/first_all.dart';
import 'package:sport2/screen/onbording.dart';
import 'package:sport2/screen/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport2/utilites/appthem.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');
  Widget _screen;

  if (seen == null || seen == false) {
    _screen = Onboarding();
  } else {
    _screen = First_all();
  }
  runApp(MyApp(_screen));
}

class MyApp extends StatelessWidget {
  final Widget _screen;
  MyApp(this._screen);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: this._screen,
      theme: Appthem.appthem,
    );
  }
}
