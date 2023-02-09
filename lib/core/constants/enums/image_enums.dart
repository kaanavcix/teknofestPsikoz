import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

enum ImageEnum { logo, brain }

extension ImageSvgConvertor on ImageEnum {
  tosvgPictureConvert(Color? color, {double width = 24, double height = 24}) {
    return SvgPicture.asset(
      "assets/images/$name.svg",
      color: color ??
          (!Get.isDarkMode
              ? const Color.fromARGB(255, 0, 0, 0)
              : const Color.fromARGB(255, 255, 255, 255)),
      width: width,
      height: height,
    );
  }
}
