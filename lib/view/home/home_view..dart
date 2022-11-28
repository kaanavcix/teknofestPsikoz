import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/components/post/post_bar.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';

import 'package:psikoz/core/service/firebase/firebase_db.dart';
import 'package:psikoz/controller/home_controller.dart';
import 'package:psikoz/core/utility/app/scroll_pyhcis_utility.dart';
import 'package:psikoz/view/alert/email_view.dart';
import 'package:psikoz/view/home/comment_view.dart';
import 'package:psikoz/view/home/widgets/feel_bar.dart';

import 'widgets/message_icon_button.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    // ScrollController controller = ScrollController();
    var db = Get.find<FirebaseDb>();
    return Scaffold(
        appBar: appbar(db),
        body: SingleChildScrollView(
          physics: const ScrollPyhcisyUtilty.bouncAlways(),
          child: SizedBox(
            height: Get.height,
            child: Column(
              children: [
                const Expanded(flex: 4, child: FeelBar()),
                Obx(() => Expanded(flex: 16, child: postlist(db))),
              ],
            ),
          ),
        ));
  }

  Widget postlist(FirebaseDb db) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        var data = db.post[index];

        var time =
            controller.readTimestamp(data.createdTime!.millisecondsSinceEpoch);

        return GestureDetector(
          onTap: () => Get.to(() => CommentView(), arguments: data),
          child: PostBar(
              onLongPress: controller.usernameDetection(data, db) ==
                      data.username
                  ? (() {
                      showGeneralDialog(
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return Container(
                            color: Colors.blue,
                            height: 200,
                            width: 200,
                          );
                        },
                        transitionBuilder: (ctx, a1, a2, child) {
                          var curve = Curves.easeInOut.transform(a1.value);
                          return Transform.scale(
                              scale: curve, child: AlertDialog(
                                
                              ));
                        },
                        transitionDuration: const Duration(milliseconds: 300),
                      );
                    })
                  : null,
              text: data.message ?? "",
              userName: controller.usernameDetection(data, db),
              time: time,
              onTapLike: data.isLikeBloc ?? false ? null : () {},
              onTapComment: data.isCommentBloc ?? false ? null : () {},
              commentLenght: data.isCommentBloc ?? false ? null : "0",
              likeLenght: data.likes!.length.toString()),
        );
      },
      itemCount: db.post.length,
    );
  }

  AppBar appbar(FirebaseDb db) {
    return AppBar(
        actions: [
          MessageIconButton(
            onTap: () => Get.to(const MessageView()),
          )
        ],
        title: Obx(() => db.user.isEmpty
            ? const SizedBox.shrink()
            : Text(
                "${controller.frontText.value},${db.user.first.firstName}",
                style: Get.textTheme.bodyMedium,
              )));
  }
}
