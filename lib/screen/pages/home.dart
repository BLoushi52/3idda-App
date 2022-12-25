import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/providers/category_provider.dart';

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
    await context.read<ItemProvider>().loadItems();
    await context.read<CategoryProvider>().loadCategories();
    return;
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 16, 12, 0),
              child: Container(
                height: 110,
                decoration: BoxDecoration(),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      context.watch<CategoryProvider>().categories.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Card(
                        // color: Colors.grey[300],
                        elevation: 0,
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: 70,
                            // width: 130,
                            color: Colors.grey[300],
                            child: Image.network(context
                                .watch<CategoryProvider>()
                                .categories[index]
                                .image),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 130,
                        child: Text(
                          context
                              .watch<CategoryProvider>()
                              .categories[index]
                              .title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //*  category tabs

            //* tiles below it

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
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
