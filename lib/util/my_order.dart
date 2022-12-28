import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:rental_app/model/order_model.dart';

class MyOrder extends StatefulWidget {
  final Order order;

  const MyOrder({required this.order, super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
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
            startActionPane: ActionPane(
              extentRatio: 0.3,
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  label: 'Extend',
                  onPressed: (context) {
                    context.push('', extra: widget.order.item);
                  },
                  backgroundColor: Colors.green,
                  icon: Icons.more_time,
                ),
              ],
            ),
            endActionPane: ActionPane(
              extentRatio: 0.3,
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  label: 'Cancel Order',
                  onPressed: (context) {
                    context.push('', extra: widget.order.item);
                  },
                  backgroundColor: Colors.red,
                  icon: Icons.cancel,
                ),
              ],
            ),
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
                    context.push('', extra: widget.order.item);
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 120, //*  <------------ Can reduce to 90/90
                        width:
                            130, //*   <------------ if 'Category' is removed.
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(12)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              widget.order.item.image,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.order.item.title,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Status: ${widget.order.status}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 13,
                                  ),
                                ),
                                // Text(
                                //   "Address: ${widget.order.address.toString()}",
                                //   maxLines: 2,
                                //   overflow: TextOverflow.ellipsis,
                                //   style: TextStyle(
                                //     color: Colors.blueGrey,
                                //     fontSize: 13,
                                //   ),
                                // ),

                                Text(
                                  "Duration ${widget.order.order_duration.toString()}",
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
                                      "Total Price: ${widget.order.price}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
