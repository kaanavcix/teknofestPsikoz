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
                DioInstanceTsApi.instance.dio)),
        permanent: true);
    Get.lazyPut<PostController>(
      () => PostController(DioServiceDb(
          DioInstanceTsApi.instance.dio)),
    );
    Get.lazyPut<CommentController>(
      () => CommentController(),
    );
    ;
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<UserController>(
      () => UserController(DioServiceUser(
          DioInstanceTsApi.instance.dio)),
    );
  }
}
