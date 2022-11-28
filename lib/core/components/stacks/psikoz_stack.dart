import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psikoz/core/constants/enums/image_enums.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';

import '../clippath/clip_path.dart';
class PsikozStack extends StatelessWidget {
  const PsikozStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipPath(
          clipBehavior: Clip.antiAlias,
          clipper: CustomClipPath(),
          child: Container(
            width: Get.width,
            height: 200,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              EmbabedUtility.socialblue,EmbabedUtility.socialPurple
            ])),
          )),
      Positioned(
        top: 0,
        bottom: 0,
        left: 0,
        right: 0,
        child: Center(
          child:  SvgPicture.asset(
            height: 100,
            width: 100,
      "assets/images/logo.svg",
      color: Colors.white,
      
      
    )
        ),
      ),
      SafeArea(
          child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {},
                child: Container(
                  child:  const Icon(
                    Icons.question_mark,
                    color: Colors.white,
                  ),
                  width: 50,
                  height: 50,
                  color: Colors.transparent,
                ),
              )))
    ]);
  }
}