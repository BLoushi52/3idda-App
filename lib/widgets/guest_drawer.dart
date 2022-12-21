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
                'Hi Guest!',
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
              Icons.login,
              color: Colors.black,
            ),
            title: Text(
              'L O G I N',
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
              Icons.app_registration,
              color: Colors.black,
            ),
            title: Text(
              'R E G I S T E R',
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
        //
      ]),
    );
  }
}
