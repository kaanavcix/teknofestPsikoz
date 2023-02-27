import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:psikoz/bindings/main_bindings.dart';
import 'package:psikoz/bindings/onboarding_bindings.dart';
import 'package:psikoz/product/service/model/user/user_model.dart';
import 'package:psikoz/view/onboarding/login_view.dart';
import 'package:psikoz/view/onboarding/login_view_new_design.dart';
import 'package:psikoz/view/onboarding/onboarding_view.dart';
import 'package:psikoz/view/onboarding/register_view.dart';
import 'package:psikoz/view/onboarding/register_view_doctor.dart';
import 'package:psikoz/view/onboarding/widgets/register_button.dart';

import '../../../view/doctor/main/main_view_doctor.dart';
import '../../../view/patient/main/main_view.dart';

final box = GetStorage("token");

List<GetPage<dynamic>>? getPages = [
  GetPage(
      name: "/",
      page: function,
      
      bindings: [OnboardingBinding(), MainBinding()]),
  GetPage(
      name: "/login",
      page: () => const LoginView(),
      binding: OnboardingBinding()),
  GetPage(
      name: "/register",
      page: () => const RegisterView(),
      binding: OnboardingBinding()),
       GetPage(
      name: "/doctorRegister",
      page: () => const RegisterDoctorView(),
      binding: OnboardingBinding()),
  GetPage(name: "/main", page: () => const MainView(), binding: MainBinding()),
  GetPage(name: "/mainDoctor", page: ()=>MainViewDoctor())
];

Widget function() => box.hasData("auth")
    ? 
         box.read("patient") == true
            ? const MainView()
            :  MainViewDoctor()
        :  LoginView();
