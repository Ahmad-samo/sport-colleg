import 'package:flutter/material.dart';
import 'package:sport2/api/delete_news.dart';
import 'package:sport2/api/newssport.dart';
import 'package:sport2/moudle/news_mou.dart';
import 'package:sport2/screen/add_news.dart';
import 'package:sport2/screen/update_news.dart';
import 'package:sport2/utilites/data_utilite.dart';
import 'package:sport2/utilites/show.dart';

class Twitterfeedad extends StatefulWidget {
  @override
  _TwitterfeedState createState() => _TwitterfeedState();
}

enum popmenu { update, delete }

class _TwitterfeedState extends State<Twitterfeedad> {
  List<int> ids = [];
  Future<List<NewsMou>> future;
  List<NewsMou> items = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = Newssportapi.Fetchallnews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News sport'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<List<NewsMou>>(
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
                            children: [
                              _row1(items[position], position),
                              _row2(items[position], position),
                              _drawline(),
                              _row3(position),
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
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Add_news();
            },
          ));
        },
        elevation: 10.0,
        child: Icon(Icons.add_circle_outlined),
        tooltip: 'click me to addition ',
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }

  Widget _row1(NewsMou itemss, int positionn) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: CircleAvatar(
            backgroundImage: ExactAssetImage('assets/image/place.png'),
            radius: 24,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      items[positionn].addres,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    // SizedBox(
                    //   width: 4,
                    // ),
                    Text(
                      '@' + items[positionn].name,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: _popoutmenu(context, positionn, items[positionn]),
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              items[positionn].date,
              //  'fri,26 mars 2021,16:47',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }

  Widget _row2(NewsMou itemss, int positionn) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 20, bottom: 8),
      child: Text(
        items[positionn].text,
        style: TextStyle(
          fontSize: 16,
          height: 1.2,
          color: Colors.grey.shade900,
        ),
      ),
    );
  }

  Widget _row3(int positionn) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.favorite_sharp,
                  size: 26,
                ),
                color: (ids.contains(positionn)) ? Colors.orange : Colors.grey,
                onPressed: () {
                  if (ids.contains(positionn)) {
                    ids.remove(positionn);
                  } else {
                    ids.add(positionn);
                  }
                  setState(() {});
                },
              ),
              // Text(
              //   '25',
              //   style: TextStyle(color: Colors.grey, fontSize: 16),
              // ),
            ],
          ),
          Container(
            color: Colors.grey,
            height: 55,
            width: 225,
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'write comment here',
                      fillColor: Color.fromRGBO(241, 245, 247, 1),
                      filled: true,
                      contentPadding:
                          EdgeInsets.only(left: 14, top: 22, bottom: 22),
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.send), onPressed: () {})
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawline() {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
      margin: EdgeInsets.only(top: 16),
    );
  }

  Widget _popoutmenu(BuildContext context, int index, NewsMou itemsss) {
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
              return Update_news(items[index]);
            }));
            break;
          case popmenu.delete:
            bool value =
                await Delete_news_api.Deletenews(int.parse(itemsss.id));
            if (value == true) {
              //   print('delete ok');
              items.removeAt(index);
              setState(() {});

              showMessage('Deleted successfully');

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Twitterfeedad()),
                  (Route<dynamic> route) => false);
            }
            // setState() {}
            else {
              // showMessage('no delete sucssesfull');
            }
            // print('the index is $index');
            // return Dialog(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(4),
            //   ),
            //   child: Stack(
            //     overflow: Overflow.visible,
            //     alignment: Alignment.topCenter,
            //     children: [
            //       Container(
            //         height: 200,
            //         child: Padding(
            //           padding: EdgeInsets.fromLTRB(10, 70, 10, 10),
            //           child: Column(
            //             children: [
            //               Text(
            //                 'delete',
            //                 style: TextStyle(
            //                     fontWeight: FontWeight.bold, fontSize: 16),
            //                 textAlign: TextAlign.center,
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Text(
            //                 'are you delete ful all',
            //                 style: TextStyle(fontSize: 16),
            //                 textAlign: TextAlign.center,
            //               ),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   FlatButton(
            //                       onPressed: () async {
            //                         bool value =
            //                             await Delete_news_api.Deletenews(
            //                                 int.parse(itemsss.id));
            //                         if (value == true) {
            //                           //   print('delete ok');
            //                           items.removeAt(index);
            //                           setState(() {});

            //                           Navigator.pushAndRemoveUntil(
            //                               context,
            //                               MaterialPageRoute(
            //                                   builder: (context) =>
            //                                       Twitterfeedad()),
            //                               (Route<dynamic> route) => false);
            //                         }
            //                         // setState() {}
            //                         else {
            //                           // showMessage('no delete sucssesfull');
            //                         }
            //                       },
            //                       child: Text('ok')),
            //                   FlatButton(
            //                       onPressed: () {
            //                         Navigator.push(context,
            //                             MaterialPageRoute(builder: (context) {
            //                           return Twitterfeedad();
            //                         }));
            //                       },
            //                       child: Text('cancel')),
            //                 ],
            //               )
            //             ],
            //           ),
            //         ),
            //       ),
            //       Positioned(
            //         child: CircleAvatar(
            //           backgroundColor: Colors.redAccent,
            //           radius: 60,
            //           child: Icon(
            //             Icons.delete,
            //             size: 50,
            //             color: Colors.white,
            //           ),
            //         ),
            //         top: -60,
            //       )
            //     ],
            //   ),
            // );
            break;
        }
      },
      icon: Icon(Icons.more_vert),
    );
  }
}
