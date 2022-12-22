import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/model/address_model.dart';
import 'package:rental_app/providers/address_provider.dart';

class MyAddress extends StatefulWidget {
  final Address address;
  const MyAddress({required this.address, super.key});

  @override
  State<MyAddress> createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
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
            startActionPane: ActionPane(
              extentRatio: 0.3,
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  label: 'Edit',
                  onPressed: (context) {
                    context.push('', extra: widget.address);
                  },
                  backgroundColor: Colors.blue,
                  icon: Icons.edit,
                ),
              ],
            ),
            endActionPane: ActionPane(
              extentRatio: 0.3,
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  label: 'Delete',
                  onPressed: ((context) async {
                    await context.read<AddressProvider>();
                    // .deleteRecipe; //*    <---------  DELETE RECIPE
                  }),
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                ),
              ],
            ),
            child: CupertinoButton(
              onPressed: () {
                context.push('', extra: widget.address);
              },
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "dstrict: ${widget.address.dstrict} - area: ${widget.address.area} block: ${widget.address.block} - street: ${widget.address.street} - house: ${widget.address.house}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
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
            height: 3,
            color: Colors.grey[200],
          ),
        ],
      ),
    );
  }
}
