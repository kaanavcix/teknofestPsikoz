import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:psikoz/core/utility/app/gradient-utility.dart';
import 'package:psikoz/controller/post_controller.dart';
import '../../product/init/theme/text_theme.dart';
import '../../core/utility/embabed/embabed_utility.dart';
import 'package:image_picker/image_picker.dart';

class PostValidatePage extends GetView<PostController> {
  PostValidatePage({Key? key}) : super(key: key);
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
            Obx(
              () => Column(
                children: [
                  SwitchListTile(
                    value: controller.switchClick1.value,
                    onChanged: (value) => controller.onChanged(value),
                    activeColor: EmbabedUtility.socialPurple,
                    title: Text(
                      "Yorumları kapat",
                      style: grBodyB,
                    ),
                  ),
                  Obx(() => SwitchListTile(
                        value: controller.switchClick2.value,
                        onChanged: (value) => controller.onChanged1(value),
                        activeColor: EmbabedUtility.socialPurple,
                        title: Text(
                          "Beğenileri kapat",
                          style: grBodyB,
                        ),
                      )),
                  Obx(() => SwitchListTile(
                        value: controller.switchClick3.value,
                        onChanged: (value) => controller.onChanged2(value),
                        activeColor: EmbabedUtility.socialPurple,
                        title: Text(
                          "Anonim olarak paylaş",
                          style: grBodyB,
                        ),
                      )),
                ],
              ),
            ),
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
            child: ElevatedButton(
              onPressed: () {
                controller
                    .addPost()
                    .then((value) {
                  controller.postEditinController.text = "";
                  controller.maincontroller.selectedItem.value = 0;
                  Get.back();
                });
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48)),
                backgroundColor: Get.theme.colorScheme.secondary,
              ),
              child: Text(
                "Paylaş",
                style: grSTextB.copyWith(color: Colors.white),
              ),
            ),
          ),
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
