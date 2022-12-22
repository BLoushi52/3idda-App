import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/model/category_model.dart';
import 'package:rental_app/model/item_model.dart';
import 'package:rental_app/providers/category_provider.dart';

class MyItemCard extends StatefulWidget {
  final Color? iconColor;
  const MyItemCard({required this.item, super.key, this.iconColor});
  final Item item;

  @override
  State<MyItemCard> createState() => _MyItemCardState();
}

class _MyItemCardState extends State<MyItemCard> {
  @override
  Category? category;

  @override
  void initState() {
    super.initState();

    category = context
        .read<CategoryProvider>()
        .categories
        .firstWhere((element) => element.id == widget.item.category);
  }

  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 7,
      margin: EdgeInsets.all(4),
      // shadowColor: Colors.indigo,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.network(
              widget.item.image,
              height: 120,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Text(category.title),
                  Text(
                    widget.item.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('Category: ${category!.title.toString()}'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () =>
                            context.push('/edititem', extra: widget.item),
                        child: Icon(
                          Icons.edit,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
