import 'package:flutter/material.dart';
import 'package:sport2/api/response.dart';
import 'package:sport2/moudle/clg_name_mou.dart';
import 'package:sport2/moudle/response_mou.dart';
import 'package:sport2/screen/admin_event.dart';
import 'package:sport2/utilites/data_utilite.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login_admin extends StatefulWidget {
  @override
  _Login_adminState createState() => _Login_adminState();
}

class _Login_adminState extends State<Login_admin> {
  // String onevalue;
  Future<List<ResponseMou>> future;
  List<ResponseMou> responseMou = [];
  ResponseMou onevalue;
  TextEditingController numbercont = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = Responseapi.Fetchallresponse();
  }

  bool hidenpass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Admin'),
      ),
      body: FutureBuilder<List<ResponseMou>>(
        future: future,
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return connectionerror();
              break;
            case ConnectionState.active:
              return loading();
              break;
            case ConnectionState.waiting:
              return loading();
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                return error(snapshot.error);
              } else {
                if (snapshot.hasData) {
                  responseMou = snapshot.data;
                  return Container(
                    margin: EdgeInsets.all(20),
                    // padding: EdgeInsets.only(left: 60),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          imageview(),
                          Padding(
                            padding: EdgeInsets.only(top: 20, left: 10),
                            child: DropdownButton<ResponseMou>(
                              hint: Text('select your university'),
                              value: onevalue,
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (ResponseMou newvalue) {
                                setState(() {
                                  onevalue = newvalue;
                                });
                              },
                              items: responseMou
                                  .map<DropdownMenuItem<ResponseMou>>(
                                      (ResponseMou valuee) {
                                return DropdownMenuItem<ResponseMou>(
                                  child: Text(valuee.colleg),
                                  value: valuee,
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: 250,
                            height: 50,
                            child: TextField(
                              autocorrect: true,
                              cursorColor: Colors.black87,
                              keyboardType: TextInputType.number,
                              obscureText: hidenpass,
                              textAlign: TextAlign.left,
                              controller: numbercont,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: _passview,
                                  child: Icon(Icons.visibility),
                                ),
                                prefixIcon: Icon(Icons.security),
                                labelText: 'الرقم السري ',
                                labelStyle: TextStyle(
                                    fontSize: 20, color: Colors.black),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red.shade200),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: SizedBox(
                              width: 100,
                              height: 50,
                              child: RaisedButton(
                                color: Colors.red.shade800,
                                child: Text(
                                  'Log in',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    letterSpacing: 1,
                                  ),
                                ),
                                onPressed: () {
                                  // ignore: unrelated_type_equality_checks
                                  if (onevalue.number
                                          .compareTo(numbercont.text) ==
                                      0) {
                                    showMessage(
                                        'You are logged in successfully');
                                    print('daaaaa');

                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Admin_event()),
                                        (Route<dynamic> route) => false);
                                  } else {
                                    showMessage(
                                        'Sorry, the information is wrong');
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              }
          }
        },
      ),
    );
  }

  void _passview() {
    if (hidenpass == true) {
      hidenpass = false;
    } else {
      hidenpass = true;
    }
    setState(() {});
  }

  Widget imageview() {
    return Center(
      child: CircleAvatar(
        radius: 80.0,
        backgroundImage: ExactAssetImage('assets/image/aleppo.jpg'),
      ),
    );
  }

  showMessage(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.values[1],
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blueGrey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
