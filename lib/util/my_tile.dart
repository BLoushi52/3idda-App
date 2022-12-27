import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_app/model/item_model.dart';

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
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Slidable(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            padding: EdgeInsets.zero,
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () {
                  context.go('/itemdetails', extra: widget.item);
                },
                child: Row(
                  children: [
                    Container(
                      height: 120, //*  <------------ Can reduce to 90/90
                      width: 130, //*   <------------ if 'Category' is removed.
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(12)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.item.image),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 120, //*  <------------ Can reduce to 90/90
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.item.category,
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 12,
                                      // fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400,
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
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                widget.item.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 13,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "KD ${widget.item.price}",
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
