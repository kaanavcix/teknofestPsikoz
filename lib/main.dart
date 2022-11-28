import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/constants/app/app_constant.dart';
import 'package:psikoz/core/init/theme/black_theme.dart';
import 'package:psikoz/controller/auth_state_changes.dart';
import 'package:psikoz/view/onboarding/onboarding_view.dart';
import 'core/init/theme/light_theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
      getPages: [
        GetPage(name: "/", page: ()=>OnboardingView())
      ],
        debugShowCheckedModeBanner: false,
        title: AppConstant.titleApp,
        themeMode: ThemeMode.system,
        darkTheme: darkTheme,
        enableLog: true,
        theme: lightTheme,
        home: const OnboardingView());
  }
}

Future<void> initService() async {
  await Get.putAsync(() async => await AuthStateChanges());
}
