import 'package:flutter/material.dart';
import 'package:psikoz/core/components/comments/comments_bar.dart';
import 'package:psikoz/core/components/post/post_bar.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/init/theme/text_theme.dart';
import 'package:psikoz/core/service/model/post/post_model_output.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/product/controller/home_controller.dart';
import '../../core/components/iconWidget/leading_widget.dart';

class CommentView extends GetView<HomeController> {
   CommentView({required this.data ,Key? key}) : super(key: key);
    PostOutput data;

  @override
  Widget build(BuildContext context) {

    return GetBuilder(

      builder: (controller) {
       return sc(data);
      },
    );
  }

  Scaffold sc(argument) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.only(bottom: Get.mediaQuery.viewInsets.bottom),
          height: 55,
          child: CommentsBar(),
          color: EmbabedUtility.socialGray,
        ),
      ),
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: const LeadingWidget(),
          title: Text(
            "Post",
            style: grSTextB.copyWith(
              color: Colors.white,
            ),
          )),
      body: ListView(physics: NeverScrollableScrollPhysics(), children: [
        PostBar(
            likeLenght: argument.likeList!.length.toString(),
            onTapLike: () {
            //  controller.db.takeAndRemoveLike(argument.uidPost,
              //    argument.likeList ?? [], controller.db.auth);
            },
            onTapComment: () {},
            commentLenght: "0",
            userName: argument.userName ?? "",           
            text: argument.text ?? "",
            time: "10"),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "YORUMLAR",
                style:
                    grTertiary.copyWith(color: Colors.white, letterSpacing: 2),
              ),
              Text("En kısa sürede",
                  style: grTertiaryB.copyWith(
                      color: Colors.white, letterSpacing: 0)),
            ],
          ),
        ),
      ]),
    );
  }
}
