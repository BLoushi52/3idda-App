import 'package:flutter/material.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'My Account',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
