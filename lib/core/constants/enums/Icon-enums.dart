import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

extension EnumSvgPicture on IconNames {
  tosvgPictureConvert(Color? color, {double width = 24, double height = 24}) {
    return SvgPicture.asset(
      "assets/Icon/$name.svg",
      color: color ?? (!Get.isDarkMode
          ? const Color.fromARGB(255, 0, 0, 0)
          : const Color.fromARGB(255, 255, 255, 255)),
      width: width,
      height: height,
    );
  }
  tosvgPictureConvertEmotion(Color? color, {double width = 24, double height = 24}) {
    return SvgPicture.asset(
      "assets/emotion/$name.svg",
      color: color ?? (!Get.isDarkMode
          ? const Color.fromARGB(255, 0, 0, 0)
          : const Color.fromARGB(255, 255, 255, 255)),
      width: width,
      height: height,
    );
  }

}

enum IconNames {
  alert,
  arrowleft,
  attachment,
  bookmark,
  camera,
  chevrondown,
  close,
  comment,
  dotsvertical,
  emoji,
  feed,
  gif,
  group,
  image,
  like,
  message,
  mic,
  plus,
  profile,
  search,
  send,
  settings,
  share,
  email,
  lock,
  articles,
  music,
  happy,
  normal,
  sad,
  stress,
  unhappy
}
