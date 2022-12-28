import 'package:dio/dio.dart';

class Client {
  static final Dio dio =
      Dio(BaseOptions(baseUrl: "https://bloushi52.pythonanywhere.com"));
}
