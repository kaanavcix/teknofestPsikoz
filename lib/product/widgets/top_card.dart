import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/enums/Icon-enums.dart';
import '../../core/utility/app/gradient-utility.dart';

class TopCard extends StatelessWidget {
  TopCard({
    this.subText,
    this.topText,
    Key? key,
  }) : super(key: key);

  String? topText;
  String? subText;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Container(
        height: kToolbarHeight,
        width: Get.width * 0.9,
        decoration: BoxDecoration(
            gradient: GradientUtility.dicoverGradient,
            borderRadius: BorderRadius.circular(9)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconNames.music.tosvgPictureConvert(null),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  topText ?? "",
                  style: Get.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(subText ?? "" , 
                style: Get.textTheme.bodyLarge
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
