import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:psikoz/controller/onboarding/register_controller.dart';
import 'package:psikoz/core/components/buttons/psikoz_button.dart';
import 'package:psikoz/core/components/inputbar/psikoztextbar.dart';
import 'package:psikoz/core/utility/app/padding_utility.dart';
import 'package:psikoz/core/utility/app/sized_box_dummy.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/product/validator/onboarding_validate.dart';
import 'package:psikoz/product/view/horizontal_or_divider.dart';
import 'package:psikoz/view/onboarding/register_view.dart';
import 'package:psikoz/view/onboarding/register_view_doctor.dart';
import 'package:psikoz/view/onboarding/widgets/first_screen.dart';

import '../../core/components/buttons/text_icon_button.dart';
import '../../core/constants/app/app_constant.dart';

class RegisterFirstView extends GetView<RegisterController> {
  const RegisterFirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(
          "Kayıt ol",
        ),
      ),
      body: Center(
        child: Padding(
          padding: PaddinUtilty.horizontalPadding(
            height: 16,
          ).padding,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBoxDummy.height(
                  height: 10,
                ),
                TextIconButton(
                  onPressed: () {},
                  data: const Icon(
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
                SizedBoxDummy.height(
                  height: 10,
                ),
                HorizontalOrLine(label: "Yada", height: 0.8),
                PsikozTextBar(
                  hintText: AppConstant.emailHintText,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  validator: Validator.emailValidator,
                  textcontroller: controller.emailController,
                  
                ),
                PsikozButton(
                    onTap: () {
                        Get.toNamed("/register"); 
                    },
                    child: Text("Email ile devam edin",
                        style: Get.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold))),
               const Padding(
                  padding:  EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("Eğer bir hesaba sahipseniz giriş yapın"),
                ),
              ]),
        ),
      ),
    );
  }

  Widget button(String text, IconData? icon) {
    return OutlinedButton.icon(
      onPressed: () {
        if (text.contains("Kullanıcı")) {
          Get.toNamed("/register");
        } else if (text.contains("Psikolog")) {
          Get.toNamed("/doctorRegister");
        }
      },
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(
        text,
        style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white),
      ),
      style: OutlinedButton.styleFrom(
        shape:
            const StadiumBorder(side: BorderSide(color: Colors.blue, width: 1)),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: PaddinUtilty.topPadding(60.0).padding,
          child: Align(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(
              height: 100,
              width: 100,
              "assets/images/logo.svg",
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
