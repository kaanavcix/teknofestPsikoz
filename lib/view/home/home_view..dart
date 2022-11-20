import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/components/post/post_bar.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/constants/enums/lottie_enums.dart';
import 'package:psikoz/core/init/theme/text_theme.dart';
import 'package:psikoz/core/service/firebase/firebase_db.dart';
import 'package:psikoz/core/utility/app/gradient-utility.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/product/controller/home_controller.dart';
import 'package:psikoz/view/alert/email_view.dart';
import 'package:psikoz/view/home/comment_view.dart';

import '../../core/components/containers/face_container.dart';
import '../../core/service/model/post/post_model_output.dart';

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
          child: SizedBox(
            height: Get.height,
            child: Column(
              children: [
               Expanded(flex: 3,child: topbar()),
              
                Expanded(flex:17 ,child: postlist(db)),
              ],
            ),
          ),
        ));
  }

  Widget postlist(FirebaseDb db) {
    return ListView.builder(
      physics: const  NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        var data = db.post[index];

        var time = controller
            .readTimestamp(data.createdTime!.millisecondsSinceEpoch);

        return GestureDetector(
          onTap: () => Get.to(CommentView(
            data: data,
          )),
          child: PostBar(
              text: data.message ?? "",
              userName: usernameDetection(data, db),
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

  BouncingScrollPhysics scroll() =>
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());

  Widget topbar() {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Bugün Kendinizi nasıl hissediyorsunuz",
              style: grBodyB,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FaceContainer(
                widget: const Icon(Icons.tag_faces_outlined),
              ),
              FaceContainer(
                widget: const Icon(
                  Icons.tag_faces_outlined,
                ),
              ),
              FaceContainer(
                widget: const Icon(Icons.tag_faces_outlined),
              ),
              FaceContainer(
                widget: const Icon(Icons.tag_faces_outlined),
              ),
              FaceContainer(
                widget: const Icon(Icons.tag_faces_outlined),
              )
            ],
          )
        ],
      ),
    );
  }

  AppBar appbar(FirebaseDb db) {
    return AppBar(
        actions: [iconButton()],
        title: Obx(() => db.user.isEmpty
            ? const SizedBox.shrink()
            : Text(
                "${controller.frontText.value},${db.user.first.firstName}",
                style: Get.textTheme.bodyMedium,
              )));
  }

  GestureDetector iconButton() {
    return GestureDetector(
      onTap: () => Get.to(MessageView()),
      child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 0.4)),
          child: IconNames.message.tosvgPictureConvert(null)),
    );
  }

  usernameDetection(PostOutput data, FirebaseDb db) {
    if (int.parse(db.user.first.claimsId ?? "1") >= 3) {
      return data.username ?? "";
    } else if (int.parse(db.user.first.claimsId ?? "1") <= 3) {
      return data.isAnonim ?? true ? data.anonimname : data.username;
    } else {
      return data.anonimname;
    }
  }
}
