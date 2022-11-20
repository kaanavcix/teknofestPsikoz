import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/global/firebase_auth_instance.dart';
import 'package:psikoz/core/service/firebase/firebase_db.dart';
import 'package:psikoz/product/onboarding/login_view.dart';
import 'package:psikoz/product/onboarding/onboarding_view.dart';
import 'package:psikoz/product/onboarding/register_view.dart';
import 'package:psikoz/view/main/main_view.dart';

class AuthStateChanges extends GetxController {
  late Rx<User?> users;
  late FirebaseAuth firebaseAuth;

  @override
  void onReady() {
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
      Get.offAll(() => const LoginView());
      // if (user?.refreshToken ==null) {
      //   Get.offAll(OnboardingView());
      // }
    } else {
      Get.put(FirebaseDb());
      Get.offAll(() => const MainView());
    }
  }
}
