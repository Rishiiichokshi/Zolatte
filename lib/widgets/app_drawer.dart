import 'package:flutter/material.dart';
import 'package:zolatte/screens/fieldPage.dart';
import 'package:zolatte/widgets/tabBarPage.dart';

import '../screens/retrieveDataPage.dart';


class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.data_exploration_rounded),
            title: Text('Submit Data'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Success(),
                ),
              );
            },
          ),

          Divider(),
          ListTile(
            leading: Icon(Icons.note_alt_rounded),
            title: Text('Fetch Data'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RetrieveDataPage(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Exit'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TabBarPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
