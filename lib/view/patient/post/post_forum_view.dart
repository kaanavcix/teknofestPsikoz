import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';


import '../../../controller/post_controller.dart';
import '../../../core/components/post/post_bar.dart';
import '../../../core/constants/enums/Icon-enums.dart';
import '../../../core/utility/app/scroll_pyhcis_utility.dart';
import 'email_view.dart';
import 'comment_view.dart';
import 'post_view.dart';

class PostForumView extends GetView<PostController> {
  PostForumView({super.key});

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
        body: RefreshIndicator(
          onRefresh: () => controller.getPosts(),
          child: Obx(() => controller.isLoading.value
              ? const Center(
                  child: Text("yükleniyor"),
                )
              : controller.postModel == null
                  ? Text("yük")
                  : ListView.builder(
                      physics: const ScrollPyhcisyUtilty.bouncAlways(),
                      itemBuilder: (context, index) {
                        var mode = controller.postModel?.data?[index];
                        return PostBar(
                          mode!.comment!.isEmpty ? null:() => Get.to(CommentView(post: mode)) ,
                          null,
                          text: mode.content ?? "",
                          userName: mode.username ?? "",
                          time: "",
                        category: mode.category ?? "",

                        );
                      },
                      itemCount: controller.postModel?.data?.length,
                    )),
        ));
  }
}
