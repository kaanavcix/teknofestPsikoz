import 'package:get/get.dart';
import 'package:psikoz/controller/onboarding/login_controller.dart';
import 'package:psikoz/controller/onboarding/register_controller.dart';
import 'package:psikoz/core/global/firebase_auth_instance.dart';
import 'package:psikoz/core/service/firebase/firebase_auth_service.dart';
import 'package:psikoz/view/onboarding/register_view.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
        () => LoginController(fireBaseServiceAuth: FireBaseServiceAuth()));
    Get.lazyPut<RegisterController>(
        () => RegisterController(auth: FireBaseServiceAuth()));
  }
}
