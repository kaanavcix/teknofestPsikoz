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
    var userModel = control.userModel!.data;
    return SafeArea(
      child: Scaffold(
          body: RefreshIndicator(
              onRefresh: () => control.getUserData(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high,
                                  image: NetworkImage(
                                      "https://picsum.photos/200/300"))),
                          width: Get.width,
                        ),
                        const Positioned(
                            bottom: -60,
                            left: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              maxRadius: 60,
                              //    child: Container(decoration: BoxDecoration(shape: ),child: Image.network("https://picsum.photos/200/300",cacheHeight: 120,cacheWidth: 120,fit: BoxFit.cover,)),
                              backgroundImage: AssetImage(
                                "assets/images/logo.png",
                              ),
                              foregroundImage: NetworkImage(
                                "https://picsum.photos/200/300",
                              ), //TODO: WE MUST SET PHOTO QUALİTY
                            )),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              icon: const Icon(
                                Icons.more_horiz_outlined,
                              ),
                              onPressed: () => Get.to(SettingsView()),
                            ))
                      ],
                    ),
                    const SizedBoxDummy.height(
                      height: 70,
                    ),
                    Padding(
                      padding: PaddinUtilty.bottomPadding(
                        height: 8,
                      ).padding,
                      child: Text("${userModel!.name}",
                          style: Get.textTheme.bodyLarge!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1)),
                    ),
                    Text(
                      userModel.description.toString(),
                      style: Get.textTheme.titleSmall,
                    ),

                    Placeholder(
                      fallbackWidth: Get.width,
                      fallbackHeight: Get.height - 200,
                    )
                    //TODO:Tasarım geldiğinde yapılacaktır
                  ],
                ),
              ))),
    );
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
              claimsName:
                  (mode?.isPatient == "1" ? true : false) ? "" : "Doktor",
              description: mode?.description ?? "",
              firstName: mode?.name,
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
      automaticallyImplyLeading: false,
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
