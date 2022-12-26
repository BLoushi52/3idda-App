import 'dart:convert';

import '../client.dart';

class Item {
  int id;
  String category;
  String title;
  String description;
  double price;
  String image;
  Item({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  Future<bool> isFavorited() async {
    try {
      var response = await Client.dio.get('/api/myfavorite/check/$id/');

      var body = response.data;
      return body['is_exists'];
    } catch (e) {
      print(e);
      return false;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'title': title,
      'description': description,
      'price': price,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id']?.toInt() ?? 0,
      category: map['category'] ?? "",
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));
}
