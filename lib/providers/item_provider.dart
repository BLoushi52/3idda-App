import 'package:flutter/material.dart';
import 'package:rental_app/model/item_model.dart';
import '../client.dart';

int counter = 0;

class ItemProvider extends ChangeNotifier {
  List<Item> items = [];
  int? selectedCategory;

  bool isLoading = false;

  ItemProvider() {
    print("I am created ${++counter}");
    loadItems();
  }

  void selectCategory(int category) {
    selectedCategory = category;
    notifyListeners();
    loadItems();
  }

  Future<void> loadItems() async {
    try {
      isLoading = true;
      notifyListeners();

      // await a future (delay: 1 second)
      // await Future.delayed(Duration(seconds: 1));

      var response = await Client.dio.get("/api/item/", queryParameters: {
        if (selectedCategory != null) "category_id": selectedCategory,
      });

      items.clear();

      var body = response.data as List;

      items = body
          .map(
            (json) => Item.fromMap(json),
          )
          .toList();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void deleteItem(int id) async {
    await Client.dio.delete("/equipment/$id");

    loadItems();
    notifyListeners();
  }
}
