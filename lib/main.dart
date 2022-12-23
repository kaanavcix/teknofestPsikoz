import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:psikoz/core/constants/app/app_constant.dart';
import 'package:psikoz/product/init/cache/hive_cach.dart';
import 'package:psikoz/product/init/theme/black_theme.dart';
import 'package:psikoz/controller/auth_state_changes.dart';
import 'package:psikoz/view/onboarding/login_view.dart';
import 'package:psikoz/view/onboarding/onboarding_view.dart';
import 'product/init/routes/get_list_page.dart';
import 'product/init/theme/light_theme.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init("token");
  runApp(const Psikoz());
}

class Psikoz extends StatelessWidget {
  const Psikoz({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        getPages: getPages,
        debugShowCheckedModeBanner: false,
        title: AppConstant.titleApp,
        themeMode: ThemeMode.dark,
        darkTheme: darkTheme,
        enableLog: true,
        theme: lightTheme,
        initialRoute: "/",);
  }
}


