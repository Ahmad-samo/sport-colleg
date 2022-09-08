import 'package:flutter/material.dart';
import 'package:sport2/api/send_student.dart';
import 'package:sport2/api/spo_name.dart';
import 'package:sport2/moudle/clg_name_mou.dart';
import 'package:sport2/screen/allavents.dart';
import 'package:sport2/screen/admin_event.dart';
import 'package:sport2/screen/classloading.dart';
import 'package:sport2/moudle/spo_name_mou.dart';
import 'package:sport2/utilites/data_utilite.dart';
import 'package:sport2/utilites/show.dart';

class Login extends StatefulWidget {
  ClgNameMou clgNameMou;
  Login({this.clgNameMou});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController teamController = TextEditingController();
  LoadingDialog loadingDialog;
  SpoNameMou onevalue;
  //SpoNameMou spoNameMou;
  Future<List<SpoNameMou>> future;
  List<SpoNameMou> spoNameMou = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = Spo_name.fetchallspo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('register'),
        centerTitle: false,
      ),
      drawer: Drawer(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: 300,
                height: 50,
                child: TextField(
                  autocorrect: true,
                  cursorColor: Colors.black87,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.left,
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'الاسم الثلاثي',
                    hintStyle: TextStyle(
                      fontSize: 12,
                    ),
                    labelText: 'الاسم الثلاثي',
                    labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red.shade200),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: Icon(
                      Icons.person_add_alt,
                      color: Colors.red.shade300,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: 300,
                height: 50,
                child: TextField(
                  autocorrect: true,
                  cursorColor: Colors.black87,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.right,
                  controller: numberController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'الرقم الجامعي',
                    hintStyle: TextStyle(
                      fontSize: 12,
                    ),
                    labelText: 'الرقم الجامعي ',
                    labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red.shade200),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: Icon(
                      Icons.confirmation_number_outlined,
                      color: Colors.red.shade300,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // SizedBox(
              //   height: 10,
              // ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: 300,
                height: 50,
                child: TextField(
                  autocorrect: true,
                  cursorColor: Colors.black87,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.right,
                  textInputAction: TextInputAction.next,
                  controller: teamController,
                  decoration: InputDecoration(
                    hintText: 'اسم الفريق ',
                    hintStyle: TextStyle(
                      fontSize: 12,
                    ),
                    labelText: 'اسم الفريق  ',
                    labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red.shade200),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: Icon(
                      Icons.group_work,
                      color: Colors.red.shade300,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: 300,
                height: 50,
                child: TextField(
                  autocorrect: true,
                  cursorColor: Colors.black87,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.right,
                  textInputAction: TextInputAction.next,
                  controller: ageController,
                  decoration: InputDecoration(
                    labelText: 'العمر  ',
                    labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red.shade200),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: Icon(
                      Icons.bar_chart_sharp,
                      color: Colors.red.shade300,
                    ),
                  ),
                ),
              ),
              FutureBuilder<List<SpoNameMou>>(
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
                            spoNameMou = snapshot.data;
                            print("th daa us ${snapshot.data}");
                            return Container(
                              //padding: EdgeInsets.symmetric(horizontal: 10),
                              width: 300,
                              height: 50,
                              margin: EdgeInsets.all(20),
                              child: Padding(
                                padding: EdgeInsets.only(top: 20, left: 10),
                                child: DropdownButton<SpoNameMou>(
                                  hint: Padding(
                                    padding: const EdgeInsets.all(90.0),
                                    child: Text(
                                      'select your sport',
                                    ),
                                  ),
                                  value: onevalue,
                                  underline: Container(
                                    height: 1,
                                    color: Colors.red.shade300,
                                  ),
                                  onChanged: (SpoNameMou newvalue) {
                                    setState(() {
                                      onevalue = newvalue;
                                    });
                                  },
                                  items: spoNameMou
                                      .map<DropdownMenuItem<SpoNameMou>>(
                                          (SpoNameMou valuee) {
                                    return DropdownMenuItem<SpoNameMou>(
                                      child: Text(valuee.sportName),
                                      value: valuee,
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          }
                        }
                    }
                  }),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 150,
                height: 50,
                child: RaisedButton(
                  color: Colors.red.shade800,
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  onPressed: () async {
                    showMessage('successfully registered');
                    print('asassa');
                    bool value = await SendStudent.sendStudent(
                        nameController.text,
                        numberController.text,
                        ageController.text,
                        teamController.text,
                        onevalue.sportName);

                    if (value == true) {
                      //   showMessage('successfully registered');
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Allevents()),
                          (Route<dynamic> route) => false);
                    } else {
                      showMessage('Please enter all information');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
