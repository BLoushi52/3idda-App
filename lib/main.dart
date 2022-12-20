import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/providers/auth_provider.dart';
import 'package:rental_app/providers/equipment_provider.dart';
import 'package:rental_app/screen/login_page.dart';
import 'package:rental_app/screen/widgets/splash_screen.dart';

import 'screen/home_screen.dart';
import 'screen/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var authProvider = AuthProvider();
  var isAuth = await authProvider.hasToken();

  print("isAuth $isAuth");

  runApp(MyApp(
    authProvider: authProvider,
  ));
}

final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => SplashScreen(),
    ),
    // GoRoute(
    //   path: '/home',
    //   builder: (context, state) => HomeScreen(),
    // ),

    GoRoute(
      path: '/home',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Change the opacity of the screen using a Curve based on the the animation's
            // value
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInBack).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignupPage(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  final AuthProvider authProvider;
  MyApp({
    required this.authProvider,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EquipmentProvider()),
        ChangeNotifierProvider(create: (context) => authProvider),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        title: '3idda Equipment Rental App',
        theme: ThemeData(
          fontFamily: "Roboto",
        ),
      ),
    );
  }
}
