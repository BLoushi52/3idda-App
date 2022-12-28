import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
              context.watch<AuthProvider>().username != null
                  ? Text(
                      'Welcome ${context.watch<AuthProvider>().firstName}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      'Log in for more access!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ),
        ),
        if (context.watch<AuthProvider>().username != null)
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
            onTap: () {
              context.push('/myfavorite');
              Navigator.pop(context);
            },
          ),
        if (context.watch<AuthProvider>().username != null)
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
        if (context.watch<AuthProvider>().username == null)
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
            onTap: () {
              context.push('/login');
              Navigator.pop(context);
            },
          ),
        if (context.watch<AuthProvider>().username == null)
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
            onTap: () {
              context.push('/register');
              Navigator.pop(context);
            },
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
          onTap: () {
            context.push("/contactus");
            Navigator.pop(context);
          },
        ),
        Spacer(),
        if (context.watch<AuthProvider>().username != null)
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 75),
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
            ),
            onTap: () {
              context.read<AuthProvider>().logout();
              Navigator.pop(context);
            },
          ),
      ]),
    );
  }
}
