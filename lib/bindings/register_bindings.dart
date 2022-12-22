import 'package:get/get.dart';
import 'package:psikoz/core/global/firebase_auth_instance.dart';
import 'package:psikoz/core/service/firebase/firebase_auth_service.dart';

import '../controller/onboarding/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
        () => RegisterController(auth: FireBaseServiceAuth()));
  }
}
