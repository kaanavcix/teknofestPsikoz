import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:psikoz/view/patient/post/post_article_view.dart';
import 'package:psikoz/view/patient/post/post_draw_view.dart';

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
          automaticallyImplyLeading: false,
          title: const Text("Forum"),
          actions: [
            IconButton(
              onPressed: () => Get.to(const PostArticleView()),
              icon: IconNames.plus.tosvgPictureConvert(null),
            ),
            IconButton(
                onPressed: () {
                  Get.to(PostDrawView());
                },
                icon: const Icon(
                  Icons.draw_outlined,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () => Get.to(GeneralControlView()),
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
                        var model = controller.postModel?.data?[index];
                        print(model);
                        return PostBar(
                          null,
                          null,
                          null,
                          text: model?.content ?? "",
                          userName: model?.username ?? "",
                          time: "",
                          category: model?.category ?? "",
                        );
                      },
                      itemCount: controller.postModel?.data?.length,
                    )),
        ));
  }
}
