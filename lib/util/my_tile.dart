import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../constraints.dart';
import '../providers/equipment_provider.dart';

class MyTile extends StatelessWidget {
  const MyTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Slidable(
            startActionPane: ActionPane(
              extentRatio: 0.3,
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  label: 'Edit',
                  onPressed: ((context) async {
                    await context.read<EquipmentProvider>();
                    // .editEquipment; //*    <---------  EDIT RECIPE
                  }),
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
                    await context.read<EquipmentProvider>();
                    // .deleteRecipe; //*    <---------  DELETE RECIPE
                  }),
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                ),
              ],
            ),
            child: CupertinoButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                      ),
                      buildSheet(context),
                    ],
                  ),
                );
              },
              child: Row(
                children: [
                  Container(
                    height: 100, //*  <------------ Can reduce to 90/90
                    width: 100, //*   <------------ if 'Category' is removed.
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://www.incimages.com/uploaded_files/image/1920x1080/getty_494605768_2000133320009280151_316966.jpg'),
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
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Text(
                              'Category',
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 12,
                                // fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 175, right: 5),
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                              size: 19,
                            ),
                          ),
                          Text(
                            '3.5',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Item Name',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
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
                            "KD 3",
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
