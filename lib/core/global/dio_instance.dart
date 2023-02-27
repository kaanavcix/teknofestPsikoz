import 'package:dio/dio.dart';

/* class DioInstance {
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
} */

class DioInstanceTsApi {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: "http://psikozbac.eu-central-1.elasticbeanstalk.com/api/",
      headers: {
        
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      }));

  DioInstanceTsApi._();

  static final instance = DioInstanceTsApi._();

  Dio get dio => _dio;

  Dio dioAuth(String token) => Dio(BaseOptions(
      baseUrl: "http://psikozbac.eu-central-1.elasticbeanstalk.com/api/",
      headers: {"token": token}));
}

class ApiPath {
  static const String BASE_PATH = "http://192.168.1.14:8080/";
}


//http://psikozbac.eu-central-1.elasticbeanstalk.com/