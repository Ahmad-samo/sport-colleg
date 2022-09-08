import 'package:flutter/material.dart';
import 'package:sport2/api/update_news.dart';
import 'package:sport2/moudle/news_mou.dart';
import 'package:sport2/utilites/show.dart';

import 'news_admin.dart';

class Update_news extends StatefulWidget {
  NewsMou newsMou;
  Update_news(this.newsMou);
  @override
  _Update_newsState createState() => _Update_newsState();
}

class _Update_newsState extends State<Update_news> {
  TextEditingController adresscon = TextEditingController();
  TextEditingController namecon = TextEditingController();
  TextEditingController datecon = TextEditingController();
  TextEditingController textcon = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    adresscon.text = widget.newsMou.addres;
    namecon.text = widget.newsMou.name;
    datecon.text = widget.newsMou.date;
    textcon.text = widget.newsMou.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD_NEWS'),
      ),
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: 300,
                height: 50,
                child: TextFormField(
                  autocorrect: true,
                  cursorColor: Colors.black87,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.right,
                  textInputAction: TextInputAction.next,
                  controller: adresscon,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.teal,
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    )),
                    prefixIcon:
                        Icon(Icons.short_text_outlined, color: Colors.green),
                    labelText: "address news",
                    helperText: "write here adrees short",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: 300,
                height: 50,
                child: TextFormField(
                  autocorrect: true,
                  cursorColor: Colors.black87,
                  keyboardType: TextInputType.datetime,
                  controller: datecon,
                  textAlign: TextAlign.right,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.teal,
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.green.shade700,
                      width: 2,
                    )),
                    prefixIcon:
                        Icon(Icons.history_outlined, color: Colors.green),
                    labelText: "date news",
                    helperText: "write here news sport",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: 300,
                height: 50,
                child: TextFormField(
                  autocorrect: true,
                  cursorColor: Colors.black87,
                  keyboardType: TextInputType.text,
                  controller: namecon,
                  textAlign: TextAlign.right,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.teal,
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.green.shade800,
                      width: 2,
                    )),
                    prefixIcon: Icon(Icons.person, color: Colors.green),
                    labelText: "by from",
                    helperText: "write here name written",
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: 300,
                height: 150,
                child: TextFormField(
                  autocorrect: true,
                  cursorColor: Colors.black87,
                  controller: textcon,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.right,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.teal,
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.green.shade700,
                      width: 2,
                    )),
                    prefixIcon:
                        Icon(Icons.text_snippet_outlined, color: Colors.green),
                    labelText: "text news",
                    helperText: "write here news sport",
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: RaisedButton(
                  color: Colors.red.shade500,
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  onPressed: () async {
                    showMessage('Edited successfully');
                    bool value = await Update_news_api.Updatenews(
                        int.parse(widget.newsMou.id),
                        adresscon.text,
                        textcon.text,
                        datecon.text,
                        namecon.text);
                    if (value == true) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Twitterfeedad();
                      }));
                    } else {
                      print('noo insert');
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
