import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/utility/app/sized_box_dummy.dart';

import '../../../controller/profile_controller.dart';
import '../../../core/constants/app/app_size_constant.dart';
import '../../../core/service/firebase/firebase_db.dart';
import '../../../core/utility/app/gradient-utility.dart';
import '../../../core/utility/app/padding_utility.dart';
import '../../../core/utility/app/shape_border_utility.dart';
import '../../../core/utility/embabed/embabed_utility.dart';

class ProfileCard extends StatelessWidget {
   ProfileCard({
    this.imageUrl,
    this.username,
    this.firstName,
    this.description,
    this.claimsName,
    this.controller,
    Key? key,
    
  }) : super(key: key);

  
  final String? imageUrl;
  final String? username;
  final String? firstName;
  final String? description;
  final String? claimsName;
  TabController? controller;

  @override
  Widget build(BuildContext context) {
    var borderRadius2 = BorderRadius.circular(20);
    var borderRadius3 = BorderRadius.circular(22);
    return SizedBox(
      height: AppSizeConstant.cardSize300,
      child: Stack(children: [
        Padding(
          padding: PaddinUtilty.horizontalPadding(height: 30).padding,
          child: Card(
            elevation: AppSizeConstant.elevation8,
            shape: ShapeBorderUtilty.rectangleBorder,
            child: Container(
              height: AppSizeConstant.cardSize220,
              decoration: BoxDecoration(
                borderRadius: borderRadius2,
                color: Get.isDarkMode ? EmbabedUtility.darkBlack : Colors.white,
              ),
              child: Padding(
                padding:  PaddinUtilty.normalPadding().padding,
                child: Column(
                  children: [
                    Padding(
                      padding: PaddinUtilty.bottomPadding().padding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [imageContainer(borderRadius3), textColumn()],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        description ?? "",
                        overflow: TextOverflow.visible,
                        style: Get.textTheme.headlineSmall,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 30,
          child: Padding(
            padding: PaddinUtilty.horizontalPadding(height: 50).padding,
            child: Card(
              elevation: AppSizeConstant.elevation8,
              shape: ShapeBorderUtilty.rectangleBorder,
              child: Container(
                height: AppSizeConstant.profileCard80,
                decoration: BoxDecoration(
                    borderRadius: borderRadius2,
                    gradient: GradientUtility.socialGradient),
                child: Center(
                  child: TabBar(
                      controller: controller,
                      tabs: const [
                        Tab(text: "Article"),
                        Tab(text: "Follow"),
                        Tab(text: "Anonim")
                      ],
                      isScrollable: true,
                      indicator:
                          const BoxDecoration(color: Colors.transparent)),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Column textColumn() {
    return Column(
      children: [
        Text(
          "@${username ?? ""}",
          style: Get.textTheme.headlineLarge,
        ),
        const SizedBoxDummy.height(),
        Text(
          firstName ?? "",
          style: Get.textTheme.bodyMedium?.copyWith(letterSpacing: 0.5),
        ),
        const SizedBoxDummy.height(),
        Text(
          claimsName ?? "",
          style: Get.textTheme.headlineMedium,
        )
      ],
    );
  }

  Container imageContainer(BorderRadius borderRadius3) {
    return Container(
      height: AppSizeConstant.profileCard80,
      width: AppSizeConstant.profileCard80,
      decoration: BoxDecoration(
          borderRadius: borderRadius3,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageUrl ?? "https://picsum.photos/200/300",
              )),
          color: Colors.blue),
    );
  }
}
