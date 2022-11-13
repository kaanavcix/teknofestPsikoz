import 'package:dio/dio.dart';

class DioInstance {
  DioInstance._();
  final Dio _dio =
      Dio(BaseOptions(baseUrl: "https://webapipsikoz.azurewebsites.net/"));

  static final instance = DioInstance._();

  Dio authotirize(String token) {
    return Dio(BaseOptions(
        baseUrl: "https://webapipsikoz.azurewebsites.net/",
        headers: {"token": token}));
  }

  Dio get getDio => _dio;
}
