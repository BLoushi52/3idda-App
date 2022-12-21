import 'package:flutter/material.dart';

class MyUserDrawer extends StatelessWidget {
  const MyUserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.yellow[700], //*   <------ Previously grey[300]
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 115,
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
                'Hi first_name!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          child: ListTile(
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
          onTap: () {},
        ),
        GestureDetector(
          child: ListTile(
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
          onTap: () {},
        ),
        GestureDetector(
          child: ListTile(
            leading: Icon(
              Icons.mail,
              color: Colors.black,
            ),
            title: Text(
              'C O N T A C T    U S',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          onTap: () {},
        ),
        SizedBox(height: 375),
        GestureDetector(
          child: ListTile(
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
          onTap: () {},
        ),
      ]),
    );
  }
}
