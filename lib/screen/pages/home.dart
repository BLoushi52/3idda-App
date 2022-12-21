import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

import '../../constraints.dart';
import '../../providers/item_provider.dart';
import '../../util/my_tile.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  Future<void> _handleRefresh() async {
    return await context.read<ItemProvider>().loadItems();
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
          children: [
            mySearch,

            //*  category tabs

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
  }
}
