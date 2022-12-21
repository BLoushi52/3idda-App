import 'package:flutter/material.dart';
import 'package:rental_app/model/item_model.dart';
import '../client.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> items = [];

  bool isLoading = false;

  ItemProvider() {
    loadItems();
  }

  Future<void> loadItems() async {
    try {
      isLoading = true;
      notifyListeners();

      // await a future (delay: 1 second)
      // await Future.delayed(Duration(seconds: 1));

      var response = await Client.dio.get("/api/item/");

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

  // Future<void> addRecipe({
  //   required this.title,
  //   required this.name,
  //   required this.category,
  //   this.description,
  //   required this.ingredients,
  //   required this.instructions,
  //   required this.image,
  // }) async {
  //   await Client.dio.post("/api/recipes/",
  //       data: FormData.fromMap({
  //         "title": title,
  //         "name": name,
  //         "category": category,
  //         "description": description,
  //         "ingredients": ingredients,
  //         "instructions": instructions,
  //         "image": image,
  //       }));

  //   getRecipes();
  // }

  // Future<void> editEquipment({
  //   required Equipment equipment,
  //   required String title,
  //   required String user,
  //   required String category,
  //   String? description,
  //   required String ingredients,
  //   required String instructions,
  //   required String image,
  // }) async {
  //   var client = Dio();

  //   await client.put("/equipment/${recipe.id}",
  //       data: FormData.fromMap({
  //         "title": title,
  //         "user": user,
  //         "category": category,
  //         "description": description,
  //         "ingredients": ingredients,
  //         "instructions": instructions,
  //         "image": image,
  //       }));

  //   getEquipment();
  // }

  // void deleteRecipe(int id) async {
  //   await Client.dio.delete("/recipes/$id");

  //   getRecipes();
  // }
}
