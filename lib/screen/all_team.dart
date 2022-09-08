import 'package:flutter/material.dart';
import 'package:sport2/api/team_name.dart';
import 'package:sport2/moudle/tam_stu_mou.dart';
import 'package:sport2/moudle/team_name_mou.dart';
import 'package:sport2/utilites/data_utilite.dart';

class all_team extends StatefulWidget {
  @override
  _all_teamState createState() => _all_teamState();
}

class _all_teamState extends State<all_team> {
  List<int> ids = [];
  Future<List<TemStuMou>> future;
  List<TemStuMou> items = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = Teamstu_name.fetchallteam();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEAM'),
        centerTitle: false,
      ),
      body: FutureBuilder<List<TemStuMou>>(
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
                        child: Container(
                          height: 110,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _dawtitle('Name student'),
                                    _dawtitle2('Name team'),
                                  ],
                                ),
                                _drawdevider(),
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
        },
      ),
    );
  }

  Widget _drawsinglerow(TemStuMou itemsss, int index) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(builder: (contxt)=>));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              itemsss.studentName,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Text(
              itemsss.nameTeam,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            // IconButton(
            //   icon: Icon(
            //     Icons.favorite_sharp,
            //     size: 26,
            //   ),
            //   color: (ids.contains(index))
            //       ? Colors.orangeAccent
            //       : Colors.grey.shade200,
            //   onPressed: () {
            //     if (ids.contains(index)) {
            //       ids.remove(index);
            //     } else {
            //       ids.add(index);
            //     }
            //     setState(() {});
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Widget _drawdevider() {
    return Container(
      height: 3,
      width: double.infinity,
      color: Colors.grey.shade300,
    );
  }

  Widget _dawtitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.blueAccent.shade400,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }

  Widget _dawtitle2(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.lightBlueAccent.shade400,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }
}
