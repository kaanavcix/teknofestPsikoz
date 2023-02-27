import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import 'package:psikoz/product/view/horizontal_or_divider.dart';
import 'package:psikoz/view/onboarding/register_view.dart';
import 'package:psikoz/view/onboarding/register_first_screen.dart';

import '../../core/components/buttons/psikoz_button.dart';
import '../../core/components/buttons/text_icon_button.dart';
import '../../core/components/stacks/psikoz_stack.dart';
import 'widgets/psikoz_button_widget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            autovalidateMode: validateMode(),
            key: controller.formState,
            child: Padding(
              padding: PaddinUtilty.horizontalPadding(height: 16).padding,
              child: ListView(children: [
                const SizedBoxDummy.height(
                  height: kToolbarHeight,
                ),
                //deneme1topbar(),
                const Placeholder(fallbackHeight: 120),
                const SizedBoxDummy.height(
                  height: 20,
                ),

                emailTextBar(),
                Obx(() => passwordTextBar()),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Beni hatırla"),
                        Obx(() => Checkbox(
                              activeColor: EmbabedUtility.socialPink,
                              value: controller.isRemember.value,
                              onChanged: (value) {
                                controller.isRemember.value = value!;
                              },
                            ))
                      ],
                    ),
                    const Text("Şifremi unuttum")
                  ],
                ),
                Obx(() => button()),
                const SizedBoxDummy.height(
                  height: 10,
                ),
                HorizontalOrLine(label: "Ya da", height: 1),

                TextIconButton(
                  onPressed: () {},
                  data: Icon(
                    Icons.apple,
                    size: 24,
                  ),
                  text: "Apple ile devam edin",
                ),
                TextIconButton(
                    onPressed: () {},
                    text: "Google ile devam edin",
                    data: Image.asset(
                      "assets/images/google.png",
                      cacheHeight: 24,
                      cacheWidth: 24,
                    )),
                TextIconButton(
                  onPressed: () {
                    Get.to(RegisterFirstView());
                  },
                  text: "E-mail ile devam edin",
                  data: IconNames.email
                      .tosvgPictureConvert(null, width: 24, height: 24),
                ),
              ]),
            ),
          )),
    );
  }

  PsikozOnboardButton registerbutton() {
    return PsikozOnboardButton(
      paddingValue: 10,
      onTap: () => RegisterFirstView(),
      text: "Kayıt ol",
    );
  }

  Row deneme1topbar() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          height: 80,
          width: 80,
          "assets/images/logo.svg",
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Psikoz",
            style: TextStyle(
                fontSize: 60, fontWeight: FontWeight.bold, inherit: true),
          ),
        ),
      ],
    );
  }

  PsikozButton button() {
    return PsikozButton(
      onTap: () => controller.logControl(
          controller.emailController.text, controller.passwordController.text),
      child: controller.isLoading.value
          ? const CircularProgressIndicator.adaptive()
          : Text(
              AppConstant.loginButtonText,
              style: Get.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
    );
  }

  AutovalidateMode validateMode() {
    return (controller.isFailed.value
        ? AutovalidateMode.always
        : AutovalidateMode.disabled);
  }

  Widget passwordTextBar() {
    return Padding(
      padding: PaddinUtilty.horizontalPadding(
        height: 4,
      ).padding,
      child: PsikozTextBar(
        labelText: "Şifre",
        validator: Validator.validatorPassword,
        obscureText: controller.obscureText.value,
        hintText: AppConstant.passwordText,
        textcontroller: controller.passwordController,
        suffixIcon: Obx(() => AnimatedCrossFade(
            firstChild: IconButton(
                onPressed: () => controller.changeVisible(),
                icon: const Icon(
                  Icons.visibility_off,
                  color: Colors.white,
                  size: 18,
                )),
            secondChild: IconButton(
                onPressed: () => controller.changeVisible(),
                icon: const Icon(
                  Icons.visibility,
                  color: Colors.white,
                  size: 18,
                )),
            crossFadeState: controller.obscureText.value
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: DurationUtilty.normalDuration())),
        textInputAction: TextInputAction.done,
        prefixIcon: Padding(
          padding: PaddinUtilty.verticalPadding(height: 15).padding,
          child:
              IconNames.lock.tosvgPictureConvert(height: 12, width: 12, null),
        ),
      ),
    );
  }

  Widget emailTextBar() {
    return Padding(
      padding: PaddinUtilty.horizontalPadding(
        height: 4,
      ).padding,
      child: PsikozTextBar(
        validator: Validator.emailValidator,
        labelText: "E mail",
        hintText: AppConstant.emailHintText,
        textcontroller: controller.emailController,
        keyboardType: TextInputType.emailAddress,
        prefixIcon: Padding(
          padding: PaddinUtilty.verticalPadding(height: 15).padding,
          child: IconNames.email.tosvgPictureConvert(
            height: 16,
            width: 16,
            null,
          ),
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class rowButtons extends StatelessWidget {
  const rowButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.apple,
              color: Colors.white,
              size: 28,
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(9)),
        ),
        GestureDetector(
          onTap: () {
            Get.to(RegisterFirstView());
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.email,
                color: Colors.white,
                size: 28,
              ),
            ),
            decoration: BoxDecoration(
                color: EmbabedUtility.socialblue,
                borderRadius: BorderRadius.circular(9)),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.flutter_dash,
              color: Colors.white,
              size: 28,
            ),
          ),
          decoration: BoxDecoration(
              color: EmbabedUtility.socialpink,
              borderRadius: BorderRadius.circular(9)),
        ),
      ],
    );
  }
}
