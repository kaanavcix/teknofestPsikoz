/* import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:psikoz/product/service/model/Tokens/token_model.dart';

import 'package:psikoz/view/main/feelbar_view.dart';
import 'package:psikoz/view/onboarding/login_view.dart';
import 'package:psikoz/view/onboarding/onboarding_view.dart';
import 'package:psikoz/view/onboarding/register_view.dart';
import 'package:psikoz/view/main/main_view.dart';

class AuthStateChanges extends GetxController {
  late Rx<TokenModel> tokenModel;
  

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
      Get.offAllNamed("/login");
      // if (user?.refreshToken ==null) {
      //   Get.offAll(OnboardingView());
      // }
    } else {
      Get.put(FirebaseDb());
      Get.offAll(FeelBarView());
    }
  }
}




Future<String?> checkToken() async {
    String token = await box.get(HivePath.tokenAuth.name);

    if (token == "") {
      return "";
    } else if (token.isNotEmpty || token.length > 3) {
      return token;
    }
    notifyListeners();
    return null;
  }

  Future<String> getToken() async {
    var boxs = await Hive.openBox(HivePath.token.name); // try

    String token = await boxs.get(HivePath.tokenAuth.name);
 notifyListeners();
    return token;
  }

  Future<String> signOut() async {
    String token = await box.get(HivePath.tokenAuth.name);
     notifyListeners();
    return token;
  } */