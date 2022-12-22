import 'package:get/get.dart';
import 'package:psikoz/controller/home_controller.dart';
import 'package:psikoz/controller/post_controller.dart';
import 'package:psikoz/controller/profile_controller.dart';

import '../controller/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<PostController>(() => PostController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
