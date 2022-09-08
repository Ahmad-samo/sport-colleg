import 'package:flutter/material.dart';
import 'package:sport2/api/send_event.dart';
import 'package:sport2/api/update_even.dart';
import 'package:sport2/moudle/spoeven_mou.dart';
import 'package:sport2/screen/admin_event.dart';
import 'package:sport2/utilites/show.dart';

import 'allavents.dart';

class Update extends StatefulWidget {
  SpoevenNameMou spoevenNameMou;
  int index;

  Update(this.spoevenNameMou);
  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController nameControoler = TextEditingController();
  TextEditingController typeControoler = TextEditingController();
  TextEditingController dateControoler = TextEditingController();
  // int index;

  @override
  void initState() {
    super.initState();
    // index = widget.spoevenNameMou.id as int;
    nameControoler.text = widget.spoevenNameMou.evenName;
    typeControoler.text = widget.spoevenNameMou.type;
    dateControoler.text = widget.spoevenNameMou.date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPDATE'),
        centerTitle: false,
        backgroundColor: Colors.deepPurple.shade300,
      ),
      backgroundColor: Colors.deepPurple.shade200,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: 300,
              height: 50,
              child: TextField(
                autocorrect: true,
                cursorColor: Colors.black87,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.right,
                controller: nameControoler,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'اسم الحدث ',
                  hintStyle: TextStyle(
                    fontSize: 12,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple.shade700),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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
                keyboardType: TextInputType.text,
                textAlign: TextAlign.right,
                controller: typeControoler,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'نوع الحدث ',
                  hintStyle: TextStyle(
                    fontSize: 12,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple.shade700),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
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
                keyboardType: TextInputType.datetime,
                textAlign: TextAlign.right,
                controller: dateControoler,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'تاريخ الحدث ',
                  hintStyle: TextStyle(
                    fontSize: 12,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple.shade700),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: RaisedButton(
                color: Colors.deepPurpleAccent,
                child: Text(
                  ' Save Update ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
                onPressed: () async {
                  showMessage('Edited successfully');
                  bool value = await Update_even.Updateeven(
                    int.parse(widget.spoevenNameMou.id),
                    nameControoler.text,
                    typeControoler.text,
                    dateControoler.text,
                    "hhjo",
                  );
                  print('the id is ${widget.spoevenNameMou.id}');

                  if (value == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Admin_event();
                    }));
                  } else {
                    print('you errrrrrror');
                  }
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) {
                  //     return Admin_event();
                  //   },
                  // ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
