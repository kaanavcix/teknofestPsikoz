import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:psikoz/core/init/theme/black_theme.dart';
import 'package:psikoz/core/service/firebase/firebase_db.dart';
import 'package:psikoz/product/controller/auth_state_changes.dart';
import 'package:psikoz/product/controller/home_controller.dart';
import 'package:psikoz/product/onboarding/onboarding_view.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => initService());
  runApp(const Psikoz());
}

class Psikoz extends StatelessWidget {
  const Psikoz({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Psikoz',
  themeMode: ThemeMode.light,
        darkTheme: darkTheme,
        enableLog: true,
        theme: lightTheme,
        home: OnboardingView());
  }
}

Future<void> initService() async {
  await Get.putAsync(() async => await AuthStateChanges());
    

}


