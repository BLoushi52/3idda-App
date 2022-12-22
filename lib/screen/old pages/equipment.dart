import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/providers/myitems_provider.dart';

import 'my_items_card.dart';

class MyItemPage extends StatefulWidget {
  const MyItemPage({Key? key}) : super(key: key);

  @override
  State<MyItemPage> createState() => _MyItemPageState();
}

class _MyItemPageState extends State<MyItemPage> {
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
      ),
      body: context.watch<MyItemProvider>().isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                context.read<MyItemProvider>().loadMyItems();
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: LayoutBuilder(
                        builder: (context, c) {
                          return GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 400,
                              childAspectRatio: 0.8,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                            ),
                            physics:
                                const NeverScrollableScrollPhysics(), // <- Here
                            itemCount:
                                context.watch<MyItemProvider>().items.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                context.push(
                                  '/itemdetails',
                                  extra: context
                                      .read<MyItemProvider>()
                                      .items[index],
                                );
                              },
                              child: MyItemCard(
                                item: context
                                    .watch<MyItemProvider>()
                                    .items[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
