import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding/register_controller.dart';
import '../../../core/constants/app/app_constant.dart';
import '../../../core/constants/enums/Icon-enums.dart';
import '../../../core/utility/embabed/embabed_utility.dart';

class RegisterAppBar extends StatelessWidget with PreferredSizeWidget {
  RegisterAppBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  RegisterController controller;

  @override
  Widget build(BuildContext context) {
    const edgeInsets = EdgeInsets.all(5);
    const edgeInsets2 = EdgeInsets.all(15);
    return AppBar(
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          controller.currentIndex.value = 0;
          Get.back();
        },
        child: Container(
            padding: edgeInsets,
            margin: edgeInsets2,
            decoration: BoxDecoration(
                border: Border.all(width: 0.4, color: Colors.white),
                color: Colors.transparent,
                shape: BoxShape.circle),
            child: IconNames.arrowleft.tosvgPictureConvert(
                EmbabedUtility.socialLightGray,
                height: 16,
                width: 16)),
      ),
      title: Text(
        AppConstant.registerTextButton,
        style: Get.textTheme.bodyLarge,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
