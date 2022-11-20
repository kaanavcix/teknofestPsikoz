import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psikoz/core/components/buttons/psikoz_button.dart';
import 'package:psikoz/core/components/inputbar/psikoztextbar.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/init/theme/text_theme.dart';
import 'package:psikoz/core/service/firebase/firebase_auth_service.dart';
import 'package:psikoz/core/service/firebase/firebase_db.dart';
import 'package:psikoz/core/service/model/OnboardingModel/UserForRegister.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/product/controller/onboarding/register_controller.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var edgeInsets = EdgeInsets.symmetric(vertical: 20);
    return sc(edgeInsets);
  }

  Scaffold sc(EdgeInsets edgeInsets) {
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


class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller2 = Get.put(FireBaseServiceAuth());
        Get.put(RegisterController());


    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title:  Text("Üye Ol",style: grBodyB.copyWith(color: Colors.white)),
          centerTitle: true,
          elevation: 0,
        ),
        body: Obx(() => steppertry(context,)));
  }

  Stepper steppertry(BuildContext context,) {
    return Stepper(
      physics: NeverScrollableScrollPhysics(),
        margin: EdgeInsets.all(20),
        currentStep: controller.currentIndex.value,
        elevation: 0,
        onStepContinue: () =>
            controller.currentIndex.value == steps(controller).length - 1
                ? controller.registerControl(UserForRegister(firstName: controller.nameController.text,
                email: controller.emailController.text,
                password: controller.passwordController.text,
              userName: controller.usernameController.text ))
                : controller.currentIndex.value++,
        onStepCancel: () => controller.currentIndex.value == 0
            ? null
            : controller.currentIndex.value--,
        onStepTapped: (index) {
          controller.currentIndex.value = index;
        },
        
        type: StepperType.horizontal,
        steps: steps(controller),
        controlsBuilder: (context, ControlsDetails details) => Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: details.onStepContinue,
                  child: Text(controller.currentIndex.value == 2
                      ? "Kayıt Ol"
                      : "Devam et"),
                  style: ElevatedButton.styleFrom(
                     
                     foregroundColor: EmbabedUtility.socialblue,
                      fixedSize: Size.fromHeight(45) // size ayarlama
                      ),
                )),
                controller.currentIndex.value == 0
                    ? const SizedBox(
                        width: 0,
                        height: 0,
                      )
                    : const SizedBox(
                        width: 16,
                      ),
                controller.currentIndex.value == 0
                    ? const SizedBox(
                        width: 0,
                        height: 0,
                      )
                    : Expanded(
                        child: TextButton(
                        onPressed: details.onStepCancel,
                        child: Text("Geri Dön"),
                        style: TextButton.styleFrom(
                          foregroundColor: EmbabedUtility.socialPurple,
                            fixedSize: const Size.fromHeight(45)),
                      ))
              ],
            ));
  }
}

List<Step> steps(RegisterController controller) => [
      Step(
        isActive: controller.currentIndex.value >= 0,
        state: controller.currentIndex.value > 0
            ? StepState.complete
            : StepState.indexed,
        title: Text(
          "Kullanıcı adı",
          style: Get.textTheme.headline1,
        ),
        content: Column(
          children: [
            Text(
              "İlk olarak bir kullanıcı adı belirleyiniz",
              style: Get.textTheme.bodyMedium,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 8.0, left: 8, top: 3, bottom: 20),
              child: PsikozTextBar(
                  hintText: "Kullanıcı Adı",
                  prefixIcon: Icon(Icons.person, size: 20),
                  textcontroller: controller.usernameController),
            ),
          ],
        ),
      ),
      Step(
        isActive: controller.currentIndex.value >= 1,
        title: Text("E-mail",
                      style: Get.textTheme.headline1,
),
        content: Column(children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 8.0, left: 8, top: 2, bottom: 20),
            child: PsikozTextBar(
               hintText: "Email",
                  prefixIcon: Icon(Icons.person, size: 20),
                  textcontroller: controller.emailController),
          ),
        ]),
      ),
      Step(
        isActive: controller.currentIndex.value >= 2,
        title: Text("Şifre",
               style: Get.textTheme.headline1,
),
        content: Column(children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 8.0, left: 8, top: 2, bottom: 2),
            child: PsikozTextBar(
               hintText: "Şifre",
                  prefixIcon: Icon(Icons.person, size: 20),
                  textcontroller: controller.passwordController),
          ),
         
        ]),
      )
    ];