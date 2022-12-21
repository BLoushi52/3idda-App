import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/model/item_model.dart';
import '../constraints.dart';
import '../model/category_model.dart';
import '../providers/category_provider.dart';
import '../providers/item_provider.dart';

class MyTile extends StatefulWidget {
  final Item item;
  const MyTile({required this.item, super.key});

  @override
  State<MyTile> createState() => _MyTileState();
}

class _MyTileState extends State<MyTile> {
  @override
  void initState() {
    super.initState();

    // category = ;
  }

  Widget build(BuildContext context) {
    return Container(
      // height: 133,
      child: Column(
        children: [
          Slidable(
            child: CupertinoButton(
              onPressed: () {
                context.push('/itemdetails', extra: widget.item);
              },
              child: Row(
                children: [
                  Container(
                    height: 95, //*  <------------ Can reduce to 90/90
                    width: 95, //*   <------------ if 'Category' is removed.
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.item.image),
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
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Text(
                              context
                                  .watch<CategoryProvider>()
                                  .categories
                                  .firstWhere(
                                    (element) =>
                                        element.id == widget.item.category,
                                    orElse: () => Category(
                                        id: 2, title: 'other', image: 'image'),
                                  )
                                  .title,
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
                        widget.item.title,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        widget.item.description,
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
                            "KD ${widget.item.price}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
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
                  ))
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
