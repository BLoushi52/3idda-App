import 'dart:convert';

import 'item_model.dart';

class Order {
  int id;
  Item item;
  double price;
  String status;
  int order_duration;
  int address;
  String start_date;
  String end_date;
  Order({
    required this.id,
    required this.item,
    required this.price,
    required this.status,
    required this.order_duration,
    required this.address,
    required this.start_date,
    required this.end_date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item': item.toMap(),
      'price': price,
      'status': status,
      'order_duration': order_duration,
      'address': address,
      'start_date': start_date,
      'end_date': end_date,
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
      start_date: map['start_date'] ?? '',
      end_date: map['end_date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
