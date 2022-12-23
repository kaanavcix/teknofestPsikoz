import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:psikoz/controller/home_controller.dart';
import 'package:psikoz/controller/post_controller.dart';
import 'package:psikoz/controller/profile_controller.dart';
import 'package:psikoz/core/global/dio_instance.dart';
import 'package:psikoz/product/service/service/dio_service_db.dart';

import '../controller/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController(dioService: DioServiceDb( Dio(BaseOptions(baseUrl: "http://192.168.1.14:8080/api/")))));
    Get.lazyPut<PostController>(() => PostController(DioServiceDb(Dio())));
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
