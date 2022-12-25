import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rental_app/constraints.dart';
import 'package:rental_app/screen/pages/account.dart';
import 'package:rental_app/screen/pages/Home.dart';
import 'package:rental_app/screen/pages/myitems.dart';
import 'package:rental_app/screen/pages/myorder.dart';
import 'package:rental_app/widgets/my_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Position? _position;
  List<Placemark>? placemarks;

  void _getCurrentLocation() async {
    Position position = await _determinePosition();
    placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    setState(() {
      _position = position;

      print(placemarks);
    });
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    UserHome(),
    MyOrderView(),
    MyItemsView(),
    UserAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: _getCurrentLocation,
              tooltip: 'Increment',
              child: const Icon(Icons.add)),
          key: scaffoldKey,
          backgroundColor: myDefaultBackground,
          appBar: AppBar(
              leadingWidth: 68,
              toolbarHeight: 40,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Container(
                    height: 40,
                    width: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow[700]),
                    // color: Colors.yellow[700],
                    child: CupertinoButton(
                      padding: EdgeInsets.only(right: 0),
                      child: Icon(
                        Icons.notifications_outlined,
                        color: Colors.black,
                        size: 25,
                      ), //* Icon(Icons.notifications_active_outlined)
                      onPressed: () {
                        // Navigator.push(context, route);
                      },
                    ),
                  ),
                )
              ],
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.pin_drop_outlined),
                  SizedBox(width: 5),
                  _position != null && placemarks != null
                      ? AutoSizeText(
                          '${placemarks?.first.street}',
                          style: TextStyle(fontSize: 10),
                          minFontSize: 12,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      : AutoSizeText('No Location Data'),
                ],
              ),
              backgroundColor: Colors.grey[300],
              foregroundColor: Colors.black,
              elevation: 0,
              leading: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Container(
                      width: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.yellow[700]),
                      child: CupertinoButton(
                          padding: EdgeInsets.only(right: 0),
                          child: Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            if (scaffoldKey.currentState!.isDrawerOpen) {
                              scaffoldKey.currentState!.closeDrawer();
                              //close drawer, if drawer is open
                            } else {
                              scaffoldKey.currentState!.openDrawer();
                              //open drawer, if drawer is closed
                            }
                          })))),
          drawer:
              MyDrawer(), //*    <----- CHANGE DRAWER WIDGET IF GUEST/SIGNED IN
          // bottomNavigationBar: _bottomNav(sizingInformation), //* <-- OLD BOTTOM NAV
          // bottomNavigationBar: BottomNavigationBar(   //*  <-- NAV BAR 2
          //   selectedItemColor: Colors.black,
          //   currentIndex: _selectedIndex,
          //   onTap: _navigateBottomBar,
          //   type: BottomNavigationBarType.fixed,
          //   backgroundColor: Colors.grey[300],
          //   elevation: 0,
          //   items: [
          //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.list_alt), label: 'My Rentals'),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.handyman_outlined), label: 'My Equipment'),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.person_outlined), label: 'Account'),
          //   ],
          // ),

          bottomNavigationBar: Container(
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8, bottom: 20, left: 15, right: 15),
              // const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: GNav(
                backgroundColor: Colors.grey.shade300,
                color: Colors.grey.shade600,
                activeColor: Colors.black,
                tabBackgroundColor: Colors.yellow.shade700,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                gap: 8,
                onTabChange: _navigateBottomBar,
                selectedIndex: _selectedIndex,
                tabs: const [
                  GButton(
                    icon: Icons.home_outlined,
                    iconSize: 28,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.list_alt,
                    iconSize: 25,
                    text: 'My Rentals',
                  ),
                  GButton(
                    icon: Icons.handyman_outlined,
                    text: 'My Equipment',
                  ),
                  GButton(
                    icon: Icons.person_outlined,
                    iconSize: 26,
                    text: 'Account',
                  ),
                ],
              ),
            ),
          ),
          body: _pages[_selectedIndex]);
    });
  }
}
