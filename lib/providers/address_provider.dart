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
}
