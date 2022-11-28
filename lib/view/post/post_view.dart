import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/init/theme/text_theme.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/service/firebase/firebase_db.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/controller/post_controller.dart';
import 'package:psikoz/view/post/post_view_2_page.dart';
import 'package:psikoz/view/post/widgets/appbar_widget.dart';

class PostView extends GetView<PostController> {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PostController());
    var db = Get.find<FirebaseDb>();

    var hintText2 = " Psikolojik problemlerinizi buradan ifade edebilirsiniz";
    const radius = Radius.circular(100);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PostAppbar(labelText: "Vazgeç", text: "Gönderi"),
      body: Column(
        children: [
          Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("${db.user.first.username}", style: grSText),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: TextFormField(
                  autofocus: true,
                  autocorrect: true,
                  maxLength: 500,
                  controller: controller.postEditinController,
                  minLines: 1,
                  maxLines: 9,
                  keyboardAppearance: Brightness.dark,
                  decoration: InputDecoration(
                    counterText: "",
                    hintText: hintText2,
                    hintStyle: grBody,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    filled: false,
                    border: InputBorder.none,
                  ),
                  enableSuggestions: true,
                  enableIMEPersonalizedLearning: true,
                  cursorColor: EmbabedUtility.socialwhite,
                  cursorRadius: radius,
                  keyboardType: TextInputType.text,
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
                      ScrollBar(controller: controller, ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget? buildcounter(BuildContext context,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength}) {
    return GetBuilder<PostController>(
      init: PostController(),
      initState: (_) {},
      builder: (_) {
        return Container(
          height: 55,
          width: currentLength == maxLength
              ? maxLength!.toDouble()
              : currentLength.toDouble(),
          color: EmbabedUtility.socialwhite,
        );
      },
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

class ScrollBar extends StatelessWidget {
  const ScrollBar({
    Key? key,
    required this.controller,
   
  }) : super(key: key);

  final PostController controller;
  

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        GestureDetector(
          onTap: () => controller.getPickedImage(ImageSource.camera),
          child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: IconNames.camera.tosvgPictureConvert(Colors.white)),
        ),
        GestureDetector(
          onTap: () => controller.getPickedImageList(ImageSource.gallery),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: IconNames.image.tosvgPictureConvert(Colors.white),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          child: IconNames.gif.tosvgPictureConvert(Colors.white),
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          child: IconNames.attachment.tosvgPictureConvert(Colors.white),
        ),
      ]),
    );
  }
}

