import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/providers/favorite_provider.dart';
import 'package:rental_app/util/my_favorite.dart';
import '../../constraints.dart';

class MyFavoriteView extends StatefulWidget {
  const MyFavoriteView({super.key});

  @override
  State<MyFavoriteView> createState() => _MyFavoriteViewState();
}

class _MyFavoriteViewState extends State<MyFavoriteView> {
  Future<void> _handleRefresh() async {
    return await context.read<FavoriteProvider>().loadFavorites();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FavoriteProvider>().loadFavorites();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
        leadingWidth: 68,
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
                'My Favorites List',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: context.watch<FavoriteProvider>().favorite.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    context.push(
                      '/itemdetails',
                      extra: context.read<FavoriteProvider>().favorite[index],
                    );
                  },
                  child: MyFavorite(
                    item: context.watch<FavoriteProvider>().favorite[index],
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
