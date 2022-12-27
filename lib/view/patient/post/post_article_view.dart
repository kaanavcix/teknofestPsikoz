import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/controller/post_controller.dart';
import 'package:psikoz/core/constants/app/app_constant.dart';
import 'package:psikoz/product/init/theme/text_theme.dart';
import 'package:psikoz/core/utility/app/padding_utility.dart';
import 'package:psikoz/core/utility/app/sized_box_dummy.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';

import '../../../core/constants/enums/Icon-enums.dart';
import 'post_view.dart';


class PostArticleView extends GetView<PostController> {
  const PostArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            AppConstant.articleTitle,
            style: Get.textTheme.displaySmall,
          ),
          actions: [
            Padding(
              padding: PaddinUtilty.normalPadding(
                padding: 8,
              ).padding,
              child: Icon(
                Icons.archive_outlined,
                color: Colors.white,
              ),
            )
          ]),
      body: Padding(
        padding: PaddinUtilty.normalPadding().padding,
        child: ListView(children: [
          formFiled("Başlık"),
          const SizedBoxDummy.height(height: 5),
          Padding(
            padding: PaddinUtilty.rightPadding(padding: 40).padding,
            child: formFiled("Alt Başlık"),
          ),
          Padding(
            padding: PaddinUtilty.normalPadding().padding,
            child: Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {},
                child: Text("Add Tag",
                    style: Get.textTheme.bodyMedium!.copyWith(
                      color: EmbabedUtility.socialblue,
                    )),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                fillColor: Colors.transparent,
                counterText: "",
                hintText: "Makalenizi yazabilirsiniz",
                hintStyle: TextStyle(fontSize: 12)),
            autocorrect: true,
            enableSuggestions: true,
            // maxLength: 500,
            minLines: 3,
            cursorColor: Colors.white,
            maxLines: 30,
            textInputAction: TextInputAction.next,
          ),
         const  SizedBoxDummy.height(height:10),
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
        ]),
      ),
    );
  }

  TextFormField formFiled(String? hintText) {
    return TextFormField(
      decoration: InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          disabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          fillColor: Colors.transparent,
          counterText: "",
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 18)),
      autocorrect: true,
      enableSuggestions: true,
      maxLength: 20,
      textInputAction: TextInputAction.next,
    );
  }
}
