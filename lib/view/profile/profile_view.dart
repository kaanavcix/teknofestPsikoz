import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/components/iconWidget/leading_widget.dart';
import 'package:psikoz/core/constants/app/app_constant.dart';
import 'package:psikoz/core/constants/app/app_size_constant.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/utility/app/gradient-utility.dart';
import 'package:psikoz/core/utility/app/padding_utility.dart';
import 'package:psikoz/core/utility/app/scroll_pyhcis_utility.dart';
import 'package:psikoz/core/utility/app/shape_border_utility.dart';
import 'package:psikoz/core/utility/app/sized_box_dummy.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';
import 'package:psikoz/controller/profile_controller.dart';
import 'package:psikoz/product/widgets/discovery_view.dart';
import 'package:psikoz/view/profile/settings_view.dart';

import '../../core/service/firebase/firebase_db.dart';
import '../../product/view/article_view_details.dart';
import '../../product/widgets/discovery_card.dart';
import 'tabpage/my_article_view.dart';
import 'widgets/profile_card.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var db = Get.find<FirebaseDb>();
    return Scaffold(
      body: scdeneme(db)
    );
  }

  CustomScrollView scdeneme3(FirebaseDb db) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        pinned: true,
        snap: true,
        actions: [Icon(Icons.abc)],
        floating: true,
        expandedHeight: 300,
        flexibleSpace: SafeArea(
            child: FlexibleSpaceBar(
            //  title: Text(db.user.first.username ??""),
              
          background: Padding(
            
            padding: const EdgeInsets.only(top:60.0),
            child: ProfileCard(
              imageUrl: "https://picsum.photos/200/300",
              controller: controller.tabController,
              claimsName: db.user.first.claimsName,
              description: db.user.first.description,
              firstName: db.user.first.firstName,
              username: db.user.first.username,
            ),
          ),
        )),
      ),
    ]);
  }

  Scaffold scdeneme(FirebaseDb db) {
    return Scaffold(
      appBar: appBar(),
      body: SizedBox(
        child: ListView(
          physics: ScrollPyhcisyUtilty.bouncAlways(),
          shrinkWrap: true,
          children: [
            ProfileCard(
              imageUrl: "https://picsum.photos/200/300",
              controller: controller.tabController,
              claimsName: db.user.first.claimsName,
              description: db.user.first.description,
              firstName: db.user.first.firstName,
              username: db.user.first.username,
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
