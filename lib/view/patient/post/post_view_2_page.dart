import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:psikoz/core/utility/app/gradient-utility.dart';
import 'package:psikoz/controller/post_controller.dart';
import 'package:psikoz/view/patient/main/main_view.dart';

import '../../../core/utility/embabed/embabed_utility.dart';
import '../../../product/init/theme/text_theme.dart';
import '../../../product/service/model/user/user_model.dart';

class PostValidatePage extends GetView<PostController> {
  PostValidatePage({required this.userModel, Key? key}) : super(key: key);

  UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: EmbabedUtility.socialLightGray),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "bex",
                          style: grBodyB,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(controller.postEditinController.text),
                    ]),
              ),
            ),
            Obx(() => SwitchListTile(
                  value: controller.switchClick3.value,
                  onChanged: (value) => controller.onChanged2(value),
                  activeColor: EmbabedUtility.socialPurple,
                  title: Text(
                    "Anonim olarak paylaş",
                    style: grBodyB,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                child: Center(
                  child: Text("Mini quiz ", style: grBodyB),
                ),
                height: kToolbarHeight,
                width: Get.width,
                decoration: BoxDecoration(
                  gradient: GradientUtility.socialGradient,
                  borderRadius: BorderRadius.circular(23),
                ),
              ),
            )
          ]),
    );
  }

  AppBar appbar() {
    return AppBar(
      leadingWidth: 100,
      leading: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Geri dön",
            style: grSTextB.copyWith(color: EmbabedUtility.socialblue),
          )),
      centerTitle: true,
      title: Text(
        "Post Düzenlemeleri",
        style: grSTextB.copyWith(color: Colors.white, letterSpacing: 0.2),
      ),
      actions: [
        ShareButton(
          function: () async {
            await controller
                .addPost(
                    userModel?.data?.id, controller.postEditinController.text)
                .then((value) {
              controller.postEditinController.text = "";
              controller.maincontroller.selectedItem.value = 0;
              Get.off(MainView());
            });
          },
        )
      ],
    );
  }

  Row switchlisttlie(Rx<bool> expression, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: grBodyB,
        ),
        lottieSwitch(expression)
      ],
    );
  }

  lottieSwitch(Rx<bool> expression) {
    return GestureDetector(
      onTap: () {
        expression.toggle();
        controller.switchAnimation.animateTo(expression.value ? 0 : 0.25);
      },
      child: Lottie.asset("assets/lotties/switchs.json",
          reverse: true,
          frameRate: FrameRate.composition,
          height: 55,
          controller: controller.switchAnimation),
    );
  }
}

class ShareButton extends StatelessWidget {
  ShareButton({Key? key, required this.function}) : super(key: key);

  void Function()? function;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
        child: ElevatedButton(
          onPressed: function,
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)),
            backgroundColor: EmbabedUtility.socialPurple,
          ),
          child: Text(
            "Paylaş",
            style: grSTextB.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
