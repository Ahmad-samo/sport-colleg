import 'package:flutter/material.dart';
import 'package:sport2/api/delete_even.dart';
import 'package:sport2/api/spoevev.dart';
import 'package:sport2/moudle/spo_name_mou.dart';
import 'package:sport2/moudle/spoeven_mou.dart';
import 'package:sport2/screen/addition.dart';
import 'package:sport2/screen/drawer_admin.dart';
import 'package:sport2/screen/update.dart';
import 'package:sport2/utilites/data_utilite.dart';
import 'package:sport2/utilites/show.dart';

class Admin_event extends StatefulWidget {
  SpoevenNameMou spoevenNameMou;

  @override
  _Admin_eventState createState() => _Admin_eventState();
}

enum popmenu { update, delete }

class _Admin_eventState extends State<Admin_event> {
  Future<List<SpoevenNameMou>> future;
  List<SpoevenNameMou> items = [];
  SpoNameMou spoNameMou;
  List<pagemodel> pages;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = SpoevenApi.Fetchallsporeven();
  }

  void addpage() {
    pages = List<pagemodel>();
    pages.add(pagemodel('assets/image/n1.jpg'));
    pages.add(pagemodel('assets/image/n2.jpg'));
    pages.add(pagemodel('assets/image/n3.jpg'));
    pages.add(pagemodel('assets/image/n4.jpg'));
    pages.add(pagemodel('assets/image/n5.jpg'));
    pages.add(pagemodel('assets/image/n6.jpg'));
    pages.add(pagemodel('assets/image/n7.jpg'));
    pages.add(pagemodel('assets/image/n8.jpg'));
    pages.add(pagemodel('assets/image/n9.jpg'));
    pages.add(pagemodel('assets/image/n10.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    addpage();

    return Scaffold(
      appBar: AppBar(
        title: Text('admin'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer_admin(),
      body: FutureBuilder<List<SpoevenNameMou>>(
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
                    items = snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.all(8),
                      itemBuilder: (context, position) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _drawsinglerow(items[position], position),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: items.length,
                    );
                  }
                }
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Addition();
            },
          ));
        },
        elevation: 10.0,
        child: Icon(Icons.plus_one_sharp),
        tooltip: 'click me to addition ',
        backgroundColor: Colors.red,
      ),
    );
  }

  Widget _drawsinglerow(SpoevenNameMou itemsss, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Image(
              image: ExactAssetImage(pages[index].image),
              fit: BoxFit.cover,
            ),
            width: 100,
            height: 100,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      itemsss.evenName,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    _popoutmenu(context, index, items[index]),
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(itemsss.type),
                    Row(
                      children: [
                        Icon(Icons.timer),
                        Text(itemsss.date),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _popoutmenu(BuildContext context, int index, SpoevenNameMou itemsss) {
    return PopupMenuButton<popmenu>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<popmenu>(
            value: popmenu.update,
            child: Text('Update'),
          ),
          PopupMenuItem<popmenu>(
            value: popmenu.delete,
            child: Text('Delete'),
          ),
        ];
      },
      onSelected: (popmenu menu) async {
        switch (menu) {
          case popmenu.update:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Update(items[index]);
            }));
            break;
          case popmenu.delete:
            print('the index is $index');

            bool value = await Del_even.Deleteeven(int.parse(itemsss.id));
            if (value == true) {
              //   print('delete ok');
              items.removeAt(index);

              setState(() {});
              showMessage('Deleted successfully');
              Navigator.push(context, MaterialPageRoute(builder: (contex) {
                return Admin_event();
              }));
            }
            // setState() {}f\
            else {
              print('no delete');
            }
            break;
        }
      },
      icon: Icon(Icons.more_vert),
    );
  }
}

class pagemodel {
  // String _titles;
  String _image;
  //IconData _icons;

  pagemodel(this._image);

  String get image => _image;
}
