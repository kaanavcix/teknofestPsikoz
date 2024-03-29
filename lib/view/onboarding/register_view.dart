import 'package:flutter/material.dart';
import 'package:psikoz/core/constants/app/app_constant.dart';
import 'package:psikoz/core/utility/app/padding_utility.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/controller/onboarding/register_controller.dart';
import 'package:get/get.dart';
import 'package:psikoz/product/service/model/onborading/register_model.dart';
import 'package:psikoz/product/service/model/result/result_model.dart';
import 'package:psikoz/view/onboarding/widgets/four_screen.dart';
import 'package:psikoz/view/onboarding/widgets/register_button.dart';
import '../../core/components/iconWidget/leading_widget.dart';
import '../../core/constants/enums/Icon-enums.dart';
import 'widgets/first_screen.dart';
import 'widgets/register_app_bar.dart';
import 'widgets/second_screen.dart';
import 'widgets/third_screen.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = const [
      FirstScreen(),
      ThirdScreen(),
      FourScreen()
    ];
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Kayıt Ol"),
      ),
      body: Padding(
        padding: PaddinUtilty.horizontalPadding(height: 16,).padding,
        child: Obx(() => Form(
              key: controller.formState,
              child: Column(
                children: [
                  screens[controller.currentIndex.value],
                  SizedBox(
                    height: 55,

                    /// margin: EdgeInsets.only(bottom: Get.mediaQuery.viewInsets.bottom),
                    child: Obx(() => buttons()),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget buttons() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      controller.currentIndex.value != 0
          ? RegisterButton(
   
              text: AppConstant.registerBackTitle,
              onPressed: () {
                controller.currentIndex.value--;
              })
          : const SizedBox(),
      RegisterButton(

          text: controller.currentIndex.value == 2
              ? AppConstant.registerTextButton
              : AppConstant.registerContiuneTitle,
          onPressed: registerFunction)
    ]);
  }

  void registerFunction() async {
    if (controller.currentIndex.value == 0) {
      var result = await controller
          .usernameDetection(controller.usernameController.text);

      if (result is SuccessModel) {
        controller.currentIndex.value++;
      } else if (result is ErrorModel) {
        Get.snackbar("Error", result.message.toString());
        //   print(controller.currentIndex.value.toString() + "ikinci print");
      }
    } else if (controller.currentIndex.value != 2 &&
        controller.currentIndex.value != 0) {
      // print(controller.currentIndex.value.toString() + "üçüncü print");

      controller.currentIndex.value++;
      // print(controller.currentIndex.value.toString() + "dörtüncü print");
    } else if (controller.currentIndex.value == 2) {
      print("data");

      //TODO: Model üzerinde ilerlemelerde bulunmalıyız.
      await controller.registerControl(RegisterModel(
        name: controller.nameController.text,
        email: controller.emailController.text,
        username: controller.nameController.text,
        password: controller.passwordController.text,
        age: controller.age.value.toString(),
        gender: controller.gender.value.toString(),
        isPatient: "1"
      ));
      controller.currentIndex.value = 0;
    }
  }
}
