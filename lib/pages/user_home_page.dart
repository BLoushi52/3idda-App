import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/model/category_model.dart';
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
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ItemProvider>().loadItems();
    });
  }

  Widget build(BuildContext context) {
    var categories = [
      Category(
          id: ItemProvider.ALL_CATEGORY,
          title: "View All",
          image: "assets/view_all.png"),
      ...context.watch<CategoryProvider>().categories
    ];
    return Scaffold(
      backgroundColor: myDefaultBackground,
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: LiquidPullToRefresh(
          onRefresh: _handleRefresh,
          color: Colors.yellow[700],
          height: 100,
          backgroundColor: Colors.black,
          animSpeedFactor: 2,
          showChildOpacityTransition: false,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Text(
                      "Categories",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 6),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(),
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        var selectedCategory =
                            context.read<ItemProvider>().selectedCategory;

                        return InkWell(
                          onTap: () {
                            var provider = context.read<ItemProvider>();
                            provider.selectCategory(categories[index].id);
                          },
                          child: Card(
                            color: selectedCategory == categories[index].id
                                ? Theme.of(context).primaryColor
                                : null,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  Container(
                                    child: categories[index].id == -1
                                        ? Image.asset(categories[index].image,
                                            fit: BoxFit.cover, height: 30)
                                        : Image.network(categories[index].image,
                                            fit: BoxFit.cover, height: 30),
                                  ),
                                  Text(
                                    categories[index].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),

              //*  category tabs

              //* tiles below it

              context.watch<ItemProvider>().items.length == 0
                  ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 36),
                            child: Text(
                              "Opss, It looks like there is no items in this category.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 12, top: 8),
                      child: Row(
                        children: [
                          Text(
                            "Items",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
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
      ),
    );
  }
}
