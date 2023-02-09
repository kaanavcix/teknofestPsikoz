import 'package:flutter/material.dart';
import 'package:psikoz/core/constants/enums/image_enums.dart';

import '../../constants/enums/Icon-enums.dart';
import '../../utility/app/gradient-utility.dart';
import '../../utility/embabed/embabed_utility.dart';

import 'package:get/get.dart';

class BottomNavigatior extends StatelessWidget {
  BottomNavigatior({
    Key? key,
    required this.selectedItem,
    required this.onTap,
    required this.onTap1,
    required this.onTap2,
  }) : super(key: key);
  int selectedItem;
  void Function() onTap;
  void Function() onTap1;
  void Function() onTap2;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Container(
      color: Get.isDarkMode ? EmbabedUtility.darkBlack : Colors.white,
      height: kToolbarHeight,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconNormal(
                onTap: onTap,
                child: IconNames.feed.tosvgPictureConvert(selectedItem == 0
                    ? EmbabedUtility.socialwhite
                    : Get.theme.colorScheme.surface)),
            IconNormal(
              onTap: onTap1,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ImageEnum.logo.tosvgPictureConvert(selectedItem == 1
                    ? EmbabedUtility.socialwhite
                    : Get.theme.colorScheme.surface),
              ),
            ),
            
            IconNormal(
                onTap: onTap2,
                child: IconNames.profile.tosvgPictureConvert(selectedItem == 2
                    ? EmbabedUtility.socialwhite
                    : Get.theme.colorScheme.surface)),
          ]),
    ));
  }
}

// ignore: must_be_immutable
class IconCircular extends StatelessWidget {
  Widget? child;
  void Function()? onTap;
  IconCircular({Key? key, required this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: GradientUtility.socialGradient,
          ),
          child: child),
    );
  }
}

class IconNormal extends StatelessWidget {
  Widget child;
  void Function()? onTap;
  IconNormal({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: child,
    );
  }
}
