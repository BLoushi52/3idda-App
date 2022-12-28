import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/model/order_model.dart';
import '../client.dart';

class MyOrderProvider extends ChangeNotifier {
  List<Order> orders = [];

  bool isLoading = false;

  MyOrderProvider() {
    loadMyOrders();
  }

  Future<void> loadMyOrders() async {
    try {
      isLoading = true;
      notifyListeners();

      // await a future (delay: 1 second)
      // await Future.delayed(Duration(seconds: 1));

      var response = await Client.dio.get("/api/myorders/");

      orders.clear();

      var body = response.data as List;

      orders = body
          .map(
            (json) => Order.fromMap(json),
          )
          .toList();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> addOrder({
    required int item,
    required int price,
    required String status,
    required int order_duration,
    required int address,
    required String start_date,
    required String end_date,
  }) async {
    var response = await Client.dio.post("/api/order/create/",
        data: FormData.fromMap({
          "item": item,
          "price": price,
          "status": status,
          "order_duration": order_duration,
          "address": address,
          "start_date": start_date,
          "end_date": end_date,
        }));

    loadMyOrders();
  }
}
