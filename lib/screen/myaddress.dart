import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/providers/address_provider.dart';

import 'package:rental_app/util/my_adresses.dart';

import '../../constraints.dart';

class MyAddressesView extends StatefulWidget {
  const MyAddressesView({super.key});

  @override
  State<MyAddressesView> createState() => _MyAddressesViewState();
}

class _MyAddressesViewState extends State<MyAddressesView> {
  Future<void> _handleRefresh() async {
    return await context.read<AddressProvider>().loadAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        title: Text(
          "My Addresses",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow[700],
        foregroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        onPressed: () {
          context.push('/addaddress');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow[700],
      ),
      backgroundColor: myDefaultBackground,
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        color: Colors.yellow[700],
        height: 100,
        backgroundColor: Colors.black,
        animSpeedFactor: 2,
        showChildOpacityTransition: false,
        child: Column(
          children: [
            // mySearch,

            //*  category tabs

            //* tiles below it

            Expanded(
              child: ListView.builder(
                itemCount: context.watch<AddressProvider>().addresses.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    context.push(
                      '/itemdetails',
                      extra: context.read<AddressProvider>().addresses[index],
                    );
                  },
                  child: MyAddress(
                    address: context.watch<AddressProvider>().addresses[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
