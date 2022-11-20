import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/components/inputbar/psikoztextbar.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/init/theme/text_theme.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/product/controller/onboarding/login_controller.dart';
import 'package:psikoz/product/onboarding/register_view.dart';

import '../../core/components/buttons/psikoz_button.dart';
import '../../core/components/stacks/psikoz_stack.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(vertical: 20);
    Get.put(LoginController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          autovalidateMode: (controller.isFailed.value
              ? AutovalidateMode.always
              : AutovalidateMode.disabled),
          key: controller.formState,
          child: Column(children: [
            const PsikozStack(),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: PsikozTextBar(
                validator: (String? value) => !GetUtils.isEmail(value ?? "")? "Email doğru değil":null ,
                hintText: "E-mail",
                textcontroller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Padding(
                  padding: padding,
                  child: IconNames.email.tosvgPictureConvert(
                    EmbabedUtility.socialLightGray,
                  ),
                ),
                textInputAction: TextInputAction.next,
              ),
            ),
            Obx(() => Padding(
                  padding: const EdgeInsets.only(
                      right: 8.0, left: 8, top: 10, bottom: 2),
                  child: PsikozTextBar(
                    validator: (String? value) => value!.isEmpty ||value.length<3?"Lütfen değer giriniz":null,
                    obscureText: controller.obscureText.value,
                    hintText: "Şifre",
                    textcontroller: controller.passwordController,
                    suffixIcon: Obx(() => AnimatedCrossFade(
                        firstChild: IconButton(
                            onPressed: () => controller.changeVisible(),
                            icon: Icon(Icons.visibility_off)),
                        secondChild: IconButton(
                            onPressed: () => controller.changeVisible(),
                            icon: Icon(Icons.visibility)),
                        crossFadeState: controller.obscureText.value
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: Duration(seconds: 1))),
                    textInputAction: TextInputAction.done,
                    prefixIcon: Padding(
                      padding: padding,
                      child: IconNames.lock.tosvgPictureConvert(
                        EmbabedUtility.socialLightGray,
                      ),
                    ),
                  ),
                )),
            PsikozButton(
              onTap: () => controller.logControl(
                  controller.emailController.text,
                  controller.passwordController.text),
              child: Text(
                "Giriş Yap",
                style: grSTextSB,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Hala Bir Hesaba Sahip Değilmisiniz ?",
                    style: grTertiarySB),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                    onTap: () => Get.to(const RegisterScreen()),
                    child: Text("Kayıt Olun",
                        style: grTertiarySB.copyWith(
                            color: EmbabedUtility.socialblue)))
              ]),
            ),
          ]),
        ));
  }
}
