import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../model/address_model.dart';
import '../providers/address_provider.dart';
import '../widgets/date_picker.dart';

class ConfirmationPage extends StatefulWidget {
  ConfirmationPage({super.key});

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  bool? isChecked = false;
  Address? address;

  String paymentDropDownValue = 'Cash on Delivery';

  var paymentOptions = [
    'Cash on Delivery',
    'Debit or Credit Card',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        leadingWidth: 68,
        title: Text("Confirm Order"),
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.yellow[700]),
            child: CupertinoButton(
              padding: EdgeInsets.only(right: 0),
              child: Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 28,
              ),
              onPressed: () {
                context.go('/home');
              },
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Dates:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  //* <-------  Date Picker Goes Here
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DatePicker(),
                    // child: TextFormField(
                    //   decoration: InputDecoration(
                    //       enabledBorder: const OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.black),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.grey.shade400),
                    //       ),
                    //       fillColor: Colors.grey.shade200,
                    //       filled: true,
                    //       hintStyle: TextStyle(color: Colors.grey[500])),
                    // ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Address:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  //* <-------  Address Dropdown Goes Here
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButton<Address>(
                        icon: Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: Colors.grey[600],
                          size: 30,
                        ),
                        isExpanded: true,
                        hint: Text("Address"),
                        value: address,
                        items: context
                            .watch<AddressProvider>()
                            .addresses
                            .map(buildMenuItem)
                            .toList(),
                        onChanged: (value) => setState(
                              () {
                                this.address = value;
                                print(value);
                              },
                            )),
                    // child: TextFormField(
                    //   decoration: InputDecoration(
                    //       enabledBorder: const OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.black),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.grey.shade400),
                    //       ),
                    //       fillColor: Colors.grey.shade200,
                    //       filled: true,
                    //       hintStyle: TextStyle(color: Colors.grey[500])),
                    // ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Payment Method:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  //* <-------  Payment Method Dropdown Goes Here
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text("Payment Type"),
                      value: paymentDropDownValue,
                      icon: Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        color: Colors.grey[600],
                        size: 30,
                      ),
                      items: paymentOptions.map(
                        (String paymentOptions) {
                          return DropdownMenuItem(
                            value: paymentOptions,
                            child: Text(paymentOptions),
                          );
                        },
                      ).toList(),
                      onChanged: (String? newValue) {
                        setState(
                          () {
                            paymentDropDownValue = newValue!;
                          },
                        );
                      },
                    ),

                    // child: TextFormField(
                    //   decoration: InputDecoration(
                    //       enabledBorder: const OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.black),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.grey.shade400),
                    //       ),
                    //       fillColor: Colors.grey.shade200,
                    //       filled: true,
                    //       hintStyle: TextStyle(color: Colors.grey[500])),
                    // ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Terms & Conditions:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        child: Text(
                            'These General Terms and Conditions of Sale (“GTCS”) apply to all sales of goods by us notwithstanding any conflicting, contrary or additional terms and conditions in any purchase order or other communication from you. No such conflicting, contrary or additional terms and conditions shall be deemed accepted by us unless and until we expressly confirm our acceptance in writing.'),
                      )),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.grey[600],
                          value: isChecked,
                          onChanged: (newBool) {
                            setState(() {
                              isChecked = newBool;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            'By selecting, you agree to 3idda Terms of Conditions',
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[700],
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 80),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 55, vertical: 10),
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<Address> buildMenuItem(Address item) => DropdownMenuItem(
        value: item,
        child: Row(
          children: [
            Text('${item.district},'),
            Text(' ${item.area},'),
            Text(' ${item.block},'),
            Text(' ${item.street},'),
            Text(' ${item.house}.'),
          ],
        ),
      );
}
