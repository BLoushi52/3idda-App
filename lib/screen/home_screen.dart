import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/constraints.dart';
import 'package:rental_app/providers/item_provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../util/my_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _handleRefresh() async {
    return await Future.delayed(Duration(seconds: 1));
  }

  // TextEditingController? textEditingController = TextEditingController();

  int _navBarPageSelector = 0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
      return Scaffold(
        backgroundColor: myDefaultBackground,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                child: Icon(Icons.shopping_cart_outlined),
                onTap: () {
                  // Navigator.push(context, route);
                },
              ),
            )
          ],
          title: Text(
            'Home Screen',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.yellow[700],
          foregroundColor: Colors.black,
        ),
        drawer: myDrawer,
        bottomNavigationBar: _bottomNav(sizingInformation),
        body: LiquidPullToRefresh(
          onRefresh: _handleRefresh,
          color: Colors.yellow[700],
          height: 100,
          backgroundColor: Colors.black,
          animSpeedFactor: 3,
          showChildOpacityTransition: false,
          child: Column(
            children: [
              mySearch,

              //*  4 boxes on the top

              // Container(
              //   height: 140,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       buildCard(),
              //       SizedBox(width: 12),
              //       buildCard(),
              //       SizedBox(width: 12),
              //       buildCard(),
              //       SizedBox(width: 12),
              //     ],
              //   ),
              // ),

              // AspectRatio(
              //   aspectRatio: 1,
              //   child: SizedBox(
              //     width: double.infinity,
              //     child: GridView.builder(
              //       itemCount: 4,
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 2),
              //       itemBuilder: (context, index) {
              //         return const MyBox();
              //       },
              //     ),
              //   ),
              // ),

              //* tiles below it

              Expanded(
                child: ListView.builder(
                  itemCount: context.watch<ItemProvider>().items.length,
                  itemBuilder: (context, index) {
                    return MyTile(
                      item: context.watch<ItemProvider>().items[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _bottomNav(SizingInformation sizingInformation) {
    return Container(
      height: sizingInformation.screenSize.height * 0.09,
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _navBarItem(
            title: 'Home',
            image: 'assets/home.png',
            onPressed: () {
              setState(() {
                _navBarPageSelector = 0;
              });
            },
            selectedItemColor: _navBarPageSelector == 0
                ? Colors.yellow[700]
                : Colors.grey[300],
            selectedItemIconTextColor:
                _navBarPageSelector == 0 ? Colors.black : Colors.black,
          ),
          _navBarItem(
            title: 'Equipment',
            image: 'assets/tools-icon.png',
            onPressed: () {
              setState(() {
                _navBarPageSelector = 1;
              });
            },
            selectedItemColor: _navBarPageSelector == 1
                ? Colors.yellow[700]
                : Colors.grey[300],
            selectedItemIconTextColor:
                _navBarPageSelector == 1 ? Colors.black : Colors.black,
          ),
          _navBarItem(
            title: 'Chat',
            image: 'assets/chat.png',
            onPressed: () {
              setState(() {
                _navBarPageSelector = 2;
              });
            },
            selectedItemColor: _navBarPageSelector == 2
                ? Colors.yellow[700]
                : Colors.grey[300],
            selectedItemIconTextColor:
                _navBarPageSelector == 2 ? Colors.black : Colors.black,
          ),
          _navBarItem(
            title: 'Settings',
            image: 'assets/settings-icon.png',
            onPressed: () {
              setState(() {
                _navBarPageSelector = 3;
              });
            },
            selectedItemColor: _navBarPageSelector == 3
                ? Colors.yellow[700]
                : Colors.grey[300],
            selectedItemIconTextColor:
                _navBarPageSelector == 3 ? Colors.black : Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _navBarItem(
      {required String title,
      required String image,
      VoidCallback? onPressed,
      Color? selectedItemColor,
      Color? selectedItemIconTextColor}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: 100,
        decoration: BoxDecoration(
            color: selectedItemColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 25,
              child: Image.asset(
                image,
                color: selectedItemIconTextColor,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14, color: selectedItemIconTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
