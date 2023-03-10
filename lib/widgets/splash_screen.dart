import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/providers/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 1000), () async {
      var isAuth = await context.read<AuthProvider>().hasToken();

      print("isAuth $isAuth");

      if (isAuth) {
        context.go('/home');
      } else {
        context.go('/login');
      }
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
            child: SvgPicture.asset(
              'assets/3idda-svg.svg',
              color: Colors.black,
              width: 330,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          // const Text(
          //   '"Our slogan goes here..."',
          //   style: TextStyle(
          //       fontSize: 20,
          //       fontStyle: FontStyle.italic,
          //       color: Colors.black87),
          // ),
        ],
      )
          .animate(
            delay: Duration(milliseconds: 250),
          )
          .fade(duration: Duration(milliseconds: 250))
          .scale(
              duration: Duration(
                milliseconds: 500,
              ),
              curve: Curves.easeOutCubic,
              begin: Offset(40, 40)),
    );
  }
}
