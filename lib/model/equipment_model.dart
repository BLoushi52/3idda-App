import 'package:flutter/material.dart';

class Equipment {
  int? id;
  String title;
  String user;
  String category;
  String description;
  String ingredients;
  String instructions;
  String image;

  Equipment(
      {this.id,
      required this.title,
      required this.user,
      required this.category,
      required this.description,
      required this.ingredients,
      required this.instructions,
      required this.image});

  Equipment.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String,
        user = json['user'] as String,
        category = json['category'] as String,
        description = json['description'] as String,
        ingredients = json['ingredients'] as String,
        instructions = json['instructions'] as String,
        image = json['image'] as String;
}
