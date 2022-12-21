import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/model/item_model.dart';
import '../client.dart';

class MyItemProvider extends ChangeNotifier {
  List<Item> items = [];

  bool isLoading = false;

  MyItemProvider() {
    loadMyItems();
  }

  Future<void> loadMyItems() async {
    try {
      isLoading = true;
      notifyListeners();

      // await a future (delay: 1 second)
      // await Future.delayed(Duration(seconds: 1));

      var response = await Client.dio.get("/api/myitems/");

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

  Future<void> addItem({
    required String title,
    required int category,
    required File image,
    required String price,
    required String description,
  }) async {
    var response = await Client.dio.post("/api/item/create/",
        data: FormData.fromMap({
          "title": title,
          "category": category,
          "image": await MultipartFile.fromFile(image.path),
          "price": price,
          "description": description,
        }));

    loadMyItems();
  }

  addCategory({required String title, required File image}) {}

  Future<void> editItem({
    required int id,
    required String title,
    required int category,
    required File image,
    required String price,
    required String description,
  }) async {
    var response = await Client.dio.put("/api/item/edit/${id}/",
        data: FormData.fromMap({
          "title": title,
          "category": category,
          "image": await MultipartFile.fromFile(image.path),
          "price": price,
          "description": description,
        }));

    loadMyItems();
  }
}
