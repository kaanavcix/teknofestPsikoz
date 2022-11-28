import 'package:flutter/material.dart';

import '../../constants/enums/Icon-enums.dart';
import '../../utility/app/gradient-utility.dart';
import '../../utility/embabed/embabed_utility.dart';

import 'package:get/get.dart';

class BottomNavigatior extends StatelessWidget {
  BottomNavigatior(
      {Key? key,
      required this.selectedItem,
      required this.onTap,
      required this.onTap1,
      required this.onTap2,
      required this.onTap3,
      required this.onTap4})
      : super(key: key);
  int selectedItem;
  void Function() onTap;
  void Function() onTap1;

  void Function() onTap2;
  void Function() onTap3;
  void Function() onTap4;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Container(
      color: Get.isDarkMode ? EmbabedUtility.darkBlack : Colors.white,
      height: 64,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconNormal(
                onTap: onTap,
                child: IconNames.feed.tosvgPictureConvert(selectedItem == 0
                    ? Get.theme.colorScheme.background
                    : Get.theme.colorScheme.surface)),
            IconNormal(
                onTap: onTap1,
                child: IconNames.search.tosvgPictureConvert(selectedItem == 1
                    ? Get.theme.colorScheme.background
                    : Get.theme.colorScheme.surface)),
            IconCircular(
              onTap: onTap2,
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: IconNames.plus.tosvgPictureConvert(Colors.white)),
            ),
            IconNormal(
                onTap: onTap3,
                child: IconNames.articles.tosvgPictureConvert(selectedItem == 3
                    ? Get.theme.colorScheme.background
                    : Get.theme.colorScheme.surface)),
            IconNormal(
                onTap: onTap4,
                child: IconNames.profile.tosvgPictureConvert(selectedItem == 4
                    ? Get.theme.colorScheme.background
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
