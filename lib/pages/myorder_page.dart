import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

import 'package:rental_app/providers/myorder_provider.dart';

import 'package:rental_app/util/my_order.dart';

import '../../constraints.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  Future<void> _handleRefresh() async {
    return await context.read<MyOrderProvider>().loadMyOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackground,
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        color: Colors.yellow[700],
        height: 100,
        backgroundColor: Colors.black,
        animSpeedFactor: 2,
        showChildOpacityTransition: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // mySearch,

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'My Rentals',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),

            //*  category tabs

            //* tiles below it

            Expanded(
              child: ListView.builder(
                itemCount: context.watch<MyOrderProvider>().orders.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    context.push(
                      '/itemdetails',
                      extra: context.read<MyOrderProvider>().orders[index],
                    );
                  },
                  child: MyOrder(
                    order: context.watch<MyOrderProvider>().orders[index],
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
