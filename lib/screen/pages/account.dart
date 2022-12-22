import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: ElevatedButton(
                onPressed: () {
                  context.push('/myaddress');
                },
                child: Text("my addresses"))),
      ],
    );
  }
}
