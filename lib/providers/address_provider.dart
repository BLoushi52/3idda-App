import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/model/address_model.dart';
import '../client.dart';

class AddressProvider extends ChangeNotifier {
  List<Address> addresses = [];
  bool isLoading = false;

  AddressProvider() {
    loadAddresses();
  }

  Future<void> loadAddresses() async {
    try {
      isLoading = true;
      notifyListeners();

      var response = await Client.dio.get("/api/addresses/");

      addresses.clear();

      var body = response.data as List;

      addresses = body
          .map(
            (json) => Address.fromMap(json),
          )
          .toList();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> addAddress({
    required String dstrict,
    required String area,
    required String block,
    required String street,
    required String house,
  }) async {
    var response = await Client.dio.post("/api/address/create/",
        data: FormData.fromMap({
          "dstrict": dstrict,
          "area": area,
          "block": block,
          "street": street,
          "house": house,
        }));

    loadAddresses();
  }
}
