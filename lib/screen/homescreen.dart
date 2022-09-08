import 'package:flutter/material.dart';
import 'package:sport2/moudle/clg_name_mou.dart';
import 'package:sport2/screen/login.dart';
import 'package:sport2/api/clg_name.dart';
import 'dart:async';
import 'package:sport2/utilites/data_utilite.dart';
import 'package:sport2/utilites/show.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Future<List<ClgNameMou>> future;
  List<ClgNameMou> clgnamemou = [];
  ClgNameMou onevalue;
  int id = -1;
  initState() {
    future = Clg_name.Fetchallcolge();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
        centerTitle: false,
      ),
      drawer: Drawer(),
      body: FutureBuilder<List<ClgNameMou>>(
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
                    clgnamemou = snapshot.data;
                    print("th daa us ${snapshot.data}");
                    return Container(
                      margin: EdgeInsets.all(20),
                      child: Center(
                        child: Column(
                          children: [
                            imageview(),
                            Padding(
                              padding: EdgeInsets.only(top: 20, left: 10),
                              child: DropdownButton<ClgNameMou>(
                                hint: Text('select your university'),
                                value: onevalue,
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (ClgNameMou newvalue) {
                                  setState(() {
                                    onevalue = newvalue;
                                  });
                                },
                                items: clgnamemou
                                    .map<DropdownMenuItem<ClgNameMou>>(
                                        (ClgNameMou valuee) {
                                  return DropdownMenuItem<ClgNameMou>(
                                    child: Text(valuee.collegName),
                                    value: valuee,
                                  );
                                }).toList(),
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
                                    'ok',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  onPressed: () {
                                    showMessage('Done');
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return Login(
                                          clgNameMou: onevalue,
                                        );
                                      },
                                    ));
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
          }),
    );
  }

  Widget imageview() {
    return Center(
      child: CircleAvatar(
        radius: 80.0,
        backgroundImage: ExactAssetImage('assets/image/aleppo.jpg'),
      ),
    );
  }
}
