import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/model/item_model.dart';
import 'package:rental_app/providers/auth_provider.dart';
import 'package:rental_app/providers/myitems_provider.dart';
import 'package:rental_app/screen/login_page.dart';
import 'package:rental_app/screen/pages/add_item_page.dart';
import 'package:rental_app/screen/pages/edit_item_page.dart';
import 'package:rental_app/screen/pages/equipment.dart';
import 'package:rental_app/screen/pages/myitems.dart';
import 'package:rental_app/screen/pages/myitems_details.dart';
import '../widgets/splash_screen.dart';
import 'package:rental_app/providers/category_provider.dart';
import 'package:rental_app/providers/item_provider.dart';
import 'screen/home_screen.dart';
import 'screen/register_page.dart';

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
      path: '/register',
      builder: (context, state) => RegisterPage(),
    ),
    GoRoute(
      path: '/itemdetails',
      builder: (context, state) => ItemDetails(
        item: state.extra as Item,
      ),
    ),
    GoRoute(
      path: '/additem',
      builder: (context, state) => AddItemPage(),
    ),
    GoRoute(
      path: '/myitem',
      builder: (context, state) => MyEquip(),
    ),
    GoRoute(
      path: '/edititem',
      builder: (context, state) => EditItemPage(
        item: state.extra as Item,
      ),
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
        ChangeNotifierProvider(create: (context) => MyItemProvider()),
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
