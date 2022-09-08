import 'package:flutter/material.dart';
import 'package:sport2/api/newssport.dart';
import 'package:sport2/moudle/news_mou.dart';
import 'package:sport2/utilites/data_utilite.dart';

class Twitterfeed extends StatefulWidget {
  @override
  _TwitterfeedState createState() => _TwitterfeedState();
}

class _TwitterfeedState extends State<Twitterfeed> {
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
              children: [
                Text(
                  items[positionn].addres,
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '@' + items[positionn].name,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              items[positionn].date,
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
            width: 150,
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
}
