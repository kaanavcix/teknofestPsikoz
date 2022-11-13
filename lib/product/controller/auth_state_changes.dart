import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/global/firebase_auth_instance.dart';
import 'package:psikoz/product/onboarding/login_view.dart';
import 'package:psikoz/product/view/main/main_view.dart';

class AuthStateChanges extends GetxController {
  late Rx<User?> users;
  late FirebaseAuth firebaseAuth;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    users.bindStream(FirebaseAuthInstance.firebaseAuth.userChanges());
    ever(users, changePage);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    firebaseAuth = FirebaseAuth.instance;
    users = Rx<User?>(firebaseAuth.currentUser);
  }

  changePage(User? user) {
    if (user == null) {
      Get.offAll(()=>LoginView());
    } else {
      Get.offAll(()=>MainView());
    }
  }
}
