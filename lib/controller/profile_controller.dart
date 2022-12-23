import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:psikoz/controller/onboarding/login_controller.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final box = GetStorage("token");
  void signout() async {
    await box.remove("auth").then((value) { 
    print(box.read("auth"));
    Get.offAndToNamed("/");});
  }

  @override
  Future<void> onInit() async {
    // user.bindStream(service.getUserInformation());
    tabController = TabController(
        length: 3,
        vsync: this,
        animationDuration: const Duration(milliseconds: 100),
        initialIndex: 0);
  }
}
