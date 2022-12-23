import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/components/post/post_bar.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/view/alert/email_view.dart';
import 'package:psikoz/view/post/post_view.dart';

class PostForumView extends StatelessWidget {
  const PostForumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forum"),
        actions: [
          IconButton(
            onPressed: () => Get.to(PostView()),
            icon: IconNames.plus.tosvgPictureConvert(null),
          ),
          IconButton(
              onPressed: () => Get.to(MessageView()),
              icon: IconNames.email.tosvgPictureConvert(null))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return PostBar(null,null,
              text: "text",
              userName: "userName",
              time: "time",
              onTapLike: null,
             
              likeLength: "likeLenght",
              );
        },
      ),
    );
  }
}
