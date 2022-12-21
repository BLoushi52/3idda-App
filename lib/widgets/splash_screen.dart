import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 7500), () {
      context.go('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[700],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/3idda-logo-black.png',
                width: 300,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            const Text(
              '"Our slogan goes here..."',
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87),
            ),
          ],
        )
            .animate(
              delay: Duration(milliseconds: 1000),
            )
            .fade(duration: Duration(milliseconds: 3000))
        // .scale(duration: Duration(milliseconds: 500)),
        );
  }
}
