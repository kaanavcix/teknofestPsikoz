import 'package:flutter/material.dart';
import 'package:psikoz/core/components/comments/comments_bar.dart';
import 'package:psikoz/core/components/post/post_bar.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/constants/app/app_constant.dart';
import 'package:psikoz/product/init/theme/text_theme.dart';
import 'package:psikoz/product/service/model/post/post_model_output.dart';
import 'package:psikoz/core/utility/app/scroll_pyhcis_utility.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/controller/home_controller.dart';
import '../../core/components/iconWidget/leading_widget.dart';

class CommentView extends GetView<HomeController> {
  CommentView({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {  
  return GetBuilder(
      builder: (controller) {
        return Scaffold(
          // resizeToAvoidBottomInset: false,
          bottomNavigationBar: SafeArea(
            child: commentBar(),
          ),
          appBar: appBar(),
          body: ListView(
              physics: const ScrollPyhcisyUtilty.neverScroll(),
              children: [
                postBar(PostModel()),
                bodyTitle(),
              ]),
        );
      },
    );
  }

  PostBar postBar(PostModel data,) {
    var model = data.data?[0];
    return PostBar(null,null,
        text:model!.content ?? "",
        userName: model.user!.username ?? "" ,
        time: "",
        onTapLike: null,
        likeLength: "0");
  }

  Padding bodyTitle() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppConstant.messageTitle,
            style: grTertiary.copyWith(color: Colors.white, letterSpacing: 2),
          ),
          Text(AppConstant.dummyMessage,
              style:
                  grTertiaryB.copyWith(color: Colors.white, letterSpacing: 0)),
        ],
      ),
    );
  }

  Container commentBar() {
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
        leading: const LeadingWidget(),
        title: Text(
          AppConstant.postTitleComment,
          style: grSTextB.copyWith(
            color: Colors.white,
          ),
        ));
  }
}
 //  controller.db.takeAndRemoveLike(argument.uidPost,
              //    argument.likeList ?? [], controller.db.auth);