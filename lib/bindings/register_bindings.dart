import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:psikoz/product/service/service/dio_service.dart';
import 'package:psikoz/product/service/service/dio_service_db.dart';

import '../controller/onboarding/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
        () => RegisterController(dioService: DioServiceOnboard(Dio())));
  }
}
