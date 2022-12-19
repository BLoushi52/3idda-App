import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../client.dart';
import '../model/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categories = [];
  bool isLoading = false;

  CategoryProvider() {
    loadCategories();
  }

  Future<void> loadCategories() async {
    try {
      isLoading = true;
      categories.clear();

      var response = await Client.dio.get("/api/category/");
      var categoryJsonList = response.data as List;

      categories = categoryJsonList
          .map((categoryJson) => Category.fromMap(categoryJson))
          .toList();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
