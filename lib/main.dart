import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/providers/auth_provider.dart';
import 'package:rental_app/providers/category_provider.dart';
import 'package:rental_app/providers/item_provider.dart';

import 'screen/home_screen.dart';

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
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
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
        ChangeNotifierProvider(create: (context) => ItemProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
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
