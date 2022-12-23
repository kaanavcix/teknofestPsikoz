import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psikoz/product/service/model/Tokens/token_model.dart';
import 'package:psikoz/product/service/model/onborading/login_model.dart';
import 'package:psikoz/product/service/model/onborading/register_model.dart';

import '../../product/base/IDioService.dart';
import '../../product/service/model/result/result_model.dart';

class LoginController extends GetxController {
  IDioService dioService;

  LoginController({required this.dioService});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var obscureText = true.obs;
  var animateControl = false.obs;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  var isFailed = false.obs;
  var isLoading = false.obs;

  Future<void> logControl(String email, String password) async {
    if (formState.currentState != null && formState.currentState!.validate()) {
              print("asdasd");

      isLoading.toggle();
      await dioService
          .login(LoginModel(
              email: emailController.text, password: passwordController.text))
          .then((value) async {
        isLoading.toggle();

        final box = GetStorage("token");
        print(box.read("auth"));

        if (value is TokenModel) {
          await box.write("auth", value.token);
                  print(box.read("auth"));

          Get.offAllNamed("/main");
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
