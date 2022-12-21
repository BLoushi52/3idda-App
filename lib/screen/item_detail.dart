import 'package:flutter/material.dart';
import '../model/item_model.dart';

class ItemDetail extends StatelessWidget {
  ItemDetail({required this.item, super.key});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(item.title),
    );
  }
}
