import 'package:flutter/material.dart';
import 'package:rental_app/model/item_model.dart';
import '../client.dart';

int counter = 0;

class ItemProvider extends ChangeNotifier {
  static int ALL_CATEGORY = -1;

  List<Item> items = [];
  int selectedCategory = ALL_CATEGORY;

  bool isLoading = false;

  ItemProvider() {
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

      var response = await Client.dio.get("/api/item/", queryParameters: {
        if (selectedCategory != ALL_CATEGORY) "category_id": selectedCategory,
      });

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
