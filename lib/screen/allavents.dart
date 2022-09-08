import 'package:flutter/material.dart';
import 'package:sport2/api/spoevev.dart';
import 'package:sport2/moudle/spoeven_mou.dart';
import 'package:sport2/screen/all_team.dart';
import 'package:sport2/screen/news_sport.dart';
import 'package:sport2/utilites/data_utilite.dart';

import 'navigator_drawer.dart';

class Allevents extends StatefulWidget {
  @override
  _AlleventsState createState() => _AlleventsState();
}

//SpoevenApi
class _AlleventsState extends State<Allevents> {
  Future<List<SpoevenNameMou>> future;
  List<SpoevenNameMou> items = [];

  List<int> number = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 1000; i++) number.add(0);
    future = SpoevenApi.Fetchallsporeven();
  }

  List<pagemodel> pages;

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
        title: Text('All Events'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Navigationdrawe(),
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
                            child: InkWell(
                              onDoubleTap: () {
                                setState(() {
                                  number[position]++;
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _drawsinglerow(items[position], position),
                                ],
                              ),
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(
      //       builder: (context) {
      //         return all_team();
      //       },
      //     ));
      //   },
      //   elevation: 10.0,
      //   child: Icon(Icons.plus_one_sharp),
      //   tooltip: 'click me to addition ',
      //   backgroundColor: Colors.red,
      // ),
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
                Text(
                  itemsss.evenName,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
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
}

class pagemodel {
  // String _titles;
  String _image;
  //IconData _icons;

  pagemodel(this._image);

  String get image => _image;
}
