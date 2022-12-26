import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/model/favorite_model.dart';
import 'package:rental_app/model/item_model.dart';
import 'package:rental_app/providers/favorite_provider.dart';
import 'package:rental_app/providers/item_provider.dart';
import 'package:rental_app/providers/myitems_provider.dart';

import '../model/category_model.dart';
import '../providers/category_provider.dart';

class MyFavorite extends StatefulWidget {
  final Item favorite;
  const MyFavorite({required this.favorite, super.key});

  @override
  State<MyFavorite> createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      // height: 133,
      child: Column(
        children: [
          Slidable(
            endActionPane: ActionPane(
              extentRatio: 0.3,
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  label: 'Delete',
                  onPressed: (context) {
                    context
                        .read<FavoriteProvider>()
                        .deleteFavorite(widget.favorite.id);
                  },
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                ),
              ],
            ),
            child: CupertinoButton(
              onPressed: () {
                // context.push('/itemdetails', extra: widget.favorite);
              },
              child: Row(
                children: [
                  Container(
                    height: 110, //*  <------------ Can reduce to 90/90
                    width: 110, //*   <------------ if 'Category' is removed.
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.favorite.image),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: Text(
                                widget.favorite.category.toString(),
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 12,
                                  // fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                              size: 19,
                            ),
                            Text(
                              '3.5',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                        Text(
                          widget.favorite.title,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          widget.favorite.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "KD ${widget.favorite.price}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              " / Day",
                              style: TextStyle(
                                color: Colors.blueGrey[500],
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey[200],
          )
        ],
      ),
    );
  }
}
