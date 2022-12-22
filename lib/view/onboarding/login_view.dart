import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/components/inputbar/psikoztextbar.dart';
import 'package:psikoz/core/constants/app/app_constant.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/utility/app/duration_utilty.dart';
import 'package:psikoz/core/utility/app/padding_utility.dart';
import 'package:psikoz/core/utility/app/sized_box_dummy.dart';

import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/controller/onboarding/login_controller.dart';
import 'package:psikoz/product/validator/onboarding_validate.dart';
import 'package:psikoz/view/onboarding/register_view.dart';
import 'package:psikoz/view/onboarding/widgets/register_first_screen.dart';

import '../../core/components/buttons/psikoz_button.dart';
import '../../core/components/stacks/psikoz_stack.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          autovalidateMode: validateMode(),
          key: controller.formState,
          child: ListView(children: [
            const PsikozStack(),
                      const SizedBoxDummy.height(height: 10,),

            emailTextBar(),
            Obx(() => passwordTextBar()),
            button(),
            const SizedBoxDummy.height(height: 10,),
            bottomText(),
          ]),
        ));
  }

  Padding bottomText() {
    const edgeInsets =  EdgeInsets.only(bottom: 3.0);
    return Padding(
            padding: edgeInsets,
            child:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(AppConstant.loginBottomText,
                  style: Get.textTheme.titleMedium!.copyWith(color: Colors.white)),
            const  SizedBoxDummy.width(width: 5,),
              InkWell(
                  onTap: () => Get.to(RegisterFirstView()
                  ,preventDuplicates: false),
                  child: Text(AppConstant.registerTextButton,
                      style: Get.textTheme.bodyLarge!
                          .copyWith(color: EmbabedUtility.socialblue)))
            ]),
          );
  }

  PsikozButton button() {
    return PsikozButton(
            onTap: () => controller.logControl(
                controller.emailController.text,
                controller.passwordController.text),
            child: Text(
              AppConstant.loginButtonText,
              style:
                  Get.textTheme.displayLarge?.copyWith(color: Colors.white),
            ),
          );
  }

  AutovalidateMode validateMode() {
    return (controller.isFailed.value
        ? AutovalidateMode.always
        : AutovalidateMode.disabled);
  }

  Padding passwordTextBar() {
    return Padding(
      padding: PaddinUtilty.normalPadding(
        padding: 10,
      ).padding,
      child: PsikozTextBar(
        validator: Validator.validatorPassword,
        obscureText: controller.obscureText.value,
        hintText: AppConstant.passwordText,
        textcontroller: controller.passwordController,
        suffixIcon: Obx(() => AnimatedCrossFade(
            firstChild: IconButton(
                onPressed: () => controller.changeVisible(),
                icon: const Icon(Icons.visibility_off)),
            secondChild: IconButton(
                onPressed: () => controller.changeVisible(),
                icon: const Icon(Icons.visibility)),
            crossFadeState: controller.obscureText.value
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: DurationUtilty.normalDuration())),
        textInputAction: TextInputAction.done,
        prefixIcon: Padding(
          padding: PaddinUtilty.verticalPadding(height: 20).padding,
          child: IconNames.lock.tosvgPictureConvert(null),
        ),
      ),
    );
  }

  

  Padding emailTextBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: PsikozTextBar(
        validator: Validator.emailValidator,
        hintText: AppConstant.emailHintText,
        textcontroller: controller.emailController,
        keyboardType: TextInputType.emailAddress,
        prefixIcon: Padding(
          padding: PaddinUtilty.verticalPadding(height: 20).padding,
          child: IconNames.email.tosvgPictureConvert(
            null,
          ),
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }

  
}
