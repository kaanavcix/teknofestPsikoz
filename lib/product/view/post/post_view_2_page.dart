import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/product/controller/post_controller.dart';
import '../../../core/init/theme/text_theme.dart';
import '../../../core/utility/embabed/embabed_utility.dart';
import 'package:image_picker/image_picker.dart';

class PostValidatePage extends GetView<PostController> {
  PostValidatePage({this.title, Key? key}) : super(key: key);
  String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        leading: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              "Discard",
              style: grSTextB.copyWith(color: EmbabedUtility.socialblue),
            )),
        centerTitle: true,
        title: Text(
          "CREATE",
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
                      .createPostControl(controller.postEditinController.text,
                          controller.photoList)
                      .then((value) {
                    controller.photoList = [];
                    controller.postEditinController.text = "";
                    controller.maincontroller.selectedItem.value = 0;
                    Get.back();
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48)),
                  primary: Get.theme.colorScheme.secondary,
                ),
                child: Text(
                  "Publish",
                  style: grSTextB.copyWith(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(children: []),
    );
  }
}
