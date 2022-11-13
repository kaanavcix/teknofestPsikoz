import 'package:flutter/material.dart';
import 'package:psikoz/core/components/buttons/psikoz_button.dart';
import 'package:psikoz/core/components/inputbar/psikoztextbar.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/service/model/OnboardingModel/UserForRegister.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/product/controller/onboarding/register_controller.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    var edgeInsets = EdgeInsets.symmetric(vertical: 20);
    return Scaffold(
        body: Form(
          autovalidateMode: controller.isFailed.value?AutovalidateMode.always:AutovalidateMode.disabled,
          key: controller.formState,
          child: Column(
            
              children: [
          PsikozTextBar(
              prefixIcon: Padding(
                  padding: edgeInsets,
                  child: IconNames.profile
                      .tosvgPictureConvert(EmbabedUtility.socialLightGray)),
              hintText: "İsim",
              validator: (String? value) => value!.isEmpty || value.length < 3
                  ? "Lütfen değer giriniz"
                  : null,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              textcontroller: controller.nameController),
          PsikozTextBar(
            hintText: "Kullanıcı Adı",
            validator: (String? value) => value!.isEmpty || value.length < 3
                ? "Lütfen değer giriniz"
                : null,
            textcontroller: controller.usernameController,
            textInputAction: TextInputAction.next,
          ),
          PsikozTextBar(
            hintText: "E-mail",
            validator: (String? value) =>
                !GetUtils.isEmail(value ?? "") ? "Email doğru değil" : null,
            textcontroller: controller.emailController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Padding(
                padding: edgeInsets,
                child: IconNames.email
                    .tosvgPictureConvert(EmbabedUtility.socialLightGray)),
          ),
          PsikozTextBar(
            hintText: "Şifre",
            textcontroller: controller.passwordController,
            validator: (String? value) => value!.isEmpty || value.length < 3
                ? "Lütfen değer giriniz"
                : null,
            prefixIcon: Padding(
                padding: edgeInsets,
                child: IconNames.lock
                    .tosvgPictureConvert(EmbabedUtility.socialLightGray)),
          ),
          PsikozButton(
            child: const Text("Kayıt Ol"),
            onTap: () {
              print("deneme");
              controller.registerControl(UserForRegister(
                  firstName: controller.nameController.text,
                  email: controller.emailController.text,
                  password: controller.passwordController.text,
                  userId: "",
                  userName: controller.usernameController.text));
            },
          ),
              ],
            ),
        ));
  }
}
