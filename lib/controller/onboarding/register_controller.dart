import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psikoz/product/service/model/result/result_model.dart';

import '../../product/base/IDioService.dart';
import '../../product/service/model/tokens/token_model.dart';
import '../../product/service/model/onborading/login_model.dart';
import '../../product/service/model/onborading/register_model.dart';

class RegisterController extends GetxController {
  RegisterController({required this.dioService});
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  IDioService dioService;
  var currentIndex = 0.obs;
  var isFailed = false.obs;
  var obscureText = true.obs;

  Future<void> registerControl(RegisterModel registerModel) async {
    if (formState.currentState != null && formState.currentState!.validate()) {
      await dioService.register(registerModel).then((value) async {
        final box = GetStorage("token");

        if (value is TokenModel) {
          await box.write("auth", value.token);
        } else if (value is ErrorModel) {
          Get.snackbar("Error", value.message.toString());
        }
      });
    } else {
      isFailed.toggle();
    }
  }

  changeVisible() {
    obscureText.toggle();
  }
}
