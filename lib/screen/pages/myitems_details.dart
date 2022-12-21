import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_app/model/category_model.dart';
import 'package:rental_app/model/item_model.dart';
import 'package:rental_app/providers/category_provider.dart';
import 'package:rental_app/providers/myitems_provider.dart';

class DetailsItem extends StatefulWidget {
  DetailsItem({super.key, required this.item});

  final Item item;

  @override
  State<DetailsItem> createState() => _DetailsItemState();
}

class _DetailsItemState extends State<DetailsItem> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.title),
      ),
      body: Column(
        children: [
          Image.network(
            widget.item.image,
            height: 400,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Category: ',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${category!.title.toString()}',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
