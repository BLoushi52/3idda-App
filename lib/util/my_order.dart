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
            child: CupertinoButton(
              onPressed: () {
                context.push('', extra: widget.order.item);
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
                        image: NetworkImage(
                          widget.order.item.image,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        SizedBox(height: 5),
                        Text(
                          "Order Status: ${widget.order.status}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Address: ${widget.order.address.toString()}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Order duration ${widget.order.order_duration.toString()}",
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
                              "Order Price ${widget.order.price}",
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
