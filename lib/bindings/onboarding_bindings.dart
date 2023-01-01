import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:psikoz/controller/main_controller.dart';
import 'package:psikoz/controller/onboarding/login_controller.dart';
import 'package:psikoz/controller/onboarding/register_controller.dart';
import 'package:psikoz/core/global/dio_instance.dart';
import 'package:psikoz/product/service/service/dio_service.dart';
import 'package:psikoz/product/service/service/dio_service_user.dart';
import 'package:psikoz/view/onboarding/register_view.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(
        dioService: DioServiceOnboard(DioInstanceTsApi.instance.dio),
        dioUserService: DioServiceUser(DioInstanceTsApi.instance.dio)));
    Get.lazyPut<RegisterController>(() => RegisterController(
        dioService: DioServiceOnboard(DioInstanceTsApi.instance.dio)));
  }
}
//     Dio(BaseOptions(baseUrl: "http://192.168.1.14:8080/api/"))p