import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../client.dart';

class AuthProvider extends ChangeNotifier {
  String? username;

  Future<bool> register({
    required String username,
    required String password,
  }) async {
    try {
      var response = await Client.dio.post("/register/", data: {
        'username': username,
        'password': password,
      });

      var token = response.data["access"];

      Client.dio.options.headers[HttpHeaders.authorizationHeader] =
          "Bearer $token";
      this.username = username;
      notifyListeners();

      var pref = await SharedPreferences.getInstance();
      await pref.setString("token", token);
      print('register successfully');
      return true;
    } on DioError catch (e) {
      print(e.response!.data);
    } catch (e) {
      print("Unknown Error");
    }

    return false;
  }

  Future<bool> hasToken() async {
    var pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");

    if (token == null || JwtDecoder.isExpired(token)) {
      print('removed token'); // for testing
      return false;
    }

    var tokenMap = JwtDecoder.decode(token);
    username = tokenMap['username'];
    notifyListeners();
    print(username); // for testing
    return true;
  }

  Future<bool> login(
      {required String username, required String password}) async {
    late String token;
    try {
      Response response = await Client.dio.post('/api/login/', data: {
        "username": username,
        "password": password,
      });
      token = response.data["access"];
      Client.dio.options.headers["Authorization"] = "Bearer $token";
      var ref = await SharedPreferences.getInstance();
      ref.setString("token", token);
      this.username = username;
      notifyListeners();
      return true;
    } on DioError catch (error) {
      print(error);
    }
    notifyListeners();

    return false;
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    this.hasToken(); // for testing
    // token = "";
    this.username = null;
    notifyListeners();
  }
}
