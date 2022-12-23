import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:psikoz/controller/main_controller.dart';
import 'package:psikoz/controller/onboarding/login_controller.dart';
import 'package:psikoz/controller/onboarding/register_controller.dart';
import 'package:psikoz/core/global/dio_instance.dart';
import 'package:psikoz/product/service/service/dio_service.dart';
import 'package:psikoz/view/onboarding/register_view.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(
        dioService: DioServiceOnboard(
            Dio(BaseOptions(baseUrl: "http://192.168.1.14:8080/api/")))));
    Get.lazyPut<RegisterController>(() => RegisterController(
        dioService: DioServiceOnboard(DioInstances.instance.getDio)));
   
  }
}
