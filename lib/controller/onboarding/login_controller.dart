import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:psikoz/product/base/IDioservice_user.dart';
import 'package:psikoz/product/service/model/post/post_model_output.dart';
import 'package:psikoz/product/service/model/tokens/token_model.dart';
import 'package:psikoz/product/service/model/onborading/login_model.dart';
import 'package:psikoz/product/service/model/onborading/register_model.dart';
import 'package:psikoz/product/service/model/user/user_cache_model.dart';
import 'package:psikoz/product/service/model/user/user_model.dart';

import '../../product/base/IDioService.dart';
import '../../product/service/model/result/result_model.dart';

class LoginController extends GetxController {
  IDioService dioService;
  IDioServiceUser dioUserService;

  LoginController({required this.dioService, required this.dioUserService});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var obscureText = true.obs;
  var animateControl = false.obs;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  var isFailed = false.obs;
  var isLoading = false.obs;

  Future<void> logControl(String email, String password) async {
    if (formState.currentState != null && formState.currentState!.validate()) {
      isLoading.toggle();
      await dioService
          .login(LoginModel(
              email: emailController.text, password: passwordController.text))
          .then((value) async {
        isLoading.toggle();

        final box = GetStorage("token");

        if (value is TokenModel) {
          await box.write("auth", value.token);
          var data = await dioUserService
              .getUserData(TokenInputModel(token: value.token));

          //bool patient = data.data?.isPatient=="1"?true:false;
          print(data.data?.isPatient);
          await box.write("patient", data.data?.isPatient);

          box.read("patient")
              ? Get.offAllNamed("/main")
              : Get.offAllNamed("/mainDoctor");
          print(data);
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
