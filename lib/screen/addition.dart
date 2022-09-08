import 'package:flutter/material.dart';

import 'package:sport2/api/send_event.dart';
import 'package:sport2/screen/admin_event.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

import 'package:sport2/screen/allavents.dart';
import 'package:sport2/utilites/show.dart';

class Addition extends StatefulWidget {
  @override
  _AdditionState createState() => _AdditionState();
}

class _AdditionState extends State<Addition> {
  TextEditingController name = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController datee = TextEditingController();
  PickedFile _image;
  File file;
  final ImagePicker _piker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADDITION'),
        centerTitle: false,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueGrey.shade200,
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
                textInputAction: TextInputAction.next,
                controller: name,
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
                    borderSide: BorderSide(color: Colors.blue.shade900),
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
                textInputAction: TextInputAction.next,
                controller: type,
                decoration: InputDecoration(
                  hintText: 'نوع الحدث',
                  hintStyle: TextStyle(
                    fontSize: 12,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade900),
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
                textInputAction: TextInputAction.next,
                controller: datee,
                decoration: InputDecoration(
                  hintText: 'تاريخ الحدث  ',
                  hintStyle: TextStyle(
                    fontSize: 12,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade900),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue.shade900),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            importimage(),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: RaisedButton(
                color: Colors.lightBlueAccent.shade200,
                child: Text(
                  'SAVE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
                onPressed: () async {
                  print('not into');
                  bool value = await Send_even.Sendeven(
                      name.text, type.text, datee.text, "image");
                  if (value == true) {
                    showMessage('Added successfully');
                    print('into');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Admin_event();
                    }));
                  } else {
                    showMessage('Information does not match');
                    print('you errrrrrror');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  importimage() {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            child: Image(
              image: _image == null
                  ? ExactAssetImage('assets/image/bg4.jpg')
                  : FileImage(File(_image.path)),
              fit: BoxFit.cover,
            ),
            width: 240,
            height: 120,
          ),
          Expanded(
            child: Positioned(
              bottom: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: ((Builder) => bottomsheet()));
                },
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.teal,
                  size: 28.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  bottomsheet() {
    return Container(
      height: 135,
      width: MediaQuery.of(context).size.width,
      // padding: EdgeInsets.only(bottom: 20),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Flexible(
        child: Column(
          children: [
            Text(
              'chose photo',
              style: TextStyle(fontSize: 26),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton.icon(
                      onPressed: () {
                        take(ImageSource.camera);
                      },
                      icon: Icon(Icons.camera),
                      label: Text('camera')),
                  FlatButton.icon(
                      onPressed: () {
                        take(ImageSource.gallery);
                      },
                      icon: Icon(Icons.image),
                      label: Text('gallery')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future take(ImageSource sourcee) async {
    final pickedFile = await _piker.getImage(source: sourcee);
    setState(() {
      _image = pickedFile;
    });
  }
}
