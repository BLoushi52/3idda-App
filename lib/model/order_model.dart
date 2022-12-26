import 'dart:convert';

import 'item_model.dart';

class Order {
  int id;
  Item item;
  double price;
  String status;
  int order_duration;
  int address;
  Order({
    required this.id,
    required this.item,
    required this.price,
    required this.status,
    required this.order_duration,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item': item,
      'price': price,
      'status': status,
      'order_duration': order_duration,
      'address': address,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id']?.toInt() ?? 0,
      item: Item.fromMap(map['item']),
      price: map['price']?.toDouble() ?? 0.0,
      status: map['status'] ?? '',
      order_duration: map['order_duration']?.toInt() ?? 0,
      address: map['address']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
