import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psikoz/core/constants/app/app_size_constant.dart';
import 'package:psikoz/core/constants/enums/Icon-enums.dart';
import 'package:psikoz/core/utility/app/padding_utility.dart';
import 'package:psikoz/core/utility/embabed/embabed_utility.dart';

import '../../../core/components/containers/face_container.dart';
import '../../../core/constants/app/app_constant.dart';

class FeelBar extends StatelessWidget {
  const FeelBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSizeConstant.profileCard80,
      color: EmbabedUtility.darkBlack,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: PaddinUtilty.bottomPadding(height: 8).padding,
              child: Text(
                AppConstant.feelHome,
                style: Get.textTheme.bodyMedium,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FaceContainer(
                  widget:Center(child:IconNames.stress.tosvgPictureConvertEmotion(null)),
                ),
                FaceContainer(
                  widget: 
                    IconNames.sad.tosvgPictureConvertEmotion(null),
                
                ),
                FaceContainer(
                  widget: IconNames.unhappy.tosvgPictureConvertEmotion(null),
                ),
                FaceContainer(
                  widget: IconNames.normal.tosvgPictureConvertEmotion(null),
                ),
                FaceContainer(
                  widget:IconNames.happy.tosvgPictureConvertEmotion(null),
                )
              ],
            )
          ],
        ),
      ),
    );
  }


  // bu kısmı düzenlemeyi unutma sakın
}
