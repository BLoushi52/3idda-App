import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/model/favorite_model.dart';
import '../client.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Favorite> favorite = [];
  bool isLoading = false;

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
            (json) => Favorite.fromMap(json),
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
  }

  void deleteFavorite(int id) async {
    await Client.dio.delete("/api/myfavorite/delete/$id/");

    loadFavorites();
  }
}
