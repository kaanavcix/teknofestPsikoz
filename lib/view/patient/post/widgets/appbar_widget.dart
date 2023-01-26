import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/controller/post_controller.dart';
import 'package:psikoz/controller/user_controller.dart';
import 'package:psikoz/view/patient/main/main_view.dart';
import 'package:psikoz/view/patient/post/post_forum_view.dart';

import '../../../../core/utility/embabed/embabed_utility.dart';
import '../post_view_2_page.dart';

class PostAppbar extends GetView<PostController> with PreferredSizeWidget {
  PostAppbar({
    required this.labelText,
    required this.text,
    Key? key,
  }) : super(key: key);
  String text;
  String labelText;
  @override
  Widget build(BuildContext context) {
    var controller2 = Get.find<UserController>();
    return AppBar(
      leadingWidth: 70,
      leading: TextButton(
        onPressed: () {
          Get.defaultDialog(
            cancel: TextButton(
                onPressed: () {
                  Get.back(canPop: false);
                                    Get.back(canPop: false);

                },
                child: Text("Geri dön")),
            confirm: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("İptal et")),
            title: "Emin misiniz? ",
            content: Text("Gönderiyi silmek istediğinize eminmisiniz ? "),
          );
        },
        child: Text(
          labelText,
          style: Get.textTheme.headlineLarge!.copyWith(
            color: EmbabedUtility.socialblue,
          ),
        ),
      ),
      centerTitle: true,
      title: Text(text, style: Get.textTheme.displayLarge),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
            child: ElevatedButton(
              onPressed: () {
                if (controller.postEditinController.text.length < 10) {
                  Get.snackbar("Hata", "Karakter sayısı 10 dan az");
                } else {
                  Get.to(PostValidatePage(
                    userModel: controller2.userModel,
                  ));
                }
              },
              style: ElevatedButton.styleFrom(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48)),
                backgroundColor: EmbabedUtility.socialPurple,
              ),
              child: Text(
                "Paylaş",
                style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
