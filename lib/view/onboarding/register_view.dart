import 'package:flutter/material.dart';
import 'package:psikoz/core/constants/app/app_constant.dart';
import 'package:psikoz/core/service/model/OnboardingModel/UserForRegister.dart';
import 'package:psikoz/core/utility/app/padding_utility.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/controller/onboarding/register_controller.dart';
import 'package:get/get.dart';
import 'package:psikoz/view/onboarding/widgets/four_screen.dart';
import 'package:psikoz/view/onboarding/widgets/register_button.dart';
import '../../core/components/iconWidget/leading_widget.dart';
import 'widgets/first_screen.dart';
import 'widgets/second_screen.dart';
import 'widgets/third_screen.dart';

class RegisterScreens extends GetView<RegisterController> {
  const RegisterScreens({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = const [
      FirstScreen(),
      SecondScreen(),
      ThirdScreen(),
      FourScreen()
    ];
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: appBar(),
      body: Padding(
        padding: PaddinUtilty.horizontalPadding().padding,
        child: Obx(() => Form(
          key: controller.formState,

          child: Column(
                children: [
                  screens[controller.currentIndex.value],
                  SizedBox(
                    height: 55,
        
                    /// margin: EdgeInsets.only(bottom: Get.mediaQuery.viewInsets.bottom),
                    child: Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              controller.currentIndex.value != 0
                                  ? RegisterButton(
                                      color: EmbabedUtility.socialPurple,
                                      text: AppConstant.registerBackTitle,
                                      onPressed: () {
                                        controller.currentIndex.value--;
                                      })
                                  : const SizedBox(),
                              RegisterButton(
                                  color: EmbabedUtility.socialblue,
                                  text: controller.currentIndex.value == 3
                                      ? AppConstant.registerTextButton
                                      : AppConstant.registerContiuneTitle,
                                  onPressed: registerFunction)
                            ])),
                  ),
                ],
              ),
        )),
      ),
    );
  }

  void registerFunction() async {
    bool result =
        await controller.userNameController(controller.usernameController.text);

    if (result) {
    } else {
      if (controller.currentIndex.value != 3) {
        controller.currentIndex.value++;
      } else if(controller.currentIndex.value==3) {
        //print("data");
        await controller.registerControl(UserForRegister(
            email: controller.emailController.text,
            firstName: controller.nameController.text,
            password: controller.passwordController.text,
            userId: "",
            userName: controller.usernameController.text));
      }
    }
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      leading: const LeadingWidget(),
      title: Text(
        AppConstant.registerTextButton,
        style: Get.textTheme.bodyLarge,
      ),
    );
  }
}
