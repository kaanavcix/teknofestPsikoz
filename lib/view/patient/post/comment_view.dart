import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:psikoz/controller/comment_controller.dart';
import 'package:psikoz/controller/post_controller.dart';
import 'package:psikoz/core/components/comments/comments_bar.dart';
import 'package:psikoz/core/components/post/post_bar.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/constants/app/app_constant.dart';
import 'package:psikoz/core/utility/app/sized_box_dummy.dart';
import 'package:psikoz/product/init/theme/text_theme.dart';
import 'package:psikoz/product/service/model/post/post_model_output.dart';
import 'package:psikoz/core/utility/app/scroll_pyhcis_utility.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';


import '../../../core/components/iconWidget/leading_widget.dart';
import '../../../product/view/appointment_view.dart';

class CommentView extends GetView<CommentController> {
  CommentView({Key? key, required this.post}) : super(key: key);

  Data? post;

  @override
  Widget build(BuildContext context) {
    Get.put(CommentController());
    return GetBuilder<CommentController>(
      init: CommentController(),
      initState: (state) {
        controller.getComments(post!.id ?? 11);
      },
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: SafeArea(
            child: commentBar(),
          ),
          appBar: appBar(),
          body: ListView(
              physics: const ScrollPyhcisyUtilty.bouncAlways(),
              children: [
                postbar(context),
                bodyTitle(controller),
              ]),
        );
      },
    );
  }

  Widget postbar(BuildContext context) {
    return PostBar(
        null,
        null,
        () => Get.to(()=>AppointmentView()),
        text: post!.content ?? "",
        userName: post!.username ?? "",
        time: "",
        category: post!.category ?? "");
  }

  Padding bodyTitle(CommentController controller) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppConstant.messageTitle,
                style:
                    grTertiary.copyWith(color: Colors.white, letterSpacing: 2),
              ),
              Text(AppConstant.dummyMessage,
                  style: grTertiaryB.copyWith(
                      color: Colors.white, letterSpacing: 0)),
            ],
          ),
          SizedBoxDummy.height(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: post?.comment?.length,
            itemBuilder: (BuildContext context, int index) {
              var comment = controller.commentModel?.data?[index];
              return ListTile(
                title: Text(
                  comment?.username ?? "",
                  style: Get.textTheme.bodyMedium,
                ),
                subtitle: Text(
                  comment?.comment ?? "",
                  style: Get.textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget commentBar() {
    return Container(
      margin: EdgeInsets.only(bottom: Get.mediaQuery.viewInsets.bottom),
      height: 55,
      color: EmbabedUtility.socialGray,
      child: const CommentsBar(),
    );
  }

  AppBar appBar() {
    return AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          AppConstant.privateRoom,
          style: grSTextB.copyWith(
            color: Colors.white,
          ),
        ));
  }
}
