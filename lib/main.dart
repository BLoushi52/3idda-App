import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/model/address_model.dart';
import 'package:rental_app/model/item_model.dart';
import 'package:rental_app/pages/confirmation_page.dart';
import 'package:rental_app/pages/favorite_detail_page.dart';
import 'package:rental_app/providers/address_provider.dart';
import 'package:rental_app/providers/auth_provider.dart';
import 'package:rental_app/providers/favorite_provider.dart';
import 'package:rental_app/providers/myitems_provider.dart';
import 'package:rental_app/providers/myorder_provider.dart';
import 'package:rental_app/pages/add_address_page.dart';
import 'package:rental_app/pages/add_item_page.dart';
import 'package:rental_app/pages/edit_address_page.dart';
import 'package:rental_app/pages/edit_item_page.dart';
import 'package:rental_app/pages/login_page.dart';
import 'package:rental_app/pages/myaddress_page.dart';
import 'package:rental_app/pages/myfavorite_page.dart';
import 'package:rental_app/pages/myitems_page.dart';
import 'package:rental_app/pages/myitems_details_page.dart';
import 'package:rental_app/util/custom_material_colors.dart';
import '../widgets/splash_screen.dart';
import 'package:rental_app/providers/category_provider.dart';
import 'package:rental_app/providers/item_provider.dart';
import 'model/favorite_model.dart';
import 'pages/homescreen_page.dart';
import 'pages/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
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
      path: '/favorite_details',
      builder: (context, state) => FavoriteDetail(
        favorite: state.extra as Favorite,
      ),
    ),
    GoRoute(
      path: '/additem',
      builder: (context, state) => AddItemPage(),
    ),
    GoRoute(
      path: '/myitem',
      builder: (context, state) => MyItemsView(),
    ),
    GoRoute(
      path: '/edititem',
      builder: (context, state) => EditItemPage(
        item: state.extra as Item,
      ),
    ),
    GoRoute(
      path: '/myaddress',
      builder: (context, state) => MyAddressesView(),
    ),
    GoRoute(
      path: '/addaddress',
      builder: (context, state) => AddAddressPage(),
    ),
    GoRoute(
      path: '/editaddress',
      builder: (context, state) => EditAddressPage(
        address: state.extra as Address,
      ),
    ),
    GoRoute(
      path: '/myfavorite',
      builder: (context, state) => MyFavoriteView(),
    ),
    GoRoute(
      path: '/confirm',
      builder: (context, state) => ConfirmationPage(
        item: state.extra as Item,
      ),
    ),
  ],
);

class MyApp extends StatelessWidget {
  MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ItemProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => MyItemProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => MyOrderProvider()),
        ChangeNotifierProvider(create: (context) => AddressProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        title: '3idda Equipment Rental App',
        // themeMode: ThemeMode.dark,
        // darkTheme: ThemeData.dark(),
        theme: ThemeData(
            fontFamily: "Roboto",
            primarySwatch: CustomMaterialColor.createMaterialColor(
              Color.fromRGBO(251, 192, 45, 1),
            ),
            primaryColor: Colors.yellow[700],
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.yellow[700],
            )),
      ),
    );
  }
}
