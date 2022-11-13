import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ImageEnum { logo, brain }

extension ImageSvgConvertor on ImageEnum {
  toImagefromSvg() {
    SvgPicture.asset(
      "assets/images/logo.svg",
      color: Colors.white,
      
      
    );
  }
}
