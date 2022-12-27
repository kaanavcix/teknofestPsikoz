import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:psikoz/controller/comment_controller.dart';
import 'package:psikoz/controller/home_controller.dart';
import 'package:psikoz/controller/post_controller.dart';
import 'package:psikoz/controller/profile_controller.dart';
import 'package:psikoz/controller/user_controller.dart';
import 'package:psikoz/core/global/dio_instance.dart';
import 'package:psikoz/product/service/service/dio_service_db.dart';
import 'package:psikoz/product/service/service/dio_service_user.dart';

import '../controller/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.put<HomeController>(
        HomeController(
            dioService: DioServiceDb(
                Dio(BaseOptions(baseUrl: "http://192.168.192.1:8080/api/")))),
        permanent: true);
    Get.lazyPut<PostController>(
        () => PostController(DioServiceDb(
            Dio(BaseOptions(baseUrl: "http://192.168.192.1:8080/api/")))),
        fenix: true);
          Get.lazyPut<CommentController>(
        () => CommentController(),
        fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<UserController>(
        () => UserController(DioServiceUser(
            Dio(BaseOptions(baseUrl: "http://192.168.192.1:8080/api/")))),
        fenix: true);
  }
}
