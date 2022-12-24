import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:psikoz/controller/post_controller.dart';
import 'package:psikoz/core/components/post/post_bar.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/utility/app/scroll_pyhcis_utility.dart';
import 'package:psikoz/view/alert/email_view.dart';
import 'package:psikoz/view/post/post_view.dart';

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
              ? Center(
                  child: Text("yükleniyor"),
                )
              : controller.postModel == null
                  ? Text("yük")
                  : ListView.builder(
                    physics: const ScrollPyhcisyUtilty.bouncAlways(),
                      itemBuilder: (context, index) {
                        var mode = controller.postModel?.data?[index];
                        return PostBar(
                          null,
                          null,
                          text: mode?.content ?? "",
                          userName: mode?.user?.username ?? "",
                          time: "",
                          onTapLike: null,
                          likeLength: "likeLenght",
                        );
                      },
                      itemCount: controller.postModel?.data?.length,
                    )),
        ));
  }

  @override
  void detach() {
    // TODO: implement detach
  }

  @override
  // TODO: implement keptAlive
  bool get keptAlive => throw UnimplementedError();
}
