import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var myDefaultBackground = Colors.grey[300];

// var myAppBar = AppBar(
//   backgroundColor: Colors.yellow,
// );

// var myDrawer = Drawer(
//   backgroundColor: Colors.yellow[700], //*   <------ Previously grey[300]
//   child: Column(children: [
//     Padding(
//       padding: const EdgeInsets.only(
//         top: 100,
//         bottom: 50,
//       ),
//       child: Column(
//         children: [
//           Icon(
//             Icons.person,
//             size: 75,
//             color: Colors.black,
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Text(
//             'Hi (username)!',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     ),
//     ListTile(
//       leading: Icon(
//         Icons.home,
//         color: Colors.black,
//       ),
//       title: Text(
//         'D A S H B O A R D',
//         style: TextStyle(
//           color: Colors.black,
//         ),
//       ),
//     ),
//     ListTile(
//       leading: Icon(
//         Icons.list,
//         color: Colors.black,
//       ),
//       title: Text(
//         'O R D E R S',
//         style: TextStyle(
//           color: Colors.black,
//         ),
//       ),
//     ),
//     ListTile(
//       leading: Icon(
//         Icons.favorite,
//         color: Colors.black,
//       ),
//       title: Text(
//         'F A V O R I T E S',
//         style: TextStyle(
//           color: Colors.black,
//         ),
//       ),
//     ),
//     ListTile(
//       leading: Icon(
//         Icons.menu_book,
//         color: Colors.black,
//       ),
//       title: Text(
//         'A D D R E S S   B O O K',
//         style: TextStyle(
//           color: Colors.black,
//         ),
//       ),
//     ),
//     ListTile(
//       leading: Icon(
//         Icons.settings,
//         color: Colors.black,
//       ),
//       title: Text(
//         'S E T T I N G S',
//         style: TextStyle(
//           color: Colors.black,
//         ),
//       ),
//     ),
//     ListTile(
//       leading: Icon(
//         Icons.logout,
//         color: Colors.black,
//       ),
//       title: Text(
//         'L O G O U T',
//         style: TextStyle(
//           color: Colors.black,
//         ),
//       ),
//     ),
//   ]),
// );

TextEditingController? textEditingController = TextEditingController();

var mySearch = Padding(
  padding: const EdgeInsets.only(top: 12, left: 8, right: 8, bottom: 6),
  child: CupertinoSearchTextField(
    onChanged: (value) {
      // recipes =
      //     recipes.where((element) => element.contains(value)).toList();
    },
    controller: textEditingController,
    placeholder: 'Search categories',
    autocorrect: false,
    padding: EdgeInsets.symmetric(horizontal: 16),
    prefixIcon: Icon(
      CupertinoIcons.search,
      color: Colors.black54,
    ),
    placeholderStyle: TextStyle(
      color: Colors.black54,
    ),
    style: TextStyle(
      color: Colors.black54,
    ),
    decoration: BoxDecoration(
      color: CupertinoColors.extraLightBackgroundGray,
      border: Border.all(
        color: CupertinoColors.extraLightBackgroundGray,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    // decoration: BoxDecoration,
  ),
);

Widget buildSheet(BuildContext cc) => DraggableScrollableSheet(
      initialChildSize: 0.94,
      minChildSize: 0.6,
      maxChildSize: 0.94,
      builder: (context, controller) => Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        // padding: EdgeInsets.all(16),
        child: ListView(
          controller: controller,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: GestureDetector(
                      child: Icon(
                        Icons.arrow_back,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Expanded(
                      child: SizedBox(
                    width: 50,
                  )),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Icon(Icons.favorite_outline),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //*                          <----------  IMAGE CAROUSEL
            SizedBox(
              height: 200,
              width: double.infinity,
              // child:
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product Name',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                              size: 25,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '4.5',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 6),
                            Text(
                              '(3 Reviews)',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'More Details:',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Rental Plans:',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  '1 Day',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 24, right: 24, bottom: 20),
                                child: Text(
                                  'KD 3.000',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  '1 Week',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: Text(
                                  'KD 12.000',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  '1 Month',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: Text(
                                  'KD 45.000',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Container(
                      width: 300,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow[700],
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(); //* <----- ASK FOR HELP
                          },
                          child: Text(
                            'Rent Now',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  // SizedBox(
                  //   height: 2,
                  // ),
                  // Center(
                  //   child: Container(
                  //     width: 200,
                  //     child: ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor: Colors.grey[400],
                  //         ),
                  //         onPressed: () {
                  //           // Navigator.of(context).pop();      //* <----- ASK FOR HELP
                  //         },
                  //         child: Text(
                  //           'Cancel',
                  //           style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 17,
                  //             // fontWeight: FontWeight.bold,
                  //           ),
                  //         )),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
