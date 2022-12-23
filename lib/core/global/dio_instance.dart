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

class DioInstances {
  DioInstances._();

  final Dio _dio = Dio(BaseOptions(baseUrl: "https://192.168.1.14/api/"));

  static final instance = DioInstance._();

  Dio get getdio => _dio;
}
