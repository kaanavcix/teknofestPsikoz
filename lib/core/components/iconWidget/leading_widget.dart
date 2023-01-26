import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../constants/enums/Icon-enums.dart';
import '../../utility/embabed/embabed_utility.dart';
class LeadingWidget extends StatelessWidget {
  const LeadingWidget({
    Key? key,
  }) : super(key: key);

  final edgeInsets = const EdgeInsets.all(5);
  final edgeInsets2 = const EdgeInsets.all(15);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
          padding: edgeInsets,
          margin: edgeInsets2,
          decoration: BoxDecoration(
              border: Border.all(width: 0.4, color: Colors.white),
              color: Colors.transparent,
              shape: BoxShape.circle),
          child: IconNames.arrowleft.tosvgPictureConvert(
              EmbabedUtility.socialwhite,
              height: 16,
              width: 16)),
    );
  }
}

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    Key? key,
  }) : super(key: key);

  final edgeInsets = const EdgeInsets.all(5);
  final edgeInsets2 = const EdgeInsets.all(15);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
          padding: edgeInsets,
          margin: edgeInsets2,
          decoration: BoxDecoration(
              border: Border.all(width: 0.4, color: Colors.white),
              color: Colors.transparent,
              shape: BoxShape.circle),
          child: IconNames.settings.tosvgPictureConvert(
              EmbabedUtility.socialLightGray,
              height: 16,
              width: 16)),
    );
  }
}
