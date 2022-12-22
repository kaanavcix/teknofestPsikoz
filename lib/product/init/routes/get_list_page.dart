import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:psikoz/bindings/main_bindings.dart';
import 'package:psikoz/bindings/onboarding_bindings.dart';
import 'package:psikoz/bindings/register_bindings.dart';
import 'package:psikoz/view/main/main_view.dart';
import 'package:psikoz/view/onboarding/login_view.dart';
import 'package:psikoz/view/onboarding/onboarding_view.dart';
import 'package:psikoz/view/onboarding/register_view.dart';
import 'package:psikoz/view/onboarding/widgets/register_button.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: "/", page: ()=> const OnboardingView()),
  GetPage(name: "/login", page: ()=>const LoginView(), binding: OnboardingBinding()),
    GetPage(name: "/register", page: ()=>const RegisterScreens(),binding: OnboardingBinding()),
    GetPage(name: "/main", page: ()=>const MainView(),binding: MainBinding()),

];
