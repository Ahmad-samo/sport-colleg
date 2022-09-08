import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport2/screen/allavents.dart';
import 'package:sport2/screen/homescreen.dart';
import 'package:sport2/screen/login_admin.dart';

class First_all extends StatefulWidget {
  @override
  _First_allState createState() => _First_allState();
}

class _First_allState extends State<First_all> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
              image: AssetImage('assets/image/basket.gif'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SPORT APP',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 40,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: RaisedButton(
                      splashColor: Colors.orange,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      color: Colors.redAccent,
                      child: Text(
                        'in user',
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                      onPressed: () async {
                        SharedPreferences instant =
                            await SharedPreferences.getInstance();
                        if (instant.getBool("login") == true) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Allevents();
                          }));
                        } else {
                          instant.setBool("login", true);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Homescreen();
                          }));
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: RaisedButton(
                      splashColor: Colors.orange,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      color: Colors.redAccent,
                      child: Text(
                        'in admin',
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Login_admin();
                        }));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
