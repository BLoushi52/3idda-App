import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rental_app/constraints.dart';
import 'package:rental_app/screen/pages/Home.dart';
import 'package:rental_app/screen/pages/account.dart';
import 'package:rental_app/screen/pages/equipment.dart';
import 'package:rental_app/screen/pages/myitems.dart';
import 'package:rental_app/screen/pages/myorder.dart';
import 'package:rental_app/screen/pages/rentals.dart';
import 'package:rental_app/widgets/my_drawe.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Future<void> _handleRefresh() async {
  //   return await context.read<ItemProvider>().loadItems();
  // }

  // TextEditingController? textEditingController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // int _navBarPageSelector = 0;

  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    UserHome(),
    MyOrderView(),
    MyEquip(),
    UserAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
      return Scaffold(
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
                    child: IconButton(
                      icon: Icon(Icons
                          .notifications_outlined), //* Icon(Icons.notifications_active_outlined)
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
                  Text(
                    'Surra, Kuwait',
                    style: TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.pin_drop_outlined),
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
                      child: IconButton(
                          icon: Icon(Icons.menu),
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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: GNav(
                backgroundColor: Colors.grey.shade300,
                color: Colors.grey.shade600,
                activeColor: Colors.black,
                tabBackgroundColor: Colors.yellow.shade700,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                gap: 8,
                onTabChange: _navigateBottomBar,
                selectedIndex: _selectedIndex,
                tabs: const [
                  GButton(
                    icon: Icons.home_outlined,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.list_alt,
                    text: 'My Rentals',
                  ),
                  GButton(
                    icon: Icons.handyman_outlined,
                    text: 'My Equipment',
                  ),
                  GButton(
                    icon: Icons.person_outlined,
                    text: 'Account',
                  ),
                ],
              ),
            ),
          ),
          body: _pages[_selectedIndex]);
    });
  }

  // Widget _bottomNav(SizingInformation sizingInformation) {
  //   return Container(
  //     height: sizingInformation.screenSize.height * 0.09,
  //     decoration: BoxDecoration(color: Colors.grey[300]),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: <Widget>[
  //         _navBarItem(
  //           title: 'Home',
  //           image: 'assets/home.png',
  //           onPressed: () {
  //             setState(() {
  //               _navBarPageSelector = 0;
  //             });
  //           },
  //           selectedItemColor: _navBarPageSelector == 0
  //               ? Colors.yellow[700]
  //               : Colors.grey[300],
  //           selectedItemIconTextColor:
  //               _navBarPageSelector == 0 ? Colors.black : Colors.black,
  //         ),
  //         _navBarItem(
  //           title: 'My Tools',
  //           image: 'assets/tools-icon.png',
  //           onPressed: () {
  //             setState(() {
  //               _navBarPageSelector = 1;
  //             });
  //           },
  //           selectedItemColor: _navBarPageSelector == 1
  //               ? Colors.yellow[700]
  //               : Colors.grey[300],
  //           selectedItemIconTextColor:
  //               _navBarPageSelector == 1 ? Colors.black : Colors.black,
  //         ),
  //         _navBarItem(
  //           title: 'Chat',
  //           image: 'assets/chat.png',
  //           onPressed: () {
  //             setState(() {
  //               _navBarPageSelector = 2;
  //             });
  //           },
  //           selectedItemColor: _navBarPageSelector == 2
  //               ? Colors.yellow[700]
  //               : Colors.grey[300],
  //           selectedItemIconTextColor:
  //               _navBarPageSelector == 2 ? Colors.black : Colors.black87,
  //         ),
  //         _navBarItem(
  //           title: 'Account',
  //           image: 'assets/user-icon.png',
  //           onPressed: () {
  //             setState(() {
  //               _navBarPageSelector = 3;
  //             });
  //           },
  //           selectedItemColor: _navBarPageSelector == 3
  //               ? Colors.yellow[700]
  //               : Colors.grey[300],
  //           selectedItemIconTextColor:
  //               _navBarPageSelector == 3 ? Colors.black : Colors.grey[700],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _navBarItem(
  //     {required String title,
  //     required String image,
  //     VoidCallback? onPressed,
  //     Color? selectedItemColor,
  //     Color? selectedItemIconTextColor}) {
  //   return InkWell(
  //     onTap: onPressed,
  //     child: Container(
  //       padding: EdgeInsets.symmetric(horizontal: 10),
  //       width: 100,
  //       decoration: BoxDecoration(
  //           color: selectedItemColor,
  //           borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(10), topRight: Radius.circular(10))),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Container(
  //             height: 25,
  //             child: Image.asset(
  //               image,
  //               color: selectedItemIconTextColor,
  //             ),
  //           ),
  //           SizedBox(height: 3),
  //           Text(
  //             title,
  //             style: TextStyle(fontSize: 14, color: selectedItemIconTextColor),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
}
