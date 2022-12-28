import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/model/order_model.dart';
import '../client.dart';

class MyOrderProvider extends ChangeNotifier {
  List<Order> orders = [];

  bool isLoading = false;

  String? fromDate;
  String? toDate;

  MyOrderProvider() {
    loadMyOrders();
  }

  void chooseDate(String fromDate, String toDate) {
    this.fromDate = fromDate;
    this.toDate = toDate;
    notifyListeners();
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
    required double price,
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
          "start_date": fromDate,
          "end_date": toDate,
        }));

    loadMyOrders();
  }
}
