import 'package:dio/dio.dart';

class Client {
  static final Dio dio =
      Dio(BaseOptions(baseUrl: "http://bloushi52.pythonanywhere.com"));
}
