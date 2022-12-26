import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/providers/myitems_provider.dart';
import 'package:rental_app/util/my_item.dart';
import '../../constraints.dart';

class MyItemsView extends StatefulWidget {
  const MyItemsView({super.key});

  @override
  State<MyItemsView> createState() => _MyItemsViewState();
}

class _MyItemsViewState extends State<MyItemsView> {
  Future<void> _handleRefresh() async {
    return await context.read<MyItemProvider>().loadMyItems();
  }

  @override
  void initState() {
    super.initState();
    context.read<MyItemProvider>().loadMyItems();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/additem');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow[700],
        foregroundColor: Colors.black,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // mySearch,

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'My Equipment',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //*  category tabs

            //* tiles below it

            Expanded(
              child: ListView.builder(
                itemCount: context.watch<MyItemProvider>().items.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    context.push(
                      '/itemdetails',
                      extra: context.read<MyItemProvider>().items[index],
                    );
                  },
                  child: MyItem(
                    item: context.watch<MyItemProvider>().items[index],
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
