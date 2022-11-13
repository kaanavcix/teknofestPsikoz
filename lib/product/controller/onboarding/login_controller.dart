import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/service/firebase/firebase_auth_service.dart';
import 'package:psikoz/core/service/model/OnboardingModel/UserForLoginModel.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FireBaseServiceAuth fireBaseServiceAuth = FireBaseServiceAuth();
  var obscureText = false.obs;
  var animateControl = false.obs;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  var isFailed = false.obs;
  Future<void> logControl(String email, String password) async {
    if (formState.currentState != null && formState.currentState!.validate()) {
      await fireBaseServiceAuth
          .signInWithEmail(UserForLoginModel(email: email, password: password));
    } else {
      isFailed.toggle();
    }
  }

  changeVisible() {
    obscureText.toggle();
  }
}
