import 'package:flutter/material.dart';
import 'package:sport2/moudle/nav_menuitem.dart';
import 'package:sport2/screen/add_news.dart';
import 'package:sport2/screen/first_all.dart';
import 'package:sport2/screen/news_admin.dart';

import 'all_team.dart';

class Drawer_admin extends StatefulWidget {
  @override
  _Drawer_adminState createState() => _Drawer_adminState();
}

class _Drawer_adminState extends State<Drawer_admin> {
  List<navmenuitem> navitem = [
    navmenuitem('Sport News', () => Twitterfeedad()),
    navmenuitem('All team', () => all_team()),
    navmenuitem('log out', () => First_all()),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 75, left: 25),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(
                  navitem[position].title,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 22,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return navitem[position].destention();
                      },
                    ),
                  );
                },
              ),
            );
          },
          itemCount: navitem.length,
        ),
      ),
    );
  }
}
