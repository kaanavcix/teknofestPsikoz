import 'package:flutter/material.dart';
import 'package:psikoz/core/components/comments/comments_bar.dart';
import 'package:psikoz/core/components/post/post_bar.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/constants/app/app_constant.dart';
import 'package:psikoz/core/init/theme/text_theme.dart';
import 'package:psikoz/core/service/firebase/firebase_db.dart';
import 'package:psikoz/core/service/model/post/post_model_output.dart';
import 'package:psikoz/core/utility/app/scroll_pyhcis_utility.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/controller/home_controller.dart';
import '../../core/components/iconWidget/leading_widget.dart';

class CommentView extends GetView<HomeController> {
  CommentView({Key? key}) : super(key: key);
  var db = Get.find<FirebaseDb>();
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var time =
        controller.readTimestamp(data.createdTime!.millisecondsSinceEpoch);

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
                postBar(data, time),
                bodyTitle(),
              ]),
        );
      },
    );
  }

  PostBar postBar(PostOutput data, time) {
    return PostBar(
      onLongPress: null,
        text: data.message ?? "",
        userName: controller.usernameDetection(data, db),
        time: time,
        onTapLike: data.isLikeBloc ?? false ? null : () {},
        onTapComment: data.isCommentBloc ?? false ? null : () {},
        commentLenght: data.isCommentBloc ?? false ? null : "0",
        likeLenght: data.likes!.length.toString());
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