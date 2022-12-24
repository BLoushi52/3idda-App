import 'dart:convert';

class Favorite {
  int id;
  int item;
  Favorite({
    required this.id,
    required this.item,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item': item,
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      id: map['id']?.toInt() ?? 0,
      item: map['item']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorite.fromJson(String source) =>
      Favorite.fromMap(json.decode(source));
}
