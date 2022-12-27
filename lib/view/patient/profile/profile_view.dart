import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/constants/app/app_constant.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/utility/app/padding_utility.dart';
import 'package:psikoz/core/utility/app/scroll_pyhcis_utility.dart';
import 'package:psikoz/core/utility/app/sized_box_dummy.dart';
import 'package:psikoz/controller/profile_controller.dart';
import '../../../controller/user_controller.dart';
import 'settings_view.dart';
import 'tabpage/my_article_view.dart';
import 'widgets/profile_card.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
     var control = Get.find<UserController>();
    
    return Scaffold(body: RefreshIndicator(
      onRefresh: () => control.getUserData(),
      child: scdeneme(control),));
  }

  Scaffold scdeneme(UserController control) {
    var mode = control.userModel?.data;
   
    return Scaffold(
      appBar: appBar(),
      body: SizedBox(
        child: ListView(
          physics: const ScrollPyhcisyUtilty.bouncAlways(),
          shrinkWrap: true,
          children: [
            ProfileCard(
              imageUrl: "https://picsum.photos/200/300",
              controller: controller.tabController,
              claimsName: mode?.isPatient ??true ? "":"Doktor",
              description: mode?.description ?? "",
              firstName:mode?.name ,
              username: mode?.username,

            ),
            const SizedBoxDummy.height(
              height: 5,
            ),
            Container(
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(28), bottom: Radius.circular(0)),
              ),
              child: Padding(
                  padding: PaddinUtilty.normalPadding(padding: 20).padding,
                  child: TabBarView(
                      controller: controller.tabController,
                      children: [
                        const MyArticleView(),
                        Text(
                          AppConstant.fallowArticle,
                          style: Get.textTheme.displaySmall,
                        ),
                        Text(
                          AppConstant.profileAnonim,
                          style: Get.textTheme.displaySmall,
                        )
                      ])),
            )
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Padding(
        padding: PaddinUtilty.horizontalPadding().padding,
      ),
      actions: [
        GestureDetector(
          onTap: () => Get.to(const SettingsView()),
          child: Padding(
              padding: PaddinUtilty.horizontalPadding(
                height: 20,
              ).padding,
              child: IconNames.dotsvertical.tosvgPictureConvert(null)),
        )
      ],
    );
  }

  RoundedRectangleBorder borderRadius() {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
    );
  }
}
