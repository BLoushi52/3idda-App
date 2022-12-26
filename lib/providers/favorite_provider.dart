import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/model/favorite_model.dart';
import '../client.dart';
import '../model/item_model.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Item> favorite = [];
  bool isLoading = false;
  bool isFavorite = false;

  FavoriteProvider() {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    try {
      isLoading = true;
      notifyListeners();

      var response = await Client.dio.get("/api/myfavorite/");

      favorite.clear();

      var body = response.data as List;

      favorite = body
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

  Future<void> addFavorite({
    required int item,
  }) async {
    var response = await Client.dio.post("/api/myfavorite/create/",
        data: FormData.fromMap({
          "item": item,
        }));

    loadFavorites();
    notifyListeners();
  }

  void deleteFavorite(int id) async {
    await Client.dio.delete("/api/myfavorite/delete/$id/");

    loadFavorites();
  }

  Future<void> isFavorited(int id) async {
    try {
      var response = await Client.dio.get('/api/myfavorite/check/$id/');

      var body = response.data;
      isFavorite = body['is_exists'];
      print('isFavorite: $isFavorite');
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
