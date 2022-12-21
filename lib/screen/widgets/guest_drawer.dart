import 'package:flutter/material.dart';

class MyGuestDrawer extends StatelessWidget {
  const MyGuestDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.yellow[700], //*   <------ Previously grey[300]
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 100,
            bottom: 50,
          ),
          child: Column(
            children: [
              Icon(
                Icons.person,
                size: 75,
                color: Colors.black,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Hi (username)!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: Text(
            'D A S H B O A R D',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.list,
            color: Colors.black,
          ),
          title: Text(
            'O R D E R S',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.favorite,
            color: Colors.black,
          ),
          title: Text(
            'F A V O R I T E S',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.menu_book,
            color: Colors.black,
          ),
          title: Text(
            'A D D R E S S   B O O K',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Colors.black,
          ),
          title: Text(
            'S E T T I N G S',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: Colors.black,
          ),
          title: Text(
            'L O G O U T',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ]),
    );
  }
}
