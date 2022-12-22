import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:psikoz/core/service/firebase/firebase_auth_service.dart';
import 'package:psikoz/core/service/model/OnboardingModel/UserForRegister.dart';

class RegisterController extends GetxController {
    RegisterController({
    required this.auth,
  });
  //IfirebaseAuth firebaseAuth = FirebaseAuthService();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  FireBaseServiceAuth auth;
  var currentIndex = 0.obs;
  var isFailed = false.obs;
  var obscureText = true.obs;


  Future<void> registerControl(UserForRegister userForRegister) async {
    if (formState.currentState != null && formState.currentState!.validate()) {
      auth.signUpWithEmail(userForRegister);
      print("data");
    } else {
      isFailed.toggle();
    }
  }

  Future<bool> userNameController(String username) async {
    return auth.existUsername(username);
  }

  changeVisible() {
    obscureText.toggle();
  }
}
