import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding/register_controller.dart';
import '../../../core/components/inputbar/psikoztextbar.dart';
import '../../../core/constants/enums/Icon-enums.dart';

class ThirdScreen extends GetView<RegisterController> {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formState,
      autovalidateMode: validateMode(),
      child: Column(
        children: [
          Text(
            "Şifrenizi giriniz", // bu textleri düzenlicem
            style: Get.textTheme.headlineLarge,
          ),
          Obx(() => Padding(
                padding: const EdgeInsets.only(
                    right: 8.0, left: 8, top: 10, bottom: 10),
                child: PsikozTextBar(
                  validator: (String? value) => value!.isEmpty || value.length < 3
                      ? "Lütfen değer giriniz"
                      : null,
                  obscureText: controller.obscureText.value,
                  hintText: "Şifre",
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
                      duration: const Duration(seconds: 1))),
                  textInputAction: TextInputAction.done,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(15),
                    child: IconNames.lock.tosvgPictureConvert(null),
                  ),
                ),
              ))
        ],
      ),
    );
  }
  AutovalidateMode validateMode() {
    return (controller.isFailed.value
        ? AutovalidateMode.always
        : AutovalidateMode.disabled);
  }
}
