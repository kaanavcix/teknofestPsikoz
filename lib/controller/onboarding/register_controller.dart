import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:get_storage/get_storage.dart';
import 'package:psikoz/product/service/model/result/result_model.dart';
import '../../core/constants/app/app_array_constant.dart';
import '../../product/base/IDioService.dart';
import '../../product/service/model/tokens/token_model.dart';
import '../../product/service/model/onborading/register_model.dart';

class RegisterController extends GetxController {
  RegisterController({required this.dioService});
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rx<String> gender = "".obs;
  Rx<int> age = 1.obs;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  var file = File("").obs;
  var fileName = "".obs;
  IDioService dioService;
  var currentIndex = 0.obs;
  var isFailed = false.obs;
  var obscureText = true.obs;
  var kvkkform = false.obs;
  var onamform = false.obs;
  var secretform = false.obs;

  Future<void> registerControl(RegisterModel registerModel) async {
    if (formState.currentState != null && formState.currentState!.validate()) {
      await dioService.register(registerModel).then((value) async {
        final box = GetStorage("token");

        if (value is TokenModel) {
          await box.write("auth", value.token);
          await box.write("patient", true);
          Get.toNamed("/");
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

  Future<BaseModel?> usernameDetection(String username) async {
    return await dioService.usernameDetection(username);
  }

  Future<void> registerControlDoctor() async {
    if (formState.currentState != null && formState.currentState!.validate()) {
      var data = FormData.fromMap({
        "username": usernameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "name": nameController.text,
        "age": age.value.toString(),
        "gender": gender.value.toString(),
        "is_patient": "0",
        "file": await MultipartFile.fromFile(file.value.path,
            filename: fileName.value)
      });
      await dioService.registerDoctor(data).then((value) async {
        final box = GetStorage("token");

        if (value is TokenModel) {
          await box.write("auth", value.token);
          await box.write("patient", false);
          Get.toNamed("/");
        } else if (value is ErrorModel) {
          Get.snackbar("Error", value.message.toString());
        }
      });
    } else {
      isFailed.toggle();
    }
  }

  
}
