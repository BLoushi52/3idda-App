import 'dart:convert';

class Equipment {
  int id;
  String title;
  String image;
  int category;
  Equipment({
    required this.id,
    required this.title,
    required this.image,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'category': category,
    };
  }

  factory Equipment.fromMap(Map<String, dynamic> map) {
    return Equipment(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      category: map['category']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Equipment.fromJson(String source) =>
      Equipment.fromMap(json.decode(source));
}

// class Equipment {
//   int id;
//   String title;
//   // int category;
//   String image;
//   Equipment({
//     required this.id,
//     required this.title,
//     // required this.category,
//     required this.image,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'title': title,
//       // 'category': category,
//       'image': image,
//     };
//   }

//   factory Equipment.fromMap(Map<String, dynamic> map) {
//     return Equipment(
//       id: map['id']?.toInt() ?? 0,
//       title: map['title'] ?? '',
//       // category: map['category']?.toInt() ?? 0,
//       image: map['image'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Equipment.fromJson(String source) =>
//       Equipment.fromMap(json.decode(source));
// }
