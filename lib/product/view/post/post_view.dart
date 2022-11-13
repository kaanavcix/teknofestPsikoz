import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/init/theme/text_theme.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/product/controller/post_controller.dart';
import 'package:psikoz/product/view/post/post_view_2_page.dart';

class PostView extends GetView<PostController> {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PostController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: 70,
        leading: TextButton(
          onPressed: () {
            Get.defaultDialog(
                title: "Emin misiniz? ",
                content:
                    Text("Bu Gönderiyi silmek istediğinize eminmisiniz ? "));
          },
          child: Text(
            "Discard",
            style: grTertiaryB.copyWith(
              color: EmbabedUtility.socialblue,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "CREATE",
          style: grSTextB.copyWith(
            color: Colors.white,
            letterSpacing: 0.4,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(PostValidatePage(
                    title: controller.postEditinController.text,
                  ));
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
      body: Column(
        children: [
          Obx(
            () => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue[900],
                      radius: 24,
                      backgroundImage: NetworkImage(
                      ""),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child:
                          Text(""),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: TextFormField(
                    autocorrect: true,
                    maxLength: 500,
                    controller: controller.postEditinController,
                    //maxLengthEnforcement: MaxLengthEnforcement.none,
                    minLines: 1,
                    maxLines: 7,
                    keyboardAppearance: Brightness.dark,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: " Ne yapıyorsun  ?",
                      hintStyle: grBody,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      filled: false,
                      border: InputBorder.none,
                    ),
                    enableSuggestions: true,
                    enableIMEPersonalizedLearning: true,
                  ),
                ),
                Obx(() => Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(width: 0.4, color: Colors.white),
                          ),
                          child: GestureDetector(
                              onTap: () => controller.clickButton.toggle(),
                              child: controller.clickButton.value
                                  ? IconNames.close.tosvgPictureConvert(
                                      Colors.white,
                                      width: 18,
                                      height: 18)
                                  : IconNames.plus.tosvgPictureConvert(
                                      Colors.white,
                                      width: 18,
                                      height: 18)),
                        ),
                        AnimatedContainer(
                          clipBehavior: Clip.antiAlias,
                          curve: Curves.easeInCubic,
                          duration: const Duration(seconds: 1),
                          width: controller.clickButton.value ? 170 : 0,
                          height: 30,
                          decoration: BoxDecoration(
                            color: EmbabedUtility.socialLightGray,

                            //shape: BoxShape.circle,
                            borderRadius: BorderRadius.circular(48),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () => controller
                                      .getPickedImage(ImageSource.camera),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: IconNames.camera
                                          .tosvgPictureConvert(Colors.white)),
                                ),
                                GestureDetector(
                                  onTap: () => controller
                                      .getPickedImageList(ImageSource.gallery),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: IconNames.image
                                        .tosvgPictureConvert(Colors.white),
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: IconNames.gif
                                      .tosvgPictureConvert(Colors.white),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: IconNames.attachment
                                      .tosvgPictureConvert(Colors.white),
                                ),
                              ]),
                        ),
                      ],
                    )),
                SizedBox(
                    height: 200,
                    width: Get.width,
                    child: GetBuilder<PostController>(
                        init: PostController(),
                        initState: (_) {},
                        builder: (_) {
                          return image(_);
                        }))
              ],
            ),
          )
        ],
      ),
    );
  }

  ListView image(PostController controller) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.photoList.length,
      itemBuilder: (BuildContext context, int index) {
        return Image.file(File(controller.photoList[index]!.path));
      },
    );
  }
}
