import 'package:flutter/material.dart';
import 'package:sport2/screen/all_team.dart';
import 'package:sport2/screen/first_all.dart';
import 'package:sport2/screen/news_sport.dart';

import 'package:sport2/moudle/nav_menuitem.dart';

class Navigationdrawe extends StatefulWidget {
  @override
  _NavigationdraweState createState() => _NavigationdraweState();
}

class _NavigationdraweState extends State<Navigationdrawe> {
  List<navmenuitem> navitem = [
    navmenuitem('Sport News', () => Twitterfeed()),
    navmenuitem('All team', () => all_team()),
    navmenuitem('log out', () => First_all()),
  ];

  List<String> navmenu = [
    'explore',
    'headline news',
    'read later',
    'videos',
    'photos',
    'settings',
    'logout'
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
