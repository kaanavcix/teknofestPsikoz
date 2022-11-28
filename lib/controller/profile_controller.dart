import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/service/firebase/firebase_db.dart';
import 'package:psikoz/core/service/model/user_model.dart';

import 'package:psikoz/controller/onboarding/login_controller.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  FirebaseDb db = FirebaseDb();
  void signout() async {
    // await  auth.signOut();
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
