import 'dart:convert';

class Address {
  int id;
  String dstrict;
  String area;
  int block;
  String street;
  int house;
  Address({
    required this.id,
    required this.dstrict,
    required this.area,
    required this.block,
    required this.street,
    required this.house,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dstrict': dstrict,
      'area': area,
      'block': block,
      'street': street,
      'house': house,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id']?.toInt() ?? 0,
      dstrict: map['dstrict'] ?? '',
      area: map['area'] ?? '',
      block: map['block']?.toInt() ?? 0,
      street: map['street'] ?? '',
      house: map['house']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));
}
